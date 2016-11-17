function [ output ] = viterbi_dec( input )    
    g = [133 171 145 133];
    d=7;    
    trellis = poly2trellis(d, g);
    output1 = vitdec(input(1,:), trellis, d*5, 'trunc', 'hard');
    output2 = vitdec(input(2,:), trellis, d*5, 'trunc', 'hard');
    output3 = vitdec(input(3,:), trellis, d*5, 'trunc', 'hard');
    output4 = vitdec(input(4,:), trellis, d*5, 'trunc', 'hard');

    tmp_output = [output1 ; output2 ; output3 ; output4];
    output = tmp_output(:, 1:768);
end

