%% Detect People Using Aggregated Channel Features
%
%%
% Read an image.
%I = imread('seq_000333.jpg');

load('mall_gt.mat');

img_name = './frames/seq_%.6d.jpg';

img_index = 1030; %970;

I = imread(sprintf(img_name,img_index));

%%
% Detect people in the image and store results as bounding boxes and score.
[bboxes,scores] = detectPeopleACF(I);
%%
% Annotate the detected upright people in the image.  
I = insertObjectAnnotation(I,'rectangle',bboxes,scores);
%%
% Display the results with annotation.
figure
imshow(I)
title('Detected people and detection scores')
