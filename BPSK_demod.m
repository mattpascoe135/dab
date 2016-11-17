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
% ## @deftypefn {Function File} {@var{retval} =} BPSK_demod (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% 
% ## Author: Matty <Matty@LENOVO-PC>
% ## Created: 2016-09-02

function [output] = BPSK_demod (input)
    output = pskdemod(input, 2, 0);       %decdoe the BPSK modulation
end
