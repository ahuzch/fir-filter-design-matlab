%%
clc;
clear all;
close all;
% Hanning window design
p=fir1(6,3/4,hanning(7))
fvtool(p)
