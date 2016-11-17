function [ depunc_data ] = depuncture_data(FIC, PC1, PC2, PC3)
    block1 = FIC(:, 1:2016);
    block2 = FIC(:, 2017:2017+276-1);
    block3 = FIC(:, 2017+276:end);
    
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


end

