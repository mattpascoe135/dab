clear
close all

threshold = 0.1; start = 1;
cp_len = 100;
sig_lengt = 2048;

%4.3.1 DAB-9A
x = read_complex_byte('dab2-B.bin');

%Locate frame
nullStart =     lookForNull(x, start, threshold);
sigStart =      lookForSig(x, nullStart, threshold);
sigStart =      43222;
sigEnd =        lookForNull(x, sigStart, threshold) -1;
sigEnd =        sigStart + 76*2552;
start=sigEnd;
frame = x(sigStart:sigEnd);
frame = frame(1:(floor(length(frame)/76)*76));

%Obtain symbols from OFDM
mat = transpose(reshape(frame, length(frame)/76, 76));

%Use the cyclic prefix to fine frequency shift
tfft = mat(:, 101:2047+101);
for idx = 1:76
    data(idx, :) = fftshift(fft((tfft(idx, :))));
  
    %Use moving average to locate the nulls and actual data to do coarse
    %frequency shift instead of hardcoding.
    symbol(idx,:) = data(idx, 257:257+1536);
end

%Remove differnetial coding
act_tfft = symbol(2:end,:) .* conj(symbol(1:end-1,:));


%De-scramble the data
map = makeFreqMap();
unscrambled = zeros(size(act_tfft));
ii=[-768:-1 1:768];
for idx = ii
    location = find(map==idx);    
    unscrambled(:, location) = act_tfft(:, idx+769);
end
unscrambled = unscrambled(:, 1:length(unscrambled)-1);


%Decode the QPSK data
for idx = 1:75
    realData = real(unscrambled(idx, :));
    imagData = imag(unscrambled(idx, :));
    
    data = [ BPSK_demod(realData) ; BPSK_demod(imagData) ];
    bits(idx,:) = reshape(data.', 1, numel(data));
end


%Puncture code for PI=16
PC1 = [1,1,1,0, 1,1,1,0, 1,1,1,0, ...
            1,1,1,0, 1,1,1,0, 1,1,1,0, ...
            1,1,1,0, 1,1,1,0];
%Puncture code for PI=15
PC2 = [1,1,1,0, 1,1,1,0, 1,1,1,0, ...
            1,1,1,0, 1,1,1,0, 1,1,1,0, ...
            1,1,1,0, 1,1,0,0];
%Puncture code for PI=8
PC3 = [1,1,0,0, 1,1,0,0, 1,1,0,0, ...
            1,1,0,0, 1,1,0,0, 1,1,0,0];

output = [];
%Read the FIC data, and de-puncture the data
for idx=1:3:3
    longFIC = [ bits(idx,:), bits(idx+1,:), bits(idx+2,:) ];
    FIC = reshape(longFIC, length(longFIC)/4, 4).';
    
    %Split data into three blocks
    block1 = FIC(:, 1:2016);
    block2 = FIC(:, 2017:2017+276-1);
    block3 = FIC(:, 2017+276:end);
    
    %Decode first block with PI=16
    block1_depunc = zeros(4, 2688);
    block2_depunc = zeros(4, 384);
    block3_depunc = zeros(4, 24);
    index = 1;
    for iidx = 1:length(PC1):length(block1_depunc)
        for iiidx = 0:length(PC1)-1
            if(PC1(iiidx+1) == 1)
                block1_depunc(:, iidx+iiidx) = block1(:, index);
                index = index + 1;
            end
        end
    end
    index = 1;
    for iidx = 1:length(PC2):length(block2_depunc)
        for iiidx = 0:length(PC2)-1
            if(PC2(iiidx+1) == 1)
                block2_depunc(:, iidx+iiidx) = block2(:, index);
                index = index + 1;
            end
        end
    end
    index = 1;
    for iidx = 1:length(PC3):length(block3_depunc)
        for iiidx = 0:length(PC3)-1
            if(PC3(iiidx+1) == 1)
                block3_depunc(:, iidx+iiidx) = block3(:, index);
                index = index + 1;
            end
        end
    end
    depunc_data = [block1_depunc, block2_depunc, block3_depunc];

    %Perform Viterbi decoding
    g = [133 171 145 133];
    d=7;    
    trellis = poly2trellis(d, g);
    output1 = vitdec(depunc_data(1,:), trellis, d*5, 'trunc', 'hard');
    output2 = vitdec(depunc_data(2,:), trellis, d*5, 'trunc', 'hard');
    output3 = vitdec(depunc_data(3,:), trellis, d*5, 'trunc', 'hard');
    output4 = vitdec(depunc_data(4,:), trellis, d*5, 'trunc', 'hard');
    
    %Remove energy dispersal
    energyMap = makeEnergyDisp(length(output1));
    act_output1 = xor(output1, energyMap);
    act_output2 = xor(output2, energyMap);
    act_output3 = xor(output3, energyMap);
    act_output4 = xor(output4, energyMap);
        
    output = [act_output1 ; act_output2 ; act_output3 ; act_output4];
    fic = output(:, 1:768);
    
    %Regroup data into FIB's and check each CRC
    tmp_fib = reshape(fic.', 1, numel(fic));
    fib = reshape(tmp_fib, 256, length(tmp_fib)/256).';
    for iidx = 1:length(tmp_fib)/256
        crc = dec2hex(comp_crc16(conv_bi2de(fib(iidx, 1:240))));
        act_crc = binaryVectorToHex(fib(iidx,241:256));
        if(strcmp(crc, act_crc)) 
            disp(['Got ' (act_crc) ' for FIB ' num2str(iidx) '. Calcualted CRC: ' (crc)])
        else
            disp(['ERROR: Got ' (act_crc) ' for FIB ' num2str(iidx) '. Calcualted CRC: ' (crc)])
        end
    end
    fib = fib(:, 1:240);

    %Process the FIB data
    read_fib(fib);    
end


%Read MSC
