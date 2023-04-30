%clc
clear all
close all
x=[6.64	-32.66641044
6.645	-32.67055536
6.65	-32.67429481
6.655	-32.67762304
6.66	-32.68055189
6.665	-32.68307911
6.67	-32.68521082
6.675	-32.6869472
6.68	-32.68829713
6.685	-32.68925723
6.69	-32.68983438
6.695	-32.69003538
6.7	-32.68985184
6.705	-32.68929967
6.71	-32.68837577
6.715	-32.68708271
6.72	-32.68542151
6.725	-32.68340363
6.73	-32.68102382
6.735	-32.67828889
6.74	-32.67519713
6.745	-32.67176062
6.75	-32.66797192];

x1=x(:,1);x2=x(:,2);
[fitresult, gof,coeff]= latparamFit(x1, x2)


% y=(6.530:0.00002:6.610);
% interpolated_data = interpn(x(:,1),x(:,2),y,'cubic');
% plot(x(:,1),x(:,2),'o');
% hold on
% plot(y,interpolated_data,'-');
% xlim([6.53 6.61]);
% xlabel('lattice parameter (A)')
% ylabel('Total Energy (eV)')
% mat(:,1)=y;mat(:,2)=interpolated_data;
% sorted=sortrows(mat,2);
% fprintf('minima of energy is at %f',sorted(1,1));

syms r
a= coeff(1); b=coeff(2);c= coeff(3); d= coeff(4);
f=a*r^3+b*r^2+c*r+d;
figure(2)
plot(fitresult);hold on;
plot(x1,x2,'ok','MarkerSize',5);hold on;
xlabel('Lattice parameter a_{cubic}(A)','FontSize',21)
ylabel('Total Energy (eV)','FontSize',21)
aa= legend({'fitted equation','Energy vs. lattice parameter'},'Location','NorthEast','FontSize',15 );
set(aa,'visible','off')
xlim([min(x1) max(x1)]);
ylim([min(x2)-0.1*(max(x2)-min(x2)) max(x2)]);
set(gca,'Xgrid','on','Ygrid','on','Fontweight','normal','Fontsize',21);
pbaspect([1 0.8 1])
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 9 4])
g = diff(f, r)
solve(g == 0, r, 'MaxDegree', 4);
extrema = vpa(ans, 6)

