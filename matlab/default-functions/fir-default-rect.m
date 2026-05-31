%%
clc;
clear all;
close all;
% Rectangular window design
p=fir1(6,3/4,rectwin(7))
fvtool(p)
