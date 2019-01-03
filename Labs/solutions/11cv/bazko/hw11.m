close all; clear all; clc; 
% values
c=4211;
V=.75;
ro=.961;
m=V*ro;

% computing T0 and k with least square method
load data11practice.mat;
x = lsqcurvefit(@(Z,t)Z(1)*exp((-Z(2))*t/(m*c)) ,[0 100], t, T)

% finding time when temperature would be 10 celcius 
syms t;
a=solve('10=96.5269*exp(-819.215510*t/(0.72075*4211))', t)

%findiang T0 from repeating experiment
z = lsqcurvefit(@(P,t)P(1)*exp((-k)*t/(m*c)), [0], [2 4 6], [33.06 20.91 11.91])

%plotting experimental data and approximation curve
F=x(1)*exp((-x(2))*t/(m*c));
figure (1);
plot(t, T, 'b*');
hold on;
plot(t, F, 'r-' );
hold off;

k=x(2);
T0=x(1);

%plotting mesh
kgrid=k-4:1:k+4;
T0grid=T0-4:1:T0+4;
S=zeros(length(kgrid));

for i=1:9
    for j=1:9
        for h=1:10
            S(i,j)=S(i,j)+(T0grid(i)*exp((-t(h))*kgrid(j)/(m*c))-T(h))^2;
        end
    end
end

figure (2);
Z=meshgrid(t,F);
mesh(T0grid, kgrid, S);