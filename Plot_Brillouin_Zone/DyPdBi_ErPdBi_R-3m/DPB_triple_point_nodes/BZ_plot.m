%% BZ plot
clc
clear all
close all
bz_vert=xlsread('BZ_plot.xlsx','BZ');
axs=xlsread('BZ_plot.xlsx','axes');
o=[0 0 0]';
u=axs(1,:);v=axs(2,:);w=axs(3,:);

%  mArrow3(o,u,'color', 'green', 'stemWidth', 0.008);
%  mArrow3(o,v,'color', 'blue', 'stemWidth', 0.008);
%  mArrow3(o,w,'color', 'red', 'stemWidth', 0.008);
 hold on

tr_mat=axs';
bz_cart=transpose(tr_mat*bz_vert');
plot3(bz_cart(:,1),bz_cart(:,2),bz_cart(:,3),'color',[0.5 0.5 0.5],'linewidth',1.5);
hold on

% M=dlmread('Nodes.dat','',2,0);
% size(M)
% C = M(M(:,4)== 0.0000,:)
% %scatter3(C(:,1),C(:,2),C(:,3))
% scatter3(M(:,1),M(:,2),M(:,3))
%% nodes
nodes=xlsread('BZ_plot.xlsx','triple_points');
plot3(nodes(:,1),nodes(:,2),nodes(:,3),'or','MarkerSize',3,'MarkerFaceColor', 'r');
grid off
view(160,14)
pbaspect([1 1 0.5])