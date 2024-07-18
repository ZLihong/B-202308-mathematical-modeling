clear;
clc;
global j;
j = 1;
A = [0 0 0 -1 -1 -1; %% 0*c1+0*c2+0*c3-c4-c5-c6<=-2  
    1 0 0 -20000 0 0;%% 1*c1+0*c2+0*c3-20000*c4+0*c5+0*c6<=0 
    0 1 0 0 -20000 0;%% 0*c1+1*c2+0*c3+0*c4-20000*c5+0*c6<=0 
    0 0 1 0 0 -20000];%% 0*c1+0*c2+1*c3+0*c4+0*c5-20000*c6<=0 
b = [-2;0;0;0];
Aeq = [];
beq = [];
lb = [0 0 0  0 0 0];
ub = [100 100 100 1 1 1];
for i = 1:10
x0 =[70 80 60 1 1 1 ];
options = optimset('Display', 'iter-detailed');
[x,fval] = fmincon(@jisuanlaqycz,x0,A,b,Aeq,beq,lb,ub,@myfun,options)
 j = j+1;
end


