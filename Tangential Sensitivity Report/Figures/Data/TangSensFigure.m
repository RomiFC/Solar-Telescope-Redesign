clear
clc
% Generates an oscilloscope plot of a tangential sensitivity measurement

syms x
f1(x) = piecewise(-0.5 <= x < 0, 0.4, 0 < x <= 0.25, 1, 0.25 < x <= 0.5, 0.4);

x1 = [-0.5: 0.001: 0.5];
u1 = 0.8*rand(size(x1)) - 0.5;
y = double(f1(x1) + u1);
csv = [x1; y]';
writematrix(csv, 'exampleTS.txt', 'Delimiter', 'tab');

plot(x1, y)
grid on
