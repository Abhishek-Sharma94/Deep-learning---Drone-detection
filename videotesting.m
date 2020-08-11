% Loading our detector
load('detector.mat');                                

% Read your video here
vidReader = VideoReader('f4.mp4');                   

% Using Deployable player for viewing the output
vidPlayer = vision.DeployableVideoPlayer;    
                                                       

while(hasFrame(vidReader))
    img = readFrame(vidReader);
    
    % Resizing the image to 224x224
    img = imresize(img,[224,224]);
    
    % Boundary boxes for labelling the object
    [bbox, score, label] = detect(detector,img);

% Picking out the maximum score and applying inverse
[score, idx] = max(score);
bbox = bbox(idx, :);

% Printing the output on the object by inserting object annotation 
annotation = sprintf('%s: (Accuracy = %f)', label(idx), score);
detectedImg = insertObjectAnnotation(img, 'rectangle', bbox, annotation);

% Combining detection with the video
step(vidPlayer,detectedImg);
end

