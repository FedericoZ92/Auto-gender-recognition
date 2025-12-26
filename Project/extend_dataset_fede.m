%addpath('C:\Users\Federico\Desktop\DATASETS\Mall_dataset\mall_dataset\')
%imagefiles = dir('*.jpg');      
%nfiles = length(imagefiles); 
M_or_F = 'F';

dir_none = './FINAL_PIPELINE/0/0_train/'; 
dir_M = './FINAL_PIPELINE/2/2_train/'; 
dir_F = './FINAL_PIPELINE/1/1_train/';
destination_none = './FINAL_PIPELINE/0/0_train/';
destination_M = './FINAL_PIPELINE/2/2_train/';
destination_F = './FINAL_PIPELINE/1/1_train/';

if M_or_F == 'hhh'
   for q = 1:2000
       for f = 1:30%2000
       %load('mall_gt.mat');
          num1 = int2str(q);
          num2 = int2str(f);
          
          display(strcat(dir_M, num1, '_', num2, '.png'));
          if exist(strcat(dir_M, num1, '_', num2, '.png' ))
             display('here')
             img_index = q;     
    
             I = imread(strcat(dir_M, num1, '_', num2, '.png')); 
             %imwrite(I, strcat('current_frame', '.jpg')); 
             
             imwrite(I, strcat(destination_M, num1, '_', num2 , '.png'));            
             for i = 1:2                 
                angle = 1 + (3-1).*rand(1); %angle in degrees
                range_x = 1 + (4-1).*rand(1);
                range_y = 1 + (8-1).*rand(1);
                scale = 0.9 + (1.1-0.9).*rand(1);             
                I = imrotate(I,angle);
                I = imtranslate(I,[range_x, range_y]);
                I = imresize(I,scale);      
                imwrite(I, strcat(destination_M, num1, '_', num2 , '_noise_', int2str(i) , '.png')); 
             end
          end    
       end
   end
end

if M_or_F == 'hhhh'
   for q = 1:2000
       for f = 1:30%2000
       %load('mall_gt.mat');
          num1 = int2str(q);
          num2 = int2str(f);
          
          display(strcat(dir_F, num1, '_', num2, '.png'));
          if exist(strcat(dir_F, num1, '_', num2, '.png' ))
             display('here')
             img_index = q;     
    
             I = imread(strcat(dir_F, num1, '_', num2, '.png')); 
             %imwrite(I, strcat('current_frame', '.jpg')); 
             
             imwrite(I, strcat(destination_F, num1, '_', num2 , '.png'));            
             for i = 1:2                 
                angle = 1 + (3-1).*rand(1); %angle in degrees
                range_x = 1 + (4-1).*rand(1);
                range_y = 1 + (8-1).*rand(1);
                scale = 0.9 + (1.1-0.9).*rand(1);             
                I = imrotate(I,angle);
                I = imtranslate(I,[range_x, range_y]);
                I = imresize(I,scale);      
                imwrite(I, strcat(destination_F, num1, '_', num2 , '_noise_', int2str(i) , '.png')); 
             end
          end    
       end
   end
end

   for q = 1:2000
       for f = 1:30%2000
       %load('mall_gt.mat');
          num1 = int2str(q);
          num2 = int2str(f);
          
          display(strcat(dir_none, num1, '_', num2, '.png'));
          if exist(strcat(dir_none, num1, '_', num2, '.png' ))
             display('here')
             img_index = q;     
    
             I = imread(strcat(dir_none, num1, '_', num2, '.png')); 
             %imwrite(I, strcat('current_frame', '.jpg')); 
             
             imwrite(I, strcat(destination_none, num1, '_', num2 , '.png'));            
             for i = 1:2                 
                angle = 1 + (3-1).*rand(1); %angle in degrees
                range_x = 1 + (4-1).*rand(1);
                range_y = 1 + (8-1).*rand(1);
                scale = 0.9 + (1.1-0.9).*rand(1);             
                I = imrotate(I,angle);
                I = imtranslate(I,[range_x, range_y]);
                I = imresize(I,scale);      
                imwrite(I, strcat(destination_none, num1, '_', num2 , '_noise_', int2str(i) , '.png')); 
             end
          end    
       end
   end