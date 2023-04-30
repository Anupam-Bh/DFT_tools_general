%% Polar plot of Young's modulus and Shear modulus for single crystal cubic materials
clc
clear all
close all

% o=[0 0 0]';u=[100 0 0]';v=[0 100 0]';w=[0 0 100]';
% mArrow3(o,u,'color', 'green', 'stemWidth', 0.008);
% mArrow3(o,v,'color', 'blue', 'stemWidth', 0.008);
% mArrow3(o,w,'color', 'red', 'stemWidth', 0.008);
% hold on

% c11=130.73;
% c12=43.40;
% c44=35.03;
% C_mat=[c11 c12 c12 0 0 0;c12 c11 c12 0 0 0;c12 c12 c11 0 0 0;0 0 0 c44 0 0;0 0 0 0 c44 0;0 0 0 0 0 c44];
C_mat=dlmread('LaPdBi.mdf2',' ',1,0)

alpha=0:pi/50:pi;
beta=0:pi/50:2*pi;
theta=0:pi/50:0*pi;   %%%%%% Modify this range if a particular azimuth on the hkl plane is to be fixed


S_mat=inv(C_mat);
s4_tensor=mapVoigt2TensorS(S_mat);

for i=1:length(alpha)
    for j=1:length(beta)
        for k=1:length(theta)
            A=CalculateA(alpha(i),beta(j),theta(k));
            Young(i,j,k)=calcE(A,s4_tensor);
            Compress(i,j,k)=calcBeta(A,s4_tensor);
            Shear(i,j,k)=calcG1j(A,s4_tensor);
            Poisson(i,j,k)=calcNu1j(A,s4_tensor);
        end
        Shear_max(i,j)=max(Shear(i,j,:));
        Shear_min(i,j)=min(Shear(i,j,:));
        Poisson_max(i,j)=max(Poisson(i,j,:));
        Poisson_min(i,j)=min(Poisson(i,j,:));
        Young_max(i,j)=max(Young(i,j,:));
        Young_min(i,j)=min(Young(i,j,:));
        Compress_max(i,j)=max(Compress(i,j,:));
        Compress_min(i,j)=min(Compress(i,j,:));
    end
end
Quantity=Poisson_max;   %%%%%% Mention which quantity to plot


%% Plot
[T,P]=meshgrid(alpha,beta);
[x,y,z]=sph2cart(T,P,Quantity');

% ax=reshape(x',[],1);ay=reshape(y',[],1);az=reshape(z',[],1);
% scatter3(ax,ay,az)
ss=surf(x,y,z,Quantity','FaceAlpha',1.0,'LineStyle',':','LineWidth',0.001,'FaceColor','interp');
%caxis([40 45])
%caxis([105 112])
set(gca,'xtick',[-max(max(max(Quantity))),0,max(max(max(Quantity)))],...
    'ytick',[-max(max(max(Quantity))),0,max(max(max(Quantity)))],...
    'ztick',[-max(max(max(Quantity))),0,max(max(max(Quantity)))],...
    'XTickLabel', []);set(gca, 'YTickLabel', []);set(gca, 'ZTickLabel', [])
%set(gca,'XTickLabel', []);set(gca, 'YTickLabel', []);set(gca, 'ZTickLabel', [])
maxim=round(max(max(Quantity)),1);
minim=round(min(min(Quantity)),1);
if isequal(Quantity,Poisson_max)|| isequal(Quantity,Poisson_min)
    text([maxim*0.6 maxim*0.6],[maxim*0.6 maxim*0.6],[maxim maxim*0.7],{strcat('Max=',string(maxim)),strcat('Min=',string(minim))},'FontSize',25)
else
    text([maxim*0.6 maxim*0.6],[maxim*0.6 maxim*0.6],[maxim maxim*0.7],{strcat('Max=',string(maxim),' GPa'),strcat('Min=',string(minim),' GPa')},'FontSize',25)
end
box on
pbaspect([1 1 1])
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 8 8])
