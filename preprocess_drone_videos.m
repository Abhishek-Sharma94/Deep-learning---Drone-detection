% DESCRIPTION
%
%
% NOTES

%% Step 1: Collect drone video and convert to MP4 format (mamual)


%% Step 2: Rename drones video as 000001.mp4, 00002.mpg, ...
in_dir = 'D:\sample\images';
in_ext = 'jpg';
out_dir = 'D:\sample\images';
out_ext = 'jpg';
out_init = 1;
out_prefix = '';
out_postfix = '';
no_digits = 5;
rename_files(in_dir, in_ext, out_dir, out_ext, ...
             out_init, out_prefix, out_postfix, no_digits);      
         
%% Step 3: Cut MP4 video to contain only drone segments (mamually)
% using software tools such as Free Video Cutter
% https://www.gihosoft.com/free-video-cutter.html

%{%%% Step 4: Extract images from cut MP4 video (code)
% Folder of cut video MP4 files
%   in_dir = ...
%       ['D:\ECTE940 (Thesis) - Final\03-Drone-video-cut' ...
%       filesep];
% 
% % Output folder of frames from video
% out_dir = ...
%     ['D:\ECTE940 (Thesis) - Final\04-Drone images' ...
%      filesep];
% 
% clc; 
% clear screen
% for i = 453:538
%     video_file = [int2str0(i, 5) '.mp4'];
%     fprintf('%s: ', video_file);
%     
%     video_obj = VideoReader([in_dir video_file]);
%     N = video_obj.NumberOfFrames;      % number of video frames
%     H = video_obj.Height;              % height of each frame  
%     W = video_obj.Width;               % width of each frame
%     frame_rate = video_obj.FrameRate;  % video frame rate
% 
% %     Skip some frames so that the total number of frames 
% %     extracted per video is 100 at most
%     %skip_frame = max(frame_rate, floor(N/10));
%     frame_count = 0;
%         
%     for j = 1:40:N
%         %Increment the number of frames writtent image files
%         frame_count = frame_count + 1;
%         
%         %Read one frame at index j
%         video_frame = read(video_obj, j);
%         
%         im_file = [video_file(1:end-4) '-' ...
%                    int2str0(frame_count, 5) '.jpg']; 
%         
%         %Write a video frame to JPG file 
%         imwrite(video_frame, [out_dir im_file], 'JPG');
%         
%         fprintf('%g,', frame_count);
%     end
%     fprintf('\n');
% end
%}

%% Step 5: Annotating drone detection data (manual, using GUIDE written)

%% Step 6: Save labels in text file
%convert_python_format('laptop_new.mat', 'laptop_new.txt')
%% Step 6: Train YOLO drone detection system (code: MATLAB, Python)