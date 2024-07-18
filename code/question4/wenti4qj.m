
clear;
clc;
global j;
j = 1;
A = [1 0 0 -20000 0 0;
    0 1 0 0 -20000 0;
    0 0 1 0 0 -20000];
b = [0;0;0];
Aeq = [];
beq = [];
lb = [0 0 0  0 0 0];
ub = [100 100 100 1 1 1];
for i = 1:5
x0 =[1 1 1 1 1 1 ];
[x,fval] = fmincon(@jisuanlaqycz4,x0,A,b,Aeq,beq,lb,ub,@myfun4)
 j = j+1;
end


