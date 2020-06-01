% detecting single face in an image using Viola-Jones Algorithm
% DPattnaik
clear all
image=imread('CVRaman.jpg');
[width,height]=size(image);
if width >320
    image=imresize(image,[320 NaN]);
end
DetectFace = vision.CascadeObjectDetector();
LocationFace=step(DetectFace,image); %Bounding Box values based on number of objects

figure,
imshow(image); hold on
for i = 1:size(LocationFace,1)
    rectangle('Position',LocationFace(i,:),'LineWidth',1,'LineStyle','-','EdgeColor','r');
end
title('Face Detection');
hold off
