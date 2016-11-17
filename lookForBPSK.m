% ## Copyright (C) 2016 Matty
% ## 
% ## This program is free software; you can redistribute it and/or modify it
% ## under the terms of the GNU General Public License as published by
% ## the Free Software Foundation; either version 3 of the License, or
% ## (at your option) any later version.
% ## 
% ## This program is distributed in the hope that it will be useful,
% ## but WITHOUT ANY WARRANTY; without even the implied warranty of
% ## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% ## GNU General Public License for more details.
% ## 
% ## You should have received a copy of the GNU General Public License
% ## along with this program.  If not, see <http://www.gnu.org/licenses/>.
% 
% ## -*- texinfo -*- 
% ## @deftypefn {Function File} {@var{retval} =} lookForBPSK (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% ## Author: Matty <Matty@DESKTOP-ROES8EA>
% ## Created: 2016-09-09

function [delay] = lookForBPSK (signal, start, preamble, threshold, repeats, useABS)
    %encode and modulate preamble
    d = bintosym(preamble,2);
    x = BPSK_mod(d);        %Modulate data
    
    data = repelem(x, repeats);
    data =data;

    [acor, lag] = xcorr(signal, data); 
    
    figure;
    plot(abs(lag), abs(acor));
    
    delay=1;
    for idx=1:length(acor)
        if(lag(idx) >= start)
            if(useABS == true)
                if(abs(acor(idx)) >= threshold)
                    delay=lag(idx);
                    break
                end
            else
                if((acor(idx)) >= threshold)
                    delay=lag(idx);
                    break
                end
            end
        end
    end
end
