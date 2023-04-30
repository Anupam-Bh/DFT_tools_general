%% BZ plot
clc
clear all
close all
bz_vert=xlsread('BZ_plot.xlsx','BZ');
axs=xlsread('BZ_plot.xlsx','axes');
o=[0 0 0]';
u=axs(1,:);v=axs(2,:);w=axs(3,:);
% 
%  mArrow3(o,u,'color', 'green', 'stemWidth', 0.008);
%  mArrow3(o,v,'color', 'blue', 'stemWidth', 0.008);
%  mArrow3(o,w,'color', 'red', 'stemWidth', 0.008);
%  hold on

tr_mat=axs';
bz_cart=transpose(tr_mat*bz_vert');
plot3(bz_cart(:,1),bz_cart(:,2),bz_cart(:,3),'color',[0.5 0.5 0.5],'linewidth',1.5);
hold on

%% high symmetry points
x={'','L','','','Z','Z''','X','','F','P1','P'}
h_pts=xlsread('BZ_plot.xlsx','symm_pts');
pts=transpose(tr_mat*h_pts');
plot3(pts(:,1),pts(:,2),pts(:,3),'or','LineWidth',3,'MarkerSize',2);
grid off
dx = 0.05; dy = -0.0;dz=0.05;
% text(pts(:,1)+dx,pts(:,2)+dy,pts(:,3)+dz,x,'FontSize',18);
% text(pts(1,1),pts(1,2),pts(1,3),'\Gamma','FontSize',18);
% text(pts(3,1)+2.5*dx,pts(3,2)+dy,pts(3,3)+dz,'B1','FontSize',18);
% text(pts(4,1)-dx/2,pts(4,2)+dy,pts(4,3)-dz,'B','FontSize',18);
% text(pts(8,1)+2*dx,pts(8,2)+dy,pts(8,3)+dz,'Q','FontSize',18);
view(158,13)
pbaspect([1 1 0.5])

%% Nodes

% M=dlmread('../DPB_weyl_nodes/Nodes.dat','',2,0);
% size(M);
% C = M(M(:,4)== 0.0000,:)
% % plot3(C(:,1),C(:,2),C(:,3));
% for i=1:size(C)
%     if C(i,9)==1
%         plot3(C(i,1),C(i,2),C(i,3),'or','MarkerSize',3,'MarkerFaceColor', 'r'); 
%     elseif C(i,9)==-1
%         plot3(C(i,1),C(i,2),C(i,3),'ok','MarkerSize',3,'MarkerFaceColor', 'k');
%     end
% end
view(160,14)