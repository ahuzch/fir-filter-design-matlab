% =========================================================================
% EEE343 - Digital Signal Processing | Summer 2024
% Design Assignment — 7th Order FIR Filter (Rectangular Window)
%
% Description:
%   Designs a 7th-order FIR filter using MATLAB's built-in fir1() with
%   a rectangular window. Output is visualized using fvtool(). Results
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
% Author : Group 04 — Section 02, BRAC University
% Date   : 30/09/2024
% =========================================================================

%%
clc;        % Clear command window
clear all;  % Clear all variables from workspace
close all;  % Close all open figure windows

% Rectangular window design
% fir1(6, 3/4, rectwin(7)):
%   6          — filter order (M-1), where M = 7
%   3/4        — normalized cutoff frequency representing 3*pi/4
%   rectwin(7) — 7-point rectangular window (all weights = 1)
p=fir1(6,3/4,rectwin(7))

% Open MATLAB's Filter Visualization Tool to inspect:
%   - Magnitude response (dB)
%   - Phase response
%   - Pole-zero plot (used for stability analysis)
fvtool(p)
