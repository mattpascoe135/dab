function [ output ] = coarse_freq_shift(x,threshold)
    %add data with itself so that filter doesnt start at zero and then move
    %up unless it is suppose too.
    data = [x,x];

    %Put data through moving-average filter
    input_data = abs(data).^2;
    average_length = 10;
    
    B = 1/average_length*ones(average_length,1);
    filtered = filter(B,1,input_data);
    filtered = abs(filtered);
    
    %Shorten the data
    filtered = filtered(length(x):length(filtered));
    
    %locate the first null
    filtered = [filtered, filtered];
    null_start = 1;
    for idx = 1:length(filtered)
        if(filtered(idx) < threshold)
            null_start = idx;
            break;
        end
    end
    
    %Locate the actual signal without the null
    sig_start = 1;
    for idx = null_start+50:length(filtered)
        if(filtered(idx) > threshold)
            sig_start = idx-1;
            break;
        end
    end    
    sig_end = sig_start + 1536;
    
%     disp(['Starts at: ' num2str(sig_start) ', ends at: ' num2str(sig_end)]);
    output = data(sig_start:sig_end);
end

