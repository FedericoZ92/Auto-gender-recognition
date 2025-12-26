clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.
fontSize = 16;

% Change the current folder to the folder of this m-file.
if(~isdeployed)
        cd(fileparts(which(mfilename)));
end

%MATLAB image.
load('mall_gt.mat');
for q = 1183:2000%2000
    clc;
    img_name = './frames/seq_%.6d.jpg';
    img_index = q; %970;

    xc1_v = []
    yc1_v = []
    xc2_v = []
    yc2_v = []
    
    XY=frame{img_index}.loc;
    [m,n] = size(XY)
    I = imread(sprintf(img_name,img_index));
    I2 = I;
    imshow(I, []); hold on;
    global stoploop
    stoploop = 0;
    for w = 1:2*m 
       if stoploop == 0
        
        title(strcat('Frame ' , int2str(q)), 'FontSize', fontSize);
               
        numberOfPointsToClick = 1;
        [xc1 yc1] = ginput(numberOfPointsToClick);
        message = sprintf('x: %.1f , y: %.1f',xc1 ,yc1);
        
        [xc2 yc2] = ginput(numberOfPointsToClick);
        message = sprintf('x: %.1f , y: %.1f',xc1 ,yc1);
        xc1 = int64(xc1)
        yc1 = int64(yc1)
        xc2 = int64(xc2)
        yc2 = int64(yc2)
        xc1_v = [xc1_v, xc1];
        yc1_v = [yc1_v, yc1];
        xc2_v = [xc2_v, xc2];
        yc2_v = [yc2_v, yc2];
        figure;
        pedestrian = imcrop(I2,[xc1, yc1, xc2 - xc1, yc2 - yc1]);%[yc1, yc2, xc1, xc2]);
        imshow(pedestrian); hold  on;              
        prompt = 'type gender:__';
        %this_gender = input(prompt,'s'); %TYPE: 'm' OR 'f'
        this_gender = 'm';
        imwrite(pedestrian, strcat('./people_manual/', int2str(q) , '_' ,int2str(w) , '_' , this_gender, '.png'));                      
        prompt = 'next frame?__'; % TYPE c TO CONTINUE WITH NEXT FRAME
        %cont = input(prompt,'s'); 
        cont = 'c';
        close
        if strcmp(cont, 'c') == 1
           print('son qua')
           global stoploop
           stoploop = 1;
        end        
        I2 = I;
        imshow(I, []); hold on; 
        [u1,u2] = size(xc1_v) 
        for e = 1:u2         
            p1 = floor((xc1_v(e) + xc2_v(e))/2);
            p2 = floor((yc1_v(e) + yc2_v(e))/2);
            plot(p1, p2 ,'r*');
        end       
       end
    end
    
end

%message=sprintf('You clicked at (x,y)=(%.1f,%.1f)',xc1,yc1);
fprintf(1,'%s\n',message);
uiwait(msgbox(message));