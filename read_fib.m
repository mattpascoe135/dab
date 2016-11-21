function [ output ] = read_fib( fig_data )
    for idx = 1:12
%     for idx = 1:12
        fig = fig_data(idx, :);
        
        %analyse the data
        found = 0;    
        iidx = 1;
        while((found==0))
            header = fig(iidx:iidx+7);
            if(bi2de(header) == 255)
                disp('Found END packet')
                disp(' ')
                found=1;
            else
                type = bi2de(header(1:3),'left-msb');
                length = 8 * bi2de(header(4:end),'left-msb');

                if(type == 0)
                    disp('Type 0 Packet')
                    data = fig(iidx+8:iidx+8+length-1);
                    
                    %Deconstruct packet
                    cn =        bi2de(data(1),'left-msb');
                    oe =        bi2de(data(2),'left-msb');
                    pd =        bi2de(data(3),'left-msb');
                    extension = bi2de(data(4:8),'left-msb');
                    field =     data(9:end);
                   
                    %Analyse data
                    process_type0(cn, oe, pd, extension, field)
                    
                    iidx = iidx+8+length;
                elseif(type == 1)
                    disp('Type 1 Packet')
                    data = fig(iidx+8:iidx+8+length-1);
                    
                    %Deconstruct packet
                    charset = data(1:4);
                    oe = data(5);
                    extension = bi2de(data(6:8),'left-msb');
                    field = data(9:end);
                    
                    indentifier_field = field(1:end-(16+16*8));
                    character_field = bintostring(field((end-(16+16*8)+1):end-16));
                    character_flag_field = field(end-15:end);

                    %Process data
                    process_type1(charset, oe, extension, indentifier_field, character_field, character_flag_field);
                    
                    
                    iidx = iidx+8+length;
                elseif(type == 2)
                    disp('Type 2 Packet')
                    data = fig(iidx+8:iidx+8+length-1);
                    
                    %Deconstruct packet
                    toggleflag = data(1);
                    segmentidx = data(2:4);
                    oe = data(5);
                    extension = data(6:8);
                    field = data(9:end);

                    %Analyse data
                    
                    iidx = iidx+8+length;
                elseif(type == 3)
                    disp('Type 3 Packet - Should be RESERVED')
                elseif(type == 4)
                    disp('Type 4 Packet - Should be RESERVED')
                elseif(type == 5)
                    disp('Type 5 Packet')
                    data = fig(iidx+8:iidx+8+length-1);
                    
                    %Deconstruct packet
                    d1 = data(1);
                    d2 = data(2);
                    tcid = data(3:5);
                    extension = data(6:8);
                    field(9:end);

                    %Analyse data
                    
                    iidx = iidx+8+length;
                elseif(type == 6)
                    disp('Type 6 Packet')
                    data = fig(iidx+8:iidx+8+length-1);
                    
                    %Deconstruct packet

                    %Analyse data
                    
                    iidx = iidx+16+length;
                elseif(type == 7)
                    disp('Type 7 Packet - Should be Reserved')
                else 
                    disp('ERROR: FIG type no. error') 
                end
            end
        end
    end
end