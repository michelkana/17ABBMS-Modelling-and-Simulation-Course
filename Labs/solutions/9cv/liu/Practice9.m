clear all;close all;clc;
syms k12 k13 k21 V1 s;
A=[-k12-k13 k21 0;k12 -k21 0;k13 0 0];
B=[1;0;0];
C=[1/V1 0 0;0 0 1];
I=eye(3);
TF=C*(inv(s*I-A))*B