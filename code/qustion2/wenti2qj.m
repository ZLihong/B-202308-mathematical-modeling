clear;
clc;
global j;
j =1;
A = [ 0 0 0 -1 -1 -1;
    1 0 0 -20000 0 0;
    0 1 0 0 -20000 0;
    0 0 1 0 0 -20000];
b = [-2;0;0;0];
Aeq = [];
beq = [];
lb = [0 0 0 0 0 0];
ub = [100 100 100 1 1 1];
c = zeros(10,6);
derta_e = zeros(10,1);
for i = 1:10
options = optimoptions('ga');
options = optimoptions(options,'Display', 'iter');
 options = optimoptions(options,'PlotFcn', {  @gaplotbestf});
[x,fval,e,o,population] = ga(@jisuanlaqycz,6,A,b,Aeq,beq,lb,ub,@myfun,[4,5,6],options)
c(i,:) = x;
derta_e(i) = fval;
 j = j+1;
end
if (fval<1)
    disp(fval)
end


