% =========================================================================
% Description:
%   Designs a 7th-order highpass FIR filter using three window functions:
%   Rectangular, Hamming, and Hanning. The filter coefficients produced
%   by fir1() are validated against hand-calculated values.
%
% Frequency Characteristic:
%   H(w) = e^(-j3w),  for 3*pi/4 <= |w| <= pi
%   H(w) = 0,         otherwise
%
% Cutoff Frequency : 3*pi/4  (normalized to 3/4 in MATLAB's 0-to-1 scale)
% Filter Order     : 6       (7th-order filter has 7 coefficients, n = 0 to 6)
% =========================================================================

clc;
clear all;
close all;

% -------------------------------------------------------------------------
% Filter specifications
% -------------------------------------------------------------------------
order = 6;      % Since it is a 7th-order FIR filter, M = 7 (order = M-1)
cut_off = 3/4;  % Normalized cut-off frequency (3π/4)
                % MATLAB's fir1 uses normalized frequency where 1 = pi rad/sample
                % so 3*pi/4 is represented as 3/4

% =========================================================================
% RECTANGULAR WINDOW
% =========================================================================
% The rectangular window applies equal weight (1) to all coefficients.
% It has the simplest form but produces the highest sidelobe levels,
% leading to the most spectral leakage among the three windows.
% -------------------------------------------------------------------------

% Create a 7-point rectangular window (all ones)
window_rect = rectwin(order + 1);

% Design the highpass FIR filter using the rectangular window
% fir1(order, cutoff, 'high', window) — 'high' specifies highpass type
filter_rect = fir1(order, cut_off, 'high', window_rect);

% Compute the frequency response at 1024 equally spaced frequency points
% H_rect : complex frequency response values
% w      : corresponding frequency points in radians/sample (0 to pi)
[H_rect, w] = freqz(filter_rect, 1, 1024);

% Plot the magnitude and phase response for Rectangular Window
figure;

subplot(2, 1, 1);
% w/pi normalizes x-axis to [0, 1] where 1 = pi rad/sample
% abs(H_rect) gives the magnitude of the frequency response
plot(w/pi, abs(H_rect));
title('Magnitude Response (Rectangular Window)');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude');
grid on;

subplot(2, 1, 2);
% angle(H_rect) gives the phase of the frequency response in radians
plot(w/pi, angle(H_rect));
title('Phase Response (Rectangular Window)');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Phase (radians)');
grid on;

% Display the 7 filter coefficients (n = 0 to 6) for the rectangular window
disp('Filter Coefficients (Rectangular Window):');
disp(filter_rect);

% =========================================================================
% HAMMING WINDOW
% =========================================================================
% The Hamming window uses the formula:
%   w(n) = 0.54 + 0.46 * cos(2*pi*n / (N-1)),  0 <= n <= N-1
% It reduces sidelobe levels compared to the rectangular window,
% resulting in less spectral leakage at the cost of a wider main lobe.
% -------------------------------------------------------------------------

% Create a 7-point Hamming window
window_hamming = hamming(order + 1);

% Design the highpass FIR filter using the Hamming window
filter_hamming = fir1(order, cut_off, 'high', window_hamming);

% Compute the frequency response at 1024 frequency points
[H_hamming, w] = freqz(filter_hamming, 1, 1024);

% Plot the magnitude and phase response for Hamming Window
figure;

subplot(2, 1, 1);
plot(w/pi, abs(H_hamming));
title('Magnitude Response (Hamming Window)');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude');
grid on;

subplot(2, 1, 2);
plot(w/pi, angle(H_hamming));
title('Phase Response (Hamming Window)');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Phase (radians)');
grid on;

% Display the 7 filter coefficients (n = 0 to 6) for the Hamming window
disp('Filter Coefficients (Hamming Window):');
disp(filter_hamming);

% =========================================================================
% HANNING WINDOW
% =========================================================================
% The Hanning window uses the formula:
%   w(n) = 0.5 - 0.5 * cos(2*pi*n / (N-1)),  0 <= n <= N-1
% It provides the lowest sidelobe levels among the three windows,
% offering the best spectral leakage suppression. The first and last
% coefficients are forced to zero, giving a smoother taper.
% Note: MATLAB uses hann() for the Hanning window function.
% -------------------------------------------------------------------------

% Create a 7-point Hanning window
window_hanning = hann(order + 1);

% Design the highpass FIR filter using the Hanning window
filter_hanning = fir1(order, cut_off, 'high', window_hanning);

% Compute the frequency response at 1024 frequency points
[H_hanning, w] = freqz(filter_hanning, 1, 1024);

% Plot the magnitude and phase response for Hanning Window
figure;

subplot(2, 1, 1);
plot(w/pi, abs(H_hanning));
title('Magnitude Response (Hanning Window)');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude');
grid on;

subplot(2, 1, 2);
plot(w/pi, angle(H_hanning));
title('Phase Response (Hanning Window)');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Phase (radians)');
grid on;

% Display the 7 filter coefficients (n = 0 to 6) for the Hanning window
disp('Filter Coefficients (Hanning Window):');
disp(filter_hanning);
