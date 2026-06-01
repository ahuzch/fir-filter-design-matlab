clc;
clear all;
close all;

% Filter specifications
order = 6; % Since it is a 7th-order FIR filter, M = 7 (order = M-1)
cut_off = 3/4; % Normalized cut-off frequency (3π/4)

%Designing the Filter Using Rectangular Window
window_rect = rectwin(order + 1);
filter_rect = fir1(order, cut_off, 'high', window_rect);

% Frequency response analysis using freqz
[H_rect, w] = freqz(filter_rect, 1, 1024);

% Plotting the magnitude and phase response for Rectangular Window
figure;
subplot(2, 1, 1);
plot(w/pi, abs(H_rect));
title('Magnitude Response (Rectangular Window)');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude');
grid on;
subplot(2, 1, 2);
plot(w/pi, angle(H_rect));
title('Phase Response (Rectangular Window)');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Phase (radians)');
grid on;

% Display filter coefficients
disp('Filter Coefficients (Rectangular Window):');
disp(filter_rect);

%Designing the Filter Using Hamming Window
window_hamming = hamming(order + 1);
filter_hamming = fir1(order, cut_off, 'high', window_hamming);

% Frequency response analysis using freqz
[H_hamming, w] = freqz(filter_hamming, 1, 1024);

% Plotting the magnitude and phase response for Hamming Window
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

% Display filter coefficients
disp('Filter Coefficients (Hamming Window):');
disp(filter_hamming);

%Designing the Filter Using Hanning Window
window_hanning = hann(order + 1);
filter_hanning = fir1(order, cut_off, 'high', window_hanning);

% Frequency response analysis using freqz
[H_hanning, w] = freqz(filter_hanning, 1, 1024);

% Plotting the magnitude and phase response for Hanning Window
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

% Display filter coefficients
disp('Filter Coefficients (Hanning Window):');
disp(filter_hanning);
