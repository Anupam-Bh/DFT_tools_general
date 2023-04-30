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
plot3(bz_cart(:,1),bz_cart(:,2),bz_cart(:,3),'color',[0.3 0.3 0.3],'linewidth',1);
hold on
%% low_symmetry_k_points
l_symm_pts=xlsread('BZ_plot.xlsx','low_symm_pts');
l_symm=transpose(tr_mat*l_symm_pts');
plot3(l_symm(:,1),l_symm(:,2),l_symm(:,3),'--ok','MarkerSize',5);
%% nodes
% nodes=xlsread('BZ_plot.xlsx','triple_points');
% plot3(nodes(:,1),nodes(:,2),nodes(:,3),'or','MarkerSize',2);
M=dlmread('Nodes.dat','',2,0);
size(M);
C = M(M(:,4)== 0.0000,:)
% plot3(C(:,1),C(:,2),C(:,3));
for i=1:size(C)
    if C(i,9)==1
        plot3(C(i,1),C(i,2),C(i,3),'or','MarkerSize',3,'MarkerFaceColor', 'r'); 
    elseif C(i,9)==-1
        plot3(C(i,1),C(i,2),C(i,3),'ok','MarkerSize',3,'MarkerFaceColor', 'k');
    end
end
grid off
view(-126,6)
pbaspect([1 1 0.5])
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 12 10])