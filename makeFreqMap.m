function [out] = makeFreqMap(in)

     FT = zeros(1, 2048);
     FT(1) = 0;


     for (z=2:2048)
          FT(z) = mod(13*FT(z-1) + 511, 2048);
     end

     mapmin = 256;
     mapmax = 1792;

     MAP = zeros(1, 1536); % the actual map
     mi = 1;
     for (z=1:2048)
         if (FT(z) < 256 || FT(z) > 1792)
         elseif (FT(z) == 1024)
         else
              MAP(mi) = FT(z) - 1024;
              mi = mi + 1;
         end
     end

     out = MAP;

% to check this out note:
% ii=[-768:-1 1:768];
% map(find(ii==768)) -> 197
% (looks like you can just ignore the 0 value inside the middle of this vector)
