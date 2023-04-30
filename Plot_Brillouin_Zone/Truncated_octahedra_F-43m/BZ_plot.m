% BZ plot
clc
close all
clear all
bz_vert=xlsread('BZ_plot.xlsx','BZ');
axs=xlsread('BZ_plot.xlsx','axes');
o=[0 0 0]';
u=axs(1,:);v=axs(2,:);w=axs(3,:);

 mArrow3(o,u,'color', 'k', 'stemWidth', 0.008);
 mArrow3(o,v,'color', 'k', 'stemWidth', 0.008);
 mArrow3(o,w,'color', 'k', 'stemWidth', 0.008);
 hold on

tr_mat=axs';
bz_cart=transpose(tr_mat*bz_vert');
plot3(bz_cart(:,1),bz_cart(:,2),bz_cart(:,3),'color',[0.5 0.8 0.2],'linewidth',2);
hold on
plot3(0,0,0,'k')
hold on 
% tri_pts=xlsread('BZ_plot.xlsx','triple_pts_4perc');
% trp=transpose(tr_mat*tri_pts');
% plot3(trp(:,1),trp(:,2),trp(:,3),'or','linewidth',1,'MarkerSize',1.5);
plot3(0,0,0.42,'*k')
hold on
plot3(-0.395,0.0,0.28,'*k')
hold on 
plot3(-0.305,0.17,0.42,'*k')
hold on
plot3(0,0,-0.42,'*k')


text(0,0.0,-0.04,'\Gamma', 'FontSize', 18);
text(0.0,-0.05,0.42,'L', 'FontSize', 18)
text(0.0,-0.05,-0.41,'L''', 'FontSize', 18)
text(-0.4,0.0,0.3,'X', 'FontSize', 18);
text(-0.32,0.16,0.38,'W', 'FontSize', 18);
grid off
view(-101,10);
pbaspect([1 1 0.5])
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 9 6])
set(gca,'FontSize',32,'fontname','times');