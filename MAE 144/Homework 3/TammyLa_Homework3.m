%% Problem 1:
clc,clear,close all

G=tf(0.1,[1,0.1],'InputDelay',6);
bode(G);
grid on
%% Problem 4a:
clc,close all

figure(1)
Gp=pade(G,2);
figure(1)
rlocus(Gp)

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

figure(2)
D=tf(Kp*TD*[1,1/TD,1/(TI*TD)],[1,0]);
DG=D*G;
bode(DG)
margin(DG)
%% Problem 6a:
clc,close all

Ds=RR_tf(0.1,[1,0.1]);
[Dz]=RR_C2D_tustin(Ds,2,0.318);
opt = c2dOptions('Method','tustin','PrewarpFrequency',0.318);
c2d(tf(0.1,[1,0.1]),2,opt)