function [ output_args ] = process_type0( cn, oe, pd, extension, field )
    disp(['C/N: ' num2str(bi2de(cn,'left-msb')) ', OE: ' num2str(bi2de(oe,'left-msb')) ', P/D: ' num2str(bi2de(pd,'left-msb')) ', Extension: ' num2str(extension)]) 
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Process data depending on the extension number        %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if extension == 0
        
        
        
    elseif extension == 1
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Basic sub-channel organisation                        %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        done = 0;
        idx = 1;
        while (done == 0)
            %Read header of packet to get sizing
            subchld = field(idx:idx+5);
            start_address = field(idx+6:idx+15);
            shortlong = field(idx+16);
            
            %0 = short, 1 = long
            if shortlong == 0
                data = field(idx+17:idx+17+6);
                switch_table = data(1);
                table_index = data(2:end);
                
                %Perform updates
                
                idx = idx+17+7; 
            else
                data = field(idx+17:idx+17+14);
                option = data(1:3);
                proection_lvl = data(4:5);
                subchannel_size = data(6:end);
                
                %Perform updates
                
                idx = idx+17+15;                 
            end
            if(idx >= length(field))
                done = 1;
            end
        end
    elseif extension == 2
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Basic service and service component definition        %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        done = 0;
        idx = 1;
        while (done == 0)
            %Read header of each service field
            ecc = 0;
            country_id = 0;
            service_ref = 0;
            if pd == 0
                %Prcoess SId
                sid = field(idx:idx+15);
                rem_data = field(idx+16:end);
                country_id = sid(1:4);
                service_ref = sid(5:end);

                idx = idx+16;
            else
                %Prcoess SId
                sid = field(idx:idx+31);
                rem_data = field(idx+32:end);
                ecc = sid(1:8);
                country_id = sid(9:12);
                service_ref = sid(13:end);                

                idx = idx+32;
            end
            local_flag = rem_data(1);
            caid = rem_data(2:4);
            num_service_comp = bi2de(rem_data(5:8),'left-msb');
            serv_desc = rem_data(9:(9+(16*num_service_comp)-1));
            
            %Process service comp. description
            for iidx = 1:num_service_comp
                serv_comp = serv_desc(1:16);
                serv_desc = serv_desc(17:end);
                
                tmid = bi2de(serv_comp(1:2),'left-msb');
                data = serv_comp(3:end);
                if(tmid == 0)
                    %MSC stream audio
                    ascty = data(1:6);
                    subchld = data(7:12);
                    ps = data(13);
                    ca_flag = data(14);
                    
                    %Update/Change data
                    
                    
                elseif(tmid == 1)
                    %MSC stream data
                    dscty = data(1:6);
                    subchld = data(7:12);
                    ps = data(13);
                    ca_flag = data(14);
                    
                    %Update/Change data
                    
                    
                elseif(tmid == 2)
                    %FIDC
                    ascty = data(1:6);
                    fidcid = data(7:12);
                    ps = data(13);
                    ca_flag = data(14);
                    
                    %Update/Change data
                    
                elseif(tmid == 3)
                    %MSC packet data
                    scid = data(1:12);
                    ps = data(13);
                    ca_flag = data(14);
                    
                    %Update/Change data
                    
                end
            end            
            
            %Increment data
            idx = idx+9+(16*num_service_comp)-1;
            if(idx >= length(field))
                done = 1;
            end
        end
    elseif extension == 3
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 4
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 5
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 6
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 7
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 8
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Service component global definition                   %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        done = 0;
        idx = 1;
        while (done == 0)
            if(pd == 0)
                sid = field(idx:idx+15);
                rem_data = field(idx+16:end);
                
                idx = idx+16;
            else
                sid = field(idx:idx+31);
                rem_data = field(idx+32:end);
                
                idx = idx+32;
            end
            ext_flag = bi2de(rem_data(1),'left-msb');
            rfa = rem_data(2:4);
            scids = rem_data(5:8);
            idx=idx+8;
            
            %Get the long/short flag, to determine which type of data is
            %stored in the packet.
            ls_flag = bi2de(rem_data(9),'left-msb');
            if(ls_flag == 0)
                mscfic_flag = rem_data(10);
                subchdl_fidcld = rem_data(11:16);
                
                idx = idx+8;
            else
                rfa = rem_data(10:12);
                scid = rem_data(13:24);
                
                idx = idx+16;
            end
            
            %If extenstion flag is high, then the 8-bit Rfa field is
            %present.
            if(ext_flag == 1)
                rfa = rem_data(1:8);
                
                idx=idx+8;
            end
            
            %Update system based on the incoming data
            
            
            if(idx >= length(field))
                done = 1;
            end
        end
    elseif extension == 9
        disp(field)
        ext_flag = bi2de(field(1),'left-msb');
        lto_unique = field(2);
        ensemble_lto = field(3:8);
        ensemble_ecc = field(9:16);
        inter_table = field(17:24);
        if(ext_flag == 1)
            ext_field = field(25:end);
            
            %Process sub-data
            
        end
        
        %Process data
        time = 0;
        if(lto_unique == 0)
            
        else 
            
        end
        
    elseif extension == 10
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 11
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 12
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 13
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 14
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 15
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 16
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 17
        
    elseif extension == 18
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 19
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 20
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 21
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 22
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 23
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 24
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 25
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 26
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 27
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 28
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 29
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 30
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 31
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    elseif extension == 32
        disp(['Extension ' num2str(extension) ' is currently unhandled, need to look at analysing the data'])        
    end

end

