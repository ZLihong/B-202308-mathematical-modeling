function [cb,ceq] = myfun4(c)
   cb = seshu4(c)-1;
  ceq =[c(4)*(c(4)-1);
      c(5)*(c(5)-1);
      c(6)*(c(6)-1);
      ];
end