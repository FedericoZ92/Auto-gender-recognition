%% Detect People
% Create a people detector and load the input image.

clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.
fontSize = 16;

%Change the current folder to the folder of this m-file.
if(~isdeployed)
        cd(fileparts(which(mfilename)));
end
%addpath('C:\Users\Federico\Desktop\DATASETS\Mall_dataset\mall_dataset\')
peopleDetector = PeopleDetector_fede2;

%imagefiles = dir('*.jpg');      
%nfiles = length(imagefiles); 



for q = 1:10%2000
    %load('mall_gt.mat');
    img_name = './frames/seq_%.6d.jpg'; % ./frames/
    img_index = q;     
    
    I = imread(sprintf(img_name,img_index)); %sprintf
    %imwrite(I, strcat('current_frame', '.jpg'));                      
    
    %%
    % Detect people using the people detector object.
    [bboxes,scores] = step(peopleDetector,I); 
    %%
    I2 = I;
    [num_people , points2] = size(bboxes);
    %I = insertObjectAnnotation(I,'rectangle',bboxes,scores);
    %figure, imshow(I)
    for w = 1:num_people
        xc1 = bboxes(w,1);
        yc1 = bboxes(w,2);
        sprintf('x: %.1f , y: %.1f',xc1 ,yc1);
        xc2 = bboxes(w,3);
        yc2 = bboxes(w,4);
        sprintf('x: %.1f , y: %.1f',xc1 ,yc1);
        xc1 = int64(xc1 + 4);%x coord for top left corner
        yc1 = int64(yc1 + 8);%y coord for top left corner
        xc2 = int64(xc2 - 8);%size of x
        yc2 = int64(yc2 - 16);%size of y
        pedestrian = imcrop(I2,[xc1, yc1, xc2 , yc2 ]);%[yc1, yc2, xc1, xc2]);
        imwrite(pedestrian, strcat('./people_automatic/', int2str(q) , '_' ,int2str(w) , '.png'));                      
    end    
    % Annotate detected people.
      
    %title('Detected people and detection scores'); 
   
end



