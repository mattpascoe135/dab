function [map] = makeEnergyDisp(n)

    register = [1 1 1 1 1 1 1 1 1];
    map = zeros(1, n);

    for (z=1:n)
        feedback = mod(register(5) + register(9), 2);
        register = [feedback register(1:end-1)];
        map(z) = feedback;
    end
