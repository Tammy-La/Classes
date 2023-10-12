%% Problem 2a:
clc,clear,close all

b=RR_poly([-2,2,-5,5],1);
a=RR_poly([-1,1,-3,3,-6,6],1);
f=RR_poly([-1,-1,-3,-3,-6,-6],1);

[x,y]=RR_diophantine(a,b,f)
D=y/x

test=trim(a*x+b*y);
residual=norm(f-test)
%% Problem 2b:
clc,clear,close all

b=RR_poly([-2,2,-5,5],1);
a=RR_poly([-1,1,-3,3,-6,6],1);
f=RR_poly([-1,-1,-3,-3,-6,-6,-20,-20,-20,-20,-20,-20],1);

[x,y]=RR_diophantine(a,b,f)
D=y/x

test=trim(a*x+b*y);
residual=norm(f-test)
%% Problem 3:
clc,clear,close all

for z1=1;p1=10;
    [zz,zp,z0,k]=TL_C2D_matched(z1,p1);
    fprintf('The corresponding D(z) transfer function is:  D(z)=%0.4f*((s+%0.4f)/((s+%0.4f)*(s+%0.4f)))\n',k,zz,z0,zp)
    %The final transfer function should be in the form of Dz=k*((s+zz)/((s+z0)*(s+zp)));
end

Dz=tf([1,z1],[1,p1,0]);
Dzm=c2d(Dz,1/100,'matched')

function [zz,zp,z0,k]=TL_C2D_matched(z1,p1)
% function [Dz]=TL_C2D_matched(z1,p1)
% Converts a given D(s) to a corresponding D(z) using the Matched Z-Transform Method.
% Tammy La - Homework 1, https://github.com/Tammy-La
    h=1/100;
    s1=0;
    DCG=(s1+z1)/(s1+p1);
    zz=exp(z1*h);
    zp=exp(p1.*h);
    z0=exp(0*h);
    s2=1;  
    D2=(s2+zz)/(z0*(s2+zp));
    k=DCG/D2;
end