clc
clear all

filename = 'Filename.dat';
delimiterIn = ' ';
headerlinesIn = 0;
A = importdata(filename,delimiterIn,headerlinesIn);

plot(A(:,1)-13.688,A(:,2),'r');hold on;
plot(A(:,1)-13.688,A(:,3),'b');hold on;
plot(A(:,1)-13.688,A(:,4),'k');
xlim([-0.1 0.1])
ylim([-75 75])
view(90,-90)
set(gca,'Xgrid','on','Ygrid','on',...
       'Fontweight','normal','Fontsize',28,'FontName','Heveltica');
xlabel('E-E_{f} (eV)');
box on;
% set(gca,'Position',[0.25    0.1557    0.7    0.76])
pbaspect([1 1 1]);
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 9 6])
