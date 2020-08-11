function num_drone = convert_python_format(in_mat_file, out_text_file)
%--------------------------------------------------------------------------
% SYNTAX 
%   1) num_drone = convert_python_format(in_mat_file, out_text_file);
%   2) convert_python_format(in_mat_file, out_text_file);
%
% PARAMETERS
%   in_mat_file: input MAT file contains the annotated dataset
%   out_text_file: output text file contains the dataset in Python format
%   num_drone: number of drone objets in the dataset (for double-checking)
%
% EXAMPLE
%   in_mat_file   = 'drone_dataset.mat';
%   out_text_file = 'drone_dataset.txt';
%   num_drone = convert_python_format(in_mat_file, out_text_file);
% NOTE
% (C) Hoang Thanh Le, 2019
%--------------------------------------------------------------------------
%% Count the number of drone objects in the dataset for double-checking
load(in_mat_file);
data = gTruth.LabelData;
num_drone = 0;
for i = 1 : size(data, 1)
    num_drone = num_drone + size(cell2mat(data{i, 1}), 1);     
end

%% Re-organize the variables in the input MAT file
num_row = size(data, 1);
data_table = cell2table(cell(num_row, 2));
data_table.Properties.VariableNames = {'Files', 'Drone'};

data_table{:, 1} = gTruth.DataSource.Source;
data_table{:, 2} = data{:, 1};

%% Convert the MATLAB annotated dataset to Python format
num_files = size(data_table, 1);
file_id   = fopen(out_text_file,'w');
for i = 1 : num_files    
    % Replace the file seperator
    file_path = strrep(data_table{i, 1}{1}, '\', '/');
    
    % Get the info of objects
    drone_info = data_table{i, 2}{1}; 
    
    annotation_strings = '';
    for j = 1 : size(drone_info, 1) % go through the drone objects           
        % Create a annotation string in the PASCAL VOC format
        str = [num2str(drone_info(j, 1)) ',' num2str(drone_info(j, 2)) ',' ...
               num2str(drone_info(j, 1) + drone_info(j, 3)) ',' ...
               num2str(drone_info(j, 2) + drone_info(j, 4)) ',0'];            
        
       % Concate the string
       annotation_strings = [annotation_strings ' ' str];
    end
    
    % Write the string into the text file line-by-line
    fprintf(file_id, '%s%s\n', file_path, annotation_strings);
    fprintf('Image %s converted\n', file_path);
end
fclose(file_id);
end