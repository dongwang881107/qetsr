function [status, result] = julia(scriptname)
julia_path = '/Applications/Julia-0.4.2.app/Contents/Resources/julia/bin/julia';
% julia_path = '/home/dss/git/julia/julia';
[status, result] = system([julia_path, ' ', scriptname],'-echo');
