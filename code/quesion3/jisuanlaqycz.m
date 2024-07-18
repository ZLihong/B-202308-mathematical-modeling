function fx = jisuanlaqycz(c)
p1 = [0.713591864	1.591007874	0.370637746;
0.666862453	1.691007874	0.292606535;
0.63836253	1.891007874	0.282606535;
0.620659166	1.701007874	0.362606535;
1.07116036	1.291007874	0.392606535;
1.667703212	0.840990123	0.538877991;
2.467703212	0.390990123	0.678877991;
2.667703212	0.149212641	0.880411654;
2.567703212	0.059178786	1.280411654;
1.073489876	0.024190869	1.675274055;
0.23339202	0.006909969	1.875274055;
0.049625604	0.002210368	1.971128045;
0.009681353	0.000994167	1.895274055;
0.004930251	0.000594108	1.280411654;
0.001674618	0.000394167	0.492606535;
0.000674618	0.000323599	0.342606535;
];
p2 = [0.657978667	0.488193347	0.04917266;
0.280032077	0.498506347	0.019597966;
0.1606778	0.488868347	0.017707966;
0.179748757	0.422737347	0.015986966;
0.229827047	0.326733347	0.018056966;
0.292492592	0.212081072	0.034700431;
0.359049592	0.112618072	0.039331431;
0.334666592	0.047772021	0.033717201;
0.379317592	0.024043001	0.036076201;
0.04637343	0.009779113	0.05682813;
0.011485361	0.004689499	0.06412713;
0.008978662	0.002408717	0.068789763;
0.006758353	0.002014535	0.05976913;
0.005152947	0.001772776	0.029327201;
0.006660528	0.001681535	0.017692966;
0.006361528	0.00144996	0.004633966;
];

sxyz = [0.136	0.014	0.613;
1.644	0.172	7.820;
3.463	0.560	17.755;
3.065	1.300	17.697;
0.803	2.530	7.703;
0.036	4.337	2.056;
1.062	6.870	0.548;
3.385	8.644	0.123;
6.069	8.583	0.000;
8.361	7.163	0.000;
8.707	5.100	0.000;
6.463	3.004	0.000;
3.109	1.295	0.000;
1.053	0.416	0.000;
0.275	0.107	0.000;
0.059	0.023	0.000;
];
x = [400 420 440 460 480 500 520 540 560 580 600 620 640 660 680 700]';
y1 = zeros(16,1);
y2 = zeros(16,1);
y3 = zeros(16,1);
y1(:,1) = p1(:,1).*c(1).*c(4) + p2(:,1);
y2(:,1) = p1(:,2).*c(2).*c(5)+ p2(:,2);
y3(:,1) = p1(:,3).*c(3).*c(6) + p2(:,3);
a=[	0.039492 0.025906 	0.017964 	0.015092 	0.011439 	0.009515 	0.007961 	0.006947 	0.006284 	0.005889 	0.005238 	0.004948 	0.004626 	0.004247 	0.004100 	0.003617]';
kchushh = a+((c(4).*c(1).*p1(:,1)+c(5).*c(2).*p1(:,2)+c(6).*c(3).*p1(:,3)));
R = 1+kchushh-(kchushh.^2+2.*kchushh).^(1/2);
XYZ = zeros(1,3);
for i = 1:3
    XYZ(i) = trapz(x,sxyz(:,i).*R.*20)/10;
end

X = XYZ(1);
Y = XYZ(2);
Z = XYZ(3);
X0 = 94.83;
Y0 = 100;
Z0 = 107.38;
if (X/X0<=0.008856)&&(Y/Y0<=0.008856)&&(Z/Z0<=0.008856)
    L = 903.3*(Y/Y0);
    A = 3893.5*((X/X0)-(Y/Y0));
    B = 1557.4*((Y/Y0)-(Z/Z0));
else
    L = 116*(Y/Y0)^(1/3)-16;
    A = 500*((X/X0)^(1/3)-(Y/Y0)^(1/3));
    B = 200*((Y/Y0)^(1/3)-(Z/Z0)^(1/3));
end
LABZ = [232.32824	77.58855806	-12.98854604;
261.6840234	13.59083067	-13.48381284;
249.6762506	28.61556723	-19.76907897;
238.4668792	-17.01169503	-29.57018218;
248.0265441	-14.88715709	-24.8586555;
230.2081213	80.04065377	-17.13875725;
236.3476146	54.36358841	39.61895595;
259.5447273	11.32399386	4.062943533;
245.5122441	-11.36213225	-22.82583228;
230.5469296	-14.61120585	0.61209531;
];
global j;
LZ = LABZ(j,1); 
AZ = LABZ(j,2);
BZ = LABZ(j,3);
fx = 0.5*sqrt((L-LZ)^2+(A-AZ)^2+(B-BZ)^2)+0.5*2*(60.*c(4).*c(1)+65.*c(5).*c(2)+63.*c(3).*c(6));

end