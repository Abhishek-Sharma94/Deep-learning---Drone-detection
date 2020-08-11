% Reading a particular image from the test dataset
img = imread('D:\sample\test\00009-00002.jpg');

% detect matlab command is used to predict the confidence level of region
% inside the boundary box
[bbox, score, label] = detect(detector,img);

% Picking out the maximum score and applying inverse
[score, idx] = max(score);
bbox = bbox(idx, :);

% Printing the output on the object by inserting object annotation 
annotation = sprintf('%s: (Accuracy = %f)', label(idx), score);
detectedImg = insertObjectAnnotation(img, 'rectangle', bbox, annotation);
figure
imshow(detectedImg) % Displaying the result