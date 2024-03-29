function [fitresult, gof,coeff] = latparamFit(x1, x2)
%CREATEFIT(X1,X2)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x1
%      Y Output: x2
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 05-Feb-2020 21:29:20


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( x1, x2 );

% Set up fittype and options.
ft = fittype( 'a*x^3+b*x^2+c*x+d', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.495138046882843 0.0204331692610651 0.203028420854817 0.378148438082143];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
c= fit( xData, yData, ft, opts );
format long
coeff = coeffvalues(c)
% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
%h = plot(fitresult);
h = plot( fitresult, xData, yData )
%b = gca; legend(b,'off');
legend({'Energy vs. lattice parameter', 'fitted equation'},'Location','NorthEast','FontSize',14,'Interpreter','latex' );
h(1).LineWidth = 10;
h(2).MarkerSize = 20;
% Label axes
xlabel('Lattice parameter (\AA)','Interpreter','latex')
ylabel('Total Energy (eV)','Interpreter','latex')
xlim([4.47 4.53]);
set(gca,'Xgrid','on','Ygrid','on','Fontweight','normal','Fontsize',18);
pbaspect([1 1 1])
