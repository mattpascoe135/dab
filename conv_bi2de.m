function [ data ] = conv_bi2de( input )
    %find new length
    newL = ceil(length(input)/8)*8;
    
    padded = zeros(1, newL);
    padded(end-length(input)+1:end) = input;
    
    data = [];
    for idx = 1:length(padded)/8
        if(idx ~= 1)
            tmp1 = padded((idx-1)*8+1:(idx-1)*8+8);
            data(idx) = bi2de(tmp1, 'left-msb');
        else
            tmp1 = padded(idx:idx+7);
            data(idx) = bi2de(tmp1, 'left-msb');
        end
    end    
end

