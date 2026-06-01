%%
clc;
clear all;
close all;
% Hamming window design
p=fir1(6,3/4,hamming(7))
fvtool(p)
