% Vout vs Pin
% 8400 MHz, R6 = 1180, R2 = 2k,

VoutvsPin = readmatrix('Vout vs Pin.csv', "VariableNamingRule", "Preserve");

Pin = VoutvsPin(:, 1);
Vout = VoutvsPin(:, 2);

plot(Pin, Vout)
grid on