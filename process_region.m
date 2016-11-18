function [ output_args ] = process_region( ecc, country_id )
    ecc_hex = binaryVectorToHex(ecc);
    country_id_hex = binaryVectorToHex(country_id);
    
    if(ecc_hex == 'F0')
        if(country_id_hex == '01')
            disp('Country is: Australia - Capital Cities (Commercial an commuinity broadcasters)');
        elseif(country_id_hex == '02')
            disp('Country is: Australia - Regional NSW and ACT');
        elseif(country_id_hex == '03')
            disp('Country is: Australia - Capital Cities (National broadcasters)');
        elseif(country_id_hex == '04')
            disp('Country is: Australia - Regional QLD');
        elseif(country_id_hex == '05')
            disp('Country is: Australia - Regional SA and NT');
        elseif(country_id_hex == '06')
            disp('Country is: Australia - Regional WA');
        elseif(country_id_hex == '07')
            disp('Country is: Australia - Regional Victorial and Tasmania');
        end
    else
        disp('Have not set this region yet');
    end


end

