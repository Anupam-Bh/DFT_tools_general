%plot ahc wannierberri
clc
clear all
close all
fermi=13.6874
[ef,ax,ay,az,bx,by,bz]=textread('DPB_x-ahc_iter-0001.dat','%f %f %f %f %f %f %f','headerlines',1);
plot(ef-fermi,-bx,'g','linewidth',2);hold on;
plot(ef-fermi,-by,'k','linewidth',2); hold on;
plot(ef-fermi,-bz,'r','linewidth',2);
ylim([-20 20]);
xlim([-0.1 0.1]);
legend('\sigma_{zx}','\sigma_{yz}','\sigma_{xy}')
view(90,-90)
ylabel('AHC (Siemens/cm)');
set(gca,'linewidth',2,'Xgrid','on','Ygrid','on','Fontweight','normal','Fontsize',26,'Fontname','Heveltica');
pbaspect([1 1 1])
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 9 6])
xtickformat('%.2f')