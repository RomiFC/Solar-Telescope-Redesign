% Amplifier gain calculations for VLA Solar Telescope
% S parameters measured with 30dB output attenuation

% Importing data
ZX60A = sparameters('ZX60-83LN-S+ (A), 30dB Output Attenuator.s2p');
ALS = sparameters('ALS-04-0149 30dB Output Attenuator.s2p');
S21_ZX = mag2db( abs( rfparam(ZX60A, 2, 1) )) + 30;     % 30dB Normalized
Freq = rfparam(s2abcd(ZX60A, 50), 'D');

% Graphing S-Parameters
