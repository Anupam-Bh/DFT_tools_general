function [ Aij ] = CalculateA(a,b,t)

A=cos(a)*cos(b);B=sin(a)*cos(b); C=sin(b);
D=-cos(a)*sin(b);E=-sin(a);F=-sin(a)*sin(b);
G=cos(a);H=cos(b);
Aij=[A B C;D*sin(t)+E*cos(t) F*sin(t)+G*cos(t) H*sin(t);D*cos(t)-E*sin(t) F*cos(t)-G*sin(t) H*cos(t)];

