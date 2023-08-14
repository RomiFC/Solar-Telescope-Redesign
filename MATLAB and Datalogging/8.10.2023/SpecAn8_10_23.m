clear
clc
% Recreating spectrum analyzer plot of telescope with 42 dB of gain
% Trace A is at the sun, Trace B is at the sky, Trace C is at the ground
% RBW = 300 kHz, VBW = 100 kHz

% Importing data
spectrum = readmatrix('FileName_1.txt', "VariableNamingRule", "Preserve");
FreqA = spectrum(:, 2);
TraceA = spectrum(:, 1);
TraceB = spectrum(:, 3);
TraceC = spectrum(:, 5);

% Graphing
figure(1)
tiledlayout('flow')

nexttile
plot(FreqA, TraceA, FreqA, TraceB, FreqA, TraceC, 'LineWidth', 1.5);
grid on
title({
    ['Spectrum Analyzer Plot']
    ['2 ZX60-6203ALN+ LNAs and a 7.8-8.9 GHz filter']
    })
axis([FreqA(1, 1) FreqA(end, 1) -92 -76])
legend('Sun', 'Cold Sky', 'Ground')
xlabel('Frequency (MHz)')
ylabel('Power (dBm/300kHz)')