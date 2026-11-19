%% Stellar Motion & Redshift Analysis
% Analyzes stellar emission/absorption spectra to determine hydrogen-alpha
% line shifts, redshift factors (z), and radial velocities (km/s) relative to Earth.

clear; clc; close all;

%% 1. Load Data and Define Wavelength Vector
load starData

nObs = size(spectra, 1);
lambdaStart = 630.02; % Starting wavelength (nm)
lambdaDelta = 0.14;   % Wavelength step size (nm)

lambdaEnd = lambdaStart + (nObs - 1) * lambdaDelta;
lambda = lambdaStart:lambdaDelta:lambdaEnd;

%% 2. Single Star Spectrum Analysis (Example: Star #6 - HD 94028)
s6 = spectra(:, 6);
[sHa6, idx6] = min(s6);
lambdaHa6 = lambda(idx6);

figure("Name", "Single Star Spectrum - HD 94028");
plot(lambda, s6, ".-", "Color", [0.1 0.4 0.7]);
hold on;
plot(lambdaHa6, sHa6, "rs", "MarkerSize", 8, "MarkerFaceColor", "r");
hold off;
title("Spectrum of Star HD 94028 with Hydrogen-Alpha Dip");
xlabel("Wavelength (nm)");
ylabel("Intensity");
legend("Observed Spectrum", "H-\alpha Minimum (" + string(lambdaHa6) + " nm)");
grid on;

%% 3. Vectorized Redshift and Radial Velocity Calculation for All Stars
lambdaRest = 656.28;       % Laboratory H-alpha wavelength (nm)
speedOfLight = 299792.458; % Speed of light in vacuum (km/s)

[sHa, idx] = min(spectra);
lambdaHa = lambda(idx);

z = (lambdaHa / lambdaRest) - 1;       % Redshift factor
speed = z * speedOfLight;              % Radial velocity (km/s)

%% 4. Comparative Visualization (Blueshifted vs. Redshifted Spectra)
figure("Name", "Comparative Stellar Spectra");
hold on;
for v = 1:size(spectra, 2)
    s = spectra(:, v);
    if speed(v) <= 0
        % Blueshifted (moving toward Earth) -> dashed line
        plot(lambda, s, "--", "LineWidth", 1.2);
    else
        % Redshifted (moving away from Earth) -> thick solid line
        plot(lambda, s, "LineWidth", 2.8);
    end
end
hold off;

title("Comparison of Stellar Spectra (Blueshifted vs. Redshifted)");
xlabel("Wavelength (nm)");
ylabel("Intensity");
legend(starnames, "Location", "bestoutside");
grid on;

%% 5. Logical Indexing: Identify Stars Moving Away from Earth
movaway = starnames(speed > 0);

disp("Stars moving away from Earth (Redshifted):");
disp(movaway);
