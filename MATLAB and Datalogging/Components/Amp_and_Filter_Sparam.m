clear
clc
% Amplifier gain calculations for VLA Solar Telescope
% S parameters measured with 30dB output attenuation

% Importing data
ZX60A = sparameters('ZX60-83LN-S+ (A), 30dB Output Attenuator.s2p');
ALS = sparameters('ALS-04-0149 30dB Output Attenuator.s2p');
filter = sparameters('Unmarked Bandpass Filter.s2p');
S21_filter = mag2db( abs( rfparam(filter, 2, 1) ));
S21_ZX60 = mag2db( abs( rfparam(ZX60A, 2, 1) )) + 30;     % 30dB Normalized
S21_ALS = mag2db( abs( rfparam(ALS, 2, 1) )) + 30;        % 30dB Normalized
freq = ZX60A.Frequencies;

% Graphing S-Parameters
figure(1)
tiledlayout('flow')
nexttile
rfplot(ZX60A, 2, 1)
hold on
rfplot(ALS, 2, 1)
grid on
title('ZX60-83LN-S+ (Blue) and ALS-04-0149 (Red)')
xlabel('Frequency (GHz)')
ylabel('S21 (dB)')

% Filter
nexttile
rfplot(filter, 2, 1)
grid on
title('Unmarked Bandpass Filter')
xlabel('Frequency (GHz)')
ylabel('S21 (dB)')

% Mean LNA gain in the passband
L = freq > 7800*10^6 & freq < 8900*10^6;
pbFreq = freq(L, :);
pbGainZX60 = S21_ZX60(L, :);
pbGainALS = S21_ALS(L, :);
disp(mean(pbGainZX60))
disp(mean(pbGainALS))

% Output csv
writematrix([freq/10^6, S21_ZX60, S21_ALS, S21_filter], 'Amplifiers and Filter Sparam.txt', 'Delimiter', 'tab');