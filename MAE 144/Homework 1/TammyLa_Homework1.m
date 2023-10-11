%% Problem 2a:
clc,clear,close all

b=RR_poly([-2,2,-5,5],1);
a=RR_poly([-1,1,-3,3,-6,6],1);
f=RR_poly([-1,-1,-3,-3,-6,-6],1);

[x,y]=RR_Diophantine(a,b,f)
D=y/x

test=trim(a*x+b*y);
residual=norm(f-test)
%% Problem 2b:
clc,clear,close all

b=RR_poly([-2,2,-5,5],1);
a=RR_poly([-1,1,-3,3,-6,6],1);
f=RR_poly([-1,-1,-3,-3,-6,-6,-20,-20,-20,-20,-20,-20],1);

[x,y]=RR_Diophantine(a,b,f)
D=y/x

test=trim(a*x+b*y);
residual=norm(f-test)
%% Problem 3:
clc,clear,close all

b=[];
a=[];
f=[];
h=;
omega=0;
z1=1;
p1=10;

[x,y]=RR_Diophantine(a,b,f)

if n=/=m
    disp('This transfer function is not semi-causal since!')
end

Dz=TL_C2D_matched(z1,p1)

function [Dz]=TL_C2D_matched(z1,p1)
    Ds=RR_tf(y,x);
    [Dz]=RR_C2D_tustin(Ds,h,omega);
    disp('Corresponding Matlab solution:')
    opt = c2dOptions('Method','tustin','PrewarpFrequency',omega); c2d(tf(y,x),h,opt)
end