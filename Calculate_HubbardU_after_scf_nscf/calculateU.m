%clc
clear all

alpha=[ -0.15 -0.1 -0.05 0.0 0.05 0.1 0.15];
% nscf=[9.957 10.419 10.878 11.335 11.784 12.217 12.613];
% scf=[11.315 11.322 11.328 11.335 11.341 11.349 11.355];
% U with soc 9000
% nscf=[10.251 10.586 10.944 11.322 11.715 12.110 12.488];
% scf=[11.302 11.308 11.316 11.322 11.326 11.340 11.341];
%U with soc 000 EPB
nscf=[10.247 10.580 10.939 11.322 11.721 12.120 12.500];
scf=[11.302 11.309 11.316 11.322 11.328 11.335 11.340];

% scf=[ 11.315 11.321 11.327 11.334 11.342 11.347 11.353];
% nscf=[ 10.044 10.415 10.876 11.334 11.787 12.221 12.542]; 
 
% scf=[11.314 11.321 11.328 11.334 11.339 11.348 11.355];
% nscf=[9.953 10.416 10.877 11.334 11.787 12.221 12.617];

%U with SOC
% nscf=[10.247 10.580 10.939 11.322 11.721 12.120 12.500];
% scf=[11.303 11.309 11.316 11.322 11.325 11.336 11.341];

%U with GdPdBi
nscf=[7.090 7.098 7.109 7.122 7.140 7.165 7.198];
scf=[7.106 7.111 7.117 7.122 7.128 7.134 7.140];

[fit_nscf, gof_nscf]= createFit_nscf(alpha,nscf)
[fit_scf, gof_scf]= createFit_scf(alpha,scf)
coeff_nscf=coeffvalues(fit_nscf)
coeff_scf=coeffvalues(fit_scf)
%% plot
figure(1)
plot(alpha,nscf,'ok','MarkerSize',5)
hold on 
plot(alpha,scf,'or','MarkerSize',5)
hold on 
plot(fit_nscf,'k');
hold on
plot(fit_scf,'r');

MarkerSize = 10
xlabel \alpha
ylabel('occupation of ''f'' orbital')
legend('nscf occupation of ''f''', 'scf occupation of ''f''', 'Location', 'NorthEast' );
set(gca,'Xgrid','on','Ygrid','on','Fontweight','normal','Fontsize',18,'Fontname','Heveltica');
xlim([-0.15 0.15])
U=(1/coeff_scf(1))-(1/coeff_nscf(1))