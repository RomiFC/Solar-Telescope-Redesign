% Recreating spectrum analyzer plot of telescope pointed near the sun with
% 30dB of gain from two ZX60-83LN-S+ low noise amplifiers.

% Importing data
specplot = readmatrix('Spectrum Trace Towards Sun, 30dB Gain.txt', "VariableNamingRule", "Preserve");
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