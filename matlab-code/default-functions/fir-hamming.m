% =========================================================================
% Description:
%   Designs a 7th-order FIR filter using MATLAB's built-in fir1() with
%   a Hamming window. Output is visualized using fvtool(). Results
%   serve as the reference benchmark against which the hand-calculated
%   values are validated.
%
% Frequency Characteristic:
%   H(w) = e^(-j3w),  for 3*pi/4 <= |w| <= pi
%   H(w) = 0,         otherwise
%
% Cutoff Frequency : 3*pi/4  (normalized to 3/4 in MATLAB's 0-to-1 scale)
% Filter Order     : 6       (7th-order filter has 7 coefficients, n = 0 to 6)
%
% Window Formula:
%   w(n) = 0.54 + 0.46 * cos(2*pi*n / (N-1)),  0 <= n <= N-1
%   Reduces sidelobe levels compared to the rectangular window,
%   resulting in less spectral leakage at the cost of a wider main lobe.
% =========================================================================

%%
clc;        % Clear command window
clear all;  % Clear all variables from workspace
close all;  % Close all open figure windows

% Hamming window design
% fir1(6, 3/4, hamming(7)):
%   6          — filter order (M-1), where M = 7
%   3/4        — normalized cutoff frequency representing 3*pi/4
%   hamming(7) — 7-point Hamming window
p=fir1(6,3/4,hamming(7))

% Open MATLAB's Filter Visualization Tool to inspect:
%   - Magnitude response (dB)
%   - Phase response
%   - Pole-zero plot (used for stability analysis)
fvtool(p)
