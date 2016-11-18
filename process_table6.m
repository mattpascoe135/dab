function [ sub_channel_size, protection_level, bit_rate ] = process_table6( index )
    if(index == 0)
        sub_channel_size = 16;
        protection_level = 5;
        bit_rate = 32;
        return;
    elseif(index == 1)
        sub_channel_size = 21;
        protection_level = 4;
        bit_rate = 32;
        return;        
    elseif(index == 2)
        sub_channel_size = 24;
        protection_level = 3;
        bit_rate = 32;
        return;
    elseif(index == 3)
        sub_channel_size = 29;
        protection_level = 2;
        bit_rate = 32;
        return;
    elseif(index == 4)
        sub_channel_size = 35;
        protection_level = 1;
        bit_rate = 32;
        return;
    elseif(index == 5)
        sub_channel_size = 24;
        protection_level = 5;
        bit_rate = 32;
        return;
    elseif(index == 6)
        sub_channel_size = 29;
        protection_level = 4;
        bit_rate = 48;
        return;
    elseif(index == 7)
        sub_channel_size = 35;
        protection_level = 3;
        bit_rate = 48;
        return;
    elseif(index == 8)
        sub_channel_size = 42;
        protection_level = 2;
        bit_rate = 48;
        return;
    elseif(index == 9)
        sub_channel_size = 52;
        protection_level = 1;
        bit_rate = 48;
        return;
    elseif(index == 10)
        sub_channel_size = 29;
        protection_level = 5;
        bit_rate = 56;
        return;
    elseif(index == 11)
        sub_channel_size = 35;
        protection_level = 4;
        bit_rate = 56;
        return;
    elseif(index == 12)
        sub_channel_size = 42;
        protection_level = 3;
        bit_rate = 56;
        return;
    elseif(index == 13)
        sub_channel_size = 52;
        protection_level = 2;
        bit_rate = 56;
        return;
    elseif(index == 14)
        sub_channel_size = 32;
        protection_level = 5;
        bit_rate = 64;
        return;
    elseif(index == 15)
        sub_channel_size = 42;
        protection_level = 4;
        bit_rate = 64;
        return;
    elseif(index == 16)
        sub_channel_size = 48;
        protection_level = 3;
        bit_rate = 64;
        return;
    elseif(index == 17)
        sub_channel_size = 58;
        protection_level = 2;
        bit_rate = 64;
        return;
    elseif(index == 18)
        sub_channel_size = 70;
        protection_level = 1;
        bit_rate = 64;
        return;
    elseif(index == 19)
        sub_channel_size = 40;
        protection_level = 5;
        bit_rate = 80;
        return;
    elseif(index == 20)
        sub_channel_size = 52;
        protection_level = 4;
        bit_rate = 80;
        return;
    elseif(index == 21)
        sub_channel_size = 58;
        protection_level = 3;
        bit_rate = 80;
        return;
    elseif(index == 22)
        sub_channel_size = 70;
        protection_level = 2;
        bit_rate = 80;
        return;
    elseif(index == 23)
        sub_channel_size = 84;
        protection_level = 1;
        bit_rate = 80;
        return;
    elseif(index == 24)
        sub_channel_size = 48;
        protection_level = 5;
        bit_rate = 96;
        return;
    elseif(index == 25)
        sub_channel_size = 58;
        protection_level = 4;
        bit_rate = 96;
        return;
    elseif(index == 26)
        sub_channel_size = 70;
        protection_level = 3;
        bit_rate = 96;
        return;
    elseif(index == 27)
        sub_channel_size = 84;
        protection_level = 2;
        bit_rate = 96;
        return;
    elseif(index == 28)
        sub_channel_size = 104;
        protection_level = 1;
        bit_rate = 96;
        return;
    elseif(index == 29)
        sub_channel_size = 58;
        protection_level = 5;
        bit_rate = 112;
        return;
    elseif(index == 30)
        sub_channel_size = 70;
        protection_level = 4;
        bit_rate = 112;
        return;
    elseif(index == 31)
        sub_channel_size = 84;
        protection_level = 3;
        bit_rate = 112;
        return;
    elseif(index == 32)
        sub_channel_size = 104;
        protection_level = 2;
        bit_rate = 112;
        return;
    elseif(index == 33)
        sub_channel_size = 64;
        protection_level = 5;
        bit_rate = 128;
        return;
    elseif(index == 34)
        sub_channel_size = 84;
        protection_level = 4;
        bit_rate = 128;
        return;
    elseif(index == 35)
        sub_channel_size = 96;
        protection_level = 3;
        bit_rate = 128;
        return;
    elseif(index == 36)
        sub_channel_size = 116;
        protection_level = 2;
        bit_rate = 128;
        return;
    elseif(index == 37)
        sub_channel_size = 140;
        protection_level = 1;
        bit_rate = 128;
        return;
    elseif(index == 38)
        sub_channel_size = 80;
        protection_level = 5;
        bit_rate = 160;
        return;
    elseif(index == 39)
        sub_channel_size = 104;
        protection_level = 4;
        bit_rate = 160;
        return;
    elseif(index == 40)
        sub_channel_size = 116;
        protection_level = 3;
        bit_rate = 160;
        return;
    elseif(index == 41)
        sub_channel_size = 140;
        protection_level = 2;
        bit_rate = 160;
        return;
    elseif(index == 42)
        sub_channel_size = 168;
        protection_level = 1;
        bit_rate = 160;
        return;
    elseif(index == 43)
        sub_channel_size = 96;
        protection_level = 5;
        bit_rate = 192;
        return;
    elseif(index == 44)
        sub_channel_size = 116;
        protection_level = 4;
        bit_rate = 192;
        return;
    elseif(index == 45)
        sub_channel_size = 140;
        protection_level = 3;
        bit_rate = 192;
        return;
    elseif(index == 46)
        sub_channel_size = 168;
        protection_level = 2;
        bit_rate = 192;
        return;
    elseif(index == 47)
        sub_channel_size = 208;
        protection_level = 1;
        bit_rate = 192;
        return;
    elseif(index == 48)
        sub_channel_size = 116;
        protection_level = 5;
        bit_rate = 224;
        return;
    elseif(index == 49)
        sub_channel_size = 140;
        protection_level = 4;
        bit_rate = 224;
        return;
    elseif(index == 50)
        sub_channel_size = 168;
        protection_level = 3;
        bit_rate = 224;
        return;
    elseif(index == 51)
        sub_channel_size = 208;
        protection_level = 2;
        bit_rate = 224;
        return;
    elseif(index == 52)
        sub_channel_size = 232;
        protection_level = 1;
        bit_rate = 224;
        return;
    elseif(index == 53)
        sub_channel_size = 128;
        protection_level = 5;
        bit_rate = 256;
        return;
    elseif(index == 54)
        sub_channel_size = 168;
        protection_level = 4;
        bit_rate = 256;
        return;
    elseif(index == 55)
        sub_channel_size = 192;
        protection_level = 3;
        bit_rate = 256;
        return;
    elseif(index == 56)
        sub_channel_size = 232;
        protection_level = 2;
        bit_rate = 256;
        return;
    elseif(index == 57)
        sub_channel_size = 280;
        protection_level = 1;
        bit_rate = 256;
        return;
    elseif(index == 58)
        sub_channel_size = 160;
        protection_level = 5;
        bit_rate = 320;
        return;
    elseif(index == 59)
        sub_channel_size = 208;
        protection_level = 4;
        bit_rate = 320;
        return;
    elseif(index == 60)
        sub_channel_size = 280;
        protection_level = 2;
        bit_rate = 320;
        return;
    elseif(index == 61)
        sub_channel_size = 192;
        protection_level = 5;
        bit_rate = 384;
        return;
    elseif(index == 62)
        sub_channel_size = 280;
        protection_level = 3;
        bit_rate = 384;
        return;
    elseif(index == 63)
        sub_channel_size = 416;
        protection_level = 1;
        bit_rate = 384;
        return;
    end
end

