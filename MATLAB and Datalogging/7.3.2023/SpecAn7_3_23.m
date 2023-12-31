% Recreating spectrum analyzer plot of telescope pointed near the sun with
% 30dB of gain from two ZX60-83LN-S+ low noise amplifiers.

% Mean noise power is -107.2 dBm, mean signal power is -92.6 dBm
% SNR is 14.6 dB

% Importing data
specplot = readmatrix('SpecAn7.3.23.txt', "VariableNamingRule", "Preserve");
freq = specplot(:, 1);
pwr = specplot(:, 2);
avgpwr = sgolayfilt(pwr, 1, 31);
noisepwr = specplot(:, 3);

% Graphing
figure(1)
tiledlayout('flow')
nexttile
plot(freq, pwr, freq, avgpwr, freq, noisepwr, 'LineWidth', 1.5);
grid on
title('Spectrum Analyzer Plot: Mean Signal Power (dBm) = ', mean(pwr))
axis([freq(1, 1) freq(end, 1) -110 -85])
legend('Incident Power', 'Averaged Power', 'Noise Power')
xlabel('Frequency (MHz)')
ylabel('Power at 100kHz RBW (dBm)')

% Output csv
writematrix([freq, pwr, noisepwr], 'SpecAn7_3_23.txt', 'Delimiter', 'tab');