%% Detect People
% Create a people detector and load the input image.

% Copyright 2015 The MathWorks, Inc.

peopleDetector = PeopleDetector_fede;
I = imread('seq_000025.jpg');
%%
% Detect people using the people detector object.
[bboxes,scores] = step(peopleDetector,I); 
%%
% Annotate detected people.
I = insertObjectAnnotation(I,'rectangle',bboxes,scores);
figure, imshow(I)
title('Detected people and detection scores'); 
