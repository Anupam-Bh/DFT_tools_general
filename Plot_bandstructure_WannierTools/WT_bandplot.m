%% Plot wanniertools BS plot as superimposed
fid=fopen('bulkek.dat','r');
C=textscan(fid, '%f %f %*[^\n]','headerLines',2);
fclose(fid);
numbands=0;
for i=1:length(C{1})
    if C{1}(i)==C{1}(1)
        numbands=numbands+1;
        if C{1}(i)==C{1}(1) && numbands==2
            numk=i-1;
        end
    end
end
xx=linspace(1,kpts,numk);
 for i=1:numbands
    plw=plot(xx,C{2}((((i-1)*numk)+1):((i*numk))),'ok','MarkerSize',1);
    hold on
 end
% xlim([0,max(C{1})]);
% ylim([-0.1,0.1]);ylabel('E-E_f (eV)');
legend([pl(1) plw(1)],'DFT','tight-binding');
% set(gca,'xlim',[1 303],'Xtick',vertices_xval,'Xticklabel',vertices_char_x,'Ytick',vertices_yval,'Yticklabel',vertices_char_y,'Xgrid','on','Ygrid','on',...
%        'Fontweight','normal','Fontsize',28);