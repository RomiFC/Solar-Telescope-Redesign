% Vout versus Pin for an Omni Spectra 2087-6010-00 Model 20090
% 10MHz to 12.4 GHz Bandwidth, Measured at 8.4 GHz

% Importing Data
DiodeData = readmatrix('Diode Test 8400MHz.csv', "VariableNamingRule", "Preserve");
Pin_dBm = DiodeData(:,1);
Vout = -DiodeData(:,2);
Pin_mW = 10 .^ (Pin_dBm./10);

% Graphing
figure(1)
tiledlayout('flow')
nexttile
semilogy(Pin_dBm, Vout, 'LineWidth', 1.5);
grid on
title('Input Power (dBm) vs Output Voltage (mV)')