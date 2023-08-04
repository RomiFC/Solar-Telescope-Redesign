clear
clc
% Recreating spectrum analyzer plot of telescope with 42 dB of gain
% Trace A is at the sun, Trace B is at the ground
% RBW = 100 kHz, VBW = 30 kHz

% Importing data
specRHS = readmatrix('SpectrumRHS', "VariableNamingRule", "Preserve");
freqR = specRHS(:, 1);
traceaRHS = specRHS(:, 2);
tracebRHS = specRHS(:, 4);
specLHS = readmatrix('SpectrumLHS', "VariableNamingRule", "Preserve");
freqL = specLHS(:, 1);
traceaLHS = specLHS(:, 2);
tracebLHS = specLHS(:, 4);

% Calculating channel power in passband (7.8-8.9 GHZ)
L1 = freqR > 7800 & freqR < 8900;
passbandFreqR = freqR(L1, :);
passbandPWR_A_RHS = traceaRHS(L1, :);
chPWR_A_RHS = mean(passbandPWR_A_RHS) - 50 + 90.4;
passbandPWR_B_RHS = tracebRHS(L1, :);
chPWR_B_RHS = mean(passbandPWR_B_RHS) - 50 + 90.4;

L2 = freqR > 7800 & freqR < 8900;
passbandFreqL = freqL(L2, :);
passbandPWR_A_LHS = traceaLHS(L2, :);
chPWR_A_LHS = mean(passbandPWR_A_LHS) - 50 + 90.4;
passbandPWR_B_LHS = tracebLHS(L2, :);
chPWR_B_LHS = mean(passbandPWR_B_LHS) - 50 + 90.4;

% Graphing
figure(1)
tiledlayout('flow')

nexttile
plot(freqL, traceaLHS, freqL, tracebLHS, 'LineWidth', 1.5);
grid on
title({
    ['Spectrum Analyzer Plot (Left Hand Side Feed, Cloudy)']
    ['Sun Channel Power = ' num2str(chPWR_A_LHS) ', Ground Channel Power = ' num2str(chPWR_B_LHS)]
    })
axis([freqL(1, 1) freqL(end, 1) -90 -70])
legend('Sun Power', 'Ground Power')
xlabel('Frequency (MHz)')
ylabel('Power at 100kHz RBW (dBm)')

nexttile
plot(freqR, traceaRHS, freqR, tracebRHS, 'LineWidth', 1.5);
grid on
title({
    ['Spectrum Analyzer Plot (Right Hand Side Feed, Sunny)']
    ['Sun Channel Power = ' num2str(chPWR_A_RHS) ', Ground Channel Power = ' num2str(chPWR_B_RHS)]
    })
axis([freqR(1, 1) freqR(end, 1) -90 -70])
legend('Sun Power', 'Ground Power')
xlabel('Frequency (MHz)')
ylabel('Power at 100kHz RBW (dBm)')