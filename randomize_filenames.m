function randomize_filenames(in_dir, in_ext, out_dir, out_ext)
% randomize_filenames: Randomize filenames in a directory 
%
% SYNTAX
%   randomize_filenames(in_dir, in_ext, out_dir, out_ext);
%
% PARAMETERS
%   in_dir:   input directory
%   in_ext:   extension of input files
%   out_dir:  output directory
%   out_ext:  extension of output (renamed) files
%
% EXAMPLE
%   randomize_filenames('C:\Try', 'jpg', 'C:\Try\New', 'jpg'); 
%
% NOTES
% Son Lam Phung, 2004
%% Default parameters
if nargin < 3
    out_dir = in_dir; 
end

if nargin < 4
    out_ext = in_ext;
end

%% Rename files
file_list = dir([in_dir filesep '*.' in_ext]); % search files by extension
no_entries = length(file_list);

% Count number of files
file_count = 0;
for i = 1:no_entries
    if ~file_list(i).isdir
        file_count = file_count + 1;
    end
end
no_digits = ceil(log10(file_count)) + 5;

% Generate a list of file_count random numbers
rand_list = floor(rand(1, file_count * 10)*file_count*10) + 1;

used_list = [];
rand_idx = 1;
for i = 1:no_entries
    if file_list(i).isdir
        continue;
    end
    
    % Construct names
    while ismember(rand_list(rand_idx), used_list)
        rand_idx = rand_idx + 1;
    end
    
    new_id = rand_list(rand_idx);
    used_list = [used_list new_id];

    old_name = [in_dir filesep file_list(i).name];
    new_name = [out_dir filesep int2str0(new_id, no_digits) ...
                '.' out_ext];
    
    if (exist(new_name, 'file') == 0)
        % Move files
        fprintf('Rename: %s -> %s \n', old_name, new_name);
        copyfile(old_name, new_name);
    end
end