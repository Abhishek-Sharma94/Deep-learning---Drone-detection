function rename_files(in_dir, in_ext, out_dir, out_ext, ...
                      out_init, out_prefix, out_postfix, no_digits)
% rename_files Rename files 
%
% SYNTAX
% rename_files(in_dir, in_ext, out_dir, out_ext, ...
%              out_init, out_prefix, out_postfix, no_digits)
%
% PARAMETERS
%    in_dir:      input directory
%    in_ext:      input extension
%    out_dir:     output directory
%    out_ext:     output extension
%    out_init:    output file initial number
%    out_prefix:  prefix of output filename
%    out_postfix: postfix of output filename 
%    no_digits:   number of digits in output filename
%
% EXAMPLE
%   To rename file in directory 'C:\Old'
%     to the form 'LS#####.jpg' in directory 'C:\New'                                               
%   rename_files('C:\Old', '*', 'C:\New', 'jpg', 2001, 'LS', '', 5); 
%
%   rename_files('E:\PhotoWork\Frames', 'jpg', 'E:\PhotoWork\Frames', 'jpg', 2276, 'P', '', 6);
%
% NOTES
% (C) Son Lam Phung, 2004

if strcmp(out_dir, '')
    out_dir = in_dir;
end

file_list = dir([in_dir filesep '*.' in_ext]);
no_entries = length(file_list);
count = 0;
for i = 1:no_entries
    if file_list(i).isdir
        continue;
    end
    
    % Construct names
    old_name = [in_dir filesep file_list(i).name];
    new_name = [out_dir filesep out_prefix ...
                int2str0(out_init + count, no_digits) ...
                out_postfix '.' out_ext];
    count = count + 1;
    
    % Move files
    fprintf('Rename: %s -> %s \n', old_name, new_name);
    copyfile(old_name, new_name);
end