% detecting single face in an image using Viola-Jones Algorithm
clear all
image=imread('MoonMission3.jpg');
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
% For images with multiple faces and more using upper body identification

DetectBody=vision.CascadeObjectDetector('UpperBody');
DetectBody.MinSize=[70,70];
DetectBody.ScaleFactor=1.05;
LocationBody=step(DetectBody,image); %Bounding Box values based on number of objects
 
figure(2),
imshow(image); hold on
 for i = 1:size(LocationBody,1)
    rectangle('Position',LocationBody(i,:),'LineWidth',1,'LineStyle','-','EdgeColor','g');
 end
title('Face Detection');
hold off