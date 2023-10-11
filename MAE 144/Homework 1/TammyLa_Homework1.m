clc, clear, close all
%% Problem 2a:
b=RR_poly([-2,2,-5,5],1);
a=RR_poly([-1,1,-3,3,-6,6],1);
f=RR_poly([-1,-1,-3,-3,-6,-6],1);
[x,y]=RR_Diophantine(a,b,f)
D=y/x
test=trim(a*x+b*y);
residual=norm(f-test)
%% Problem 2b:
b=RR_poly([-2,2,-5,5],1);
a=RR_poly([-1,1,-3,3,-6,6],1);
f=RR_poly([-1,-1,-3,-3,-6,-6,-20,-20,-20,-20,-20,-20],1);
[x,y]=RR_Diophantine(a,b,f)
D=y/x
test=trim(a*x+b*y);
residual=norm(f-test)
%% Problem 3:
