function [ frame, endSig] = locate_frame( x, start, high_thres, low_thres )
    input_data = abs(x).^2;
    average_length = 50;
    
    B = 1/average_length*ones(average_length,1);
    filtered = filter(B,1,input_data);
    filtered = abs(filtered);
    
    %Locate NULL
    nullSig = start;
    for idx = start:length(filtered)
%         disp(['idx: ' num2str(idx) ', corresponds to: ' num2str(filtered(idx))]);
        if(filtered(idx) <= low_thres)
            nullSig = idx;
            break;
        end
    end
    
    %Locate beginning of the signal
    startSig = nullSig;
    for idx = nullSig:length(filtered)
        if(filtered(idx) > high_thres)
            startSig = idx;
            break;
        end
    end
    
    %Locate the end of the signal
    endSig = startSig+1000;
    for idx = startSig:length(filtered)
        if(filtered(idx) <= low_thres)
            endSig = idx;
            break;
        end
    end
    
    %Round the end off to the nearest OFDM symbol
    endSig = startSig + round((endSig - startSig)/2552)*2552-1;
    disp(['Sig starts at: ' num2str(startSig) ', and ends at: ' num2str(endSig)]);
    frame = x(startSig:endSig);
end

