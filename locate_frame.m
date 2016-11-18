function [ frame ] = locate_frame( x, start, threshold )
    input_data = abs(x).^2;
    average_length = 50;
    
    %Locate a null from the start location
    sigNull = 0;
    for idx=start:(length(input_data)-average_length)
        above = false;
        for j=0:average_length-1
            if(input_data(idx+j) > threshold)
                above = true;
                break;
            end
        end
        if(above == false)
            sigNull = idx;
            break;
        end
    end
    disp(['NULL starts at: ' num2str(sigNull)]);
    
    
    
    %Locate the point where the signal starts again
    sigStart = 0;
    for idx=sigStart:(length(input_data)-average_length)
        above = true;
        for j=0:average_length-1
            if(input_data(idx+j) > threshold)
                above = false;
                break;
            end
        end
        if(above == true)
            sigStart = idx;
            break;
        end
    end
    disp(['Signal starts at: ' num2str(sigStart) ', know that it should start at: 43222']);
    
    
    
    %Locate the point where the signal ends, round the end location off to
    %ensure that the data is the correct length
    sigEnd=0;
    for idx=sigStart:length(input_data)
        average = sum(input_data(idx:idx+average_length));
        if(average < threshold)
            sigEnd = idx;
            break;
        end
    end
    sigEnd = sigStart + 76*2552;
    
    disp(['Signal ends at: ' num2str(sigEnd) ', know that it should end at: 237174']);
    
    
    frame = x(sigStart:sigEnd);
end

