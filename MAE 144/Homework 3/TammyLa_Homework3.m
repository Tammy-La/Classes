%% Problem 1:
clc,clear,close all

y=tf(0.1,[1,0.1],'InputDelay',6);
bode(y);
grid on

%% Problem 4a:
clc,close all

figure(1)
x=pade(y,2);
rlocus(x)
figure(2)
SYS=tf([0.1,0.1],1);
x=pade(y*SYS,2);
rlocus(x)
figure(3)
bode(y*SYS);

a=0.6;
b=0.5;
g=0.125;
Ku=3.4;
wu=0.318;

Kp=a*Ku;
Tu=1/wu;
TI=b*Tu;
wI=1/TI;
TD=g*Tu;
wD=1/TD;
fprintf('The values of Kp, wI, and wD are %0.4f, %0.4f, and %0.4f, respectively.\n',Kp,wI,wD)
%% Problem 4b:
clc,close all

% lsim(SYS,u,t);
%% Problem 6a:
clc,close all

Ds=RR_tf(0.1,[1,0.1]);
[Dz]=RR_C2D_tustin(Ds,2,0.318);
opt = c2dOptions('Method','tustin','PrewarpFrequency',omegac); c2d(tf(ys,xs),h,opt)
%% Problem 6b:
clc,close all
