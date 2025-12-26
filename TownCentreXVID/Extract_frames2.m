
mov=VideoReader('./TownCentreXVID.avi');

for i = 11:100 % while hasFrame(mov)
    video_frame = readFrame(mov);
    name = '%.6d';
    frame_name = sprintf(name,i);
    video_frame = imresize(video_frame,[480,850])%[360,640]
    imwrite(video_frame,strcat('./frames/seq_', frame_name,'.jpg'));%video(:,:,:,i)
end

%vidFrames=read(mov);
%nFrames=mov.NumberOfFrames;
%for i=1:10%nFrames
%   imshow(vidFrames(:,:,i),[]);  %frames are grayscale
%end

%obj = mmreader('./TownCentreXVID.avi');
%vid = read(obj);
%frames = obj.NumberOfFrames;
%for x = 1 : 10%frames
%    imwrite(vid(:,:,:,x),strcat('frame-',num2str(x),'.png'));
%end