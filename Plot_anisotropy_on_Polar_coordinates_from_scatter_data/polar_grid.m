%% 3D grid of alpha and theta for ground state  
clc
clear all
close all
%
o=[0 0 0]';u=[1 0 0]';v=[0 1 0]';w=[0 0 1]';
mArrow3(o,u,'color', 'green', 'stemWidth', 0.008);
mArrow3(o,v,'color', 'blue', 'stemWidth', 0.008);
mArrow3(o,w,'color', 'red', 'stemWidth', 0.008);
hold on
%
R=1;
th=0:pi/12:2*pi;
phi=-pi/2:pi/12:pi/2;
[T,P]=meshgrid(th,phi);
[x,y,z]=sph2cart(T,P,R);
plot3(x,y,z,'ok','MarkerSize',0.7);
hold on
%
R=7.5;
th1=0:pi/12:2*pi/3;
phi1=0:pi/12:pi/2;
[T1,P1]=meshgrid(th1,phi1);
[x1,y1,z1]=sph2cart(T1,P1,R);
plot3(x1,y1,z1,'or','MarkerSize',3);
pbaspect([1 1 1])
hold on
%
% R=4.5;
% th1=0;
% % phi1=pi/12:pi/60:pi/3;
% phi1=0.1957*pi;
% [T1,P1]=meshgrid(th1,phi1);
% [x1,y1,z1]=sph2cart(T1,P1,R);
% plot3(x1,y1,z1,'or','MarkerSize',3);
% pbaspect([1 1 1])
% hold on
%
view(154,18)


