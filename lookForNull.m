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
% ## @deftypefn {Function File} {@var{retval} =} lookForNull (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% ## Author: Matty <Matty@DESKTOP-ROES8EA>
% ## Created: 2016-09-08


%looks for the NULL in the signal, iterates through data looking for X
%   amount of points which are below the threshold.

function [location] = lookForNull (data, start, threshold)
    x = abs(data);      %take the absolute value of the data
    location = false;
    d = 100;
    for idx=start:length(data)
        above = false;
        for j=0:d-1
            if(x(idx+j) > threshold)
                above = true;
                break;
            end
        end
        
        if(above == false)
            location = idx;
            break;
        end
    end
end
