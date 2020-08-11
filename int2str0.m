function s = int2str0(int_val, no_digits, ch)
% int2str0 Convert an integer to string of fixed length with leading '0' 
%
% SYNTAX
%   s = int2str0(int_val, no_digits, ch);
%
% PARAMETERS
%
% EXAMPLE
%   s = int2str0(24, 5);
%
% NOTES
%
% VERSION
% First written:
% Last updated:
% (C) Son Lam Phung, 2004
if nargin < 2
    no_digits = 5;
end
if nargin < 3
    ch = '0';
end
s = int2str(int_val);
s = [repmat(ch, 1, no_digits - length(s)) s];





