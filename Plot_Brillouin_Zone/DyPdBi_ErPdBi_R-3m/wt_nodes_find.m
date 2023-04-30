clc
clear all
%   format long
M=dlmread('Nodes.dat','',2,0);
size(M)
C = M(M(:,4)== 0.0000,:)
scatter3(C(:,1),C(:,2),C(:,3))
