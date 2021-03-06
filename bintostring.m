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
% ## @deftypefn {Function File} {@var{retval} =} bintostring (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% ## Author: Matty <Matty@LENOVO-PC>
% ## Created: 2016-09-02

function [output] = bintostring (input)
    output = [];
    if mod(length(input),8) ~= 0
        disp('ERROR: bintostring: input not divisable by 8');
        return
    end

    for i=1:8:length(input)
        val = num2str(input(i:i+7));
        character = char(bin2dec(val));
        output = [output, character];
    end    
end
