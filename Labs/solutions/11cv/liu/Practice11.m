clear all;
clc;
close all;

m=0.75* 0.961;
c=4211;

t=[1 2 3 4 5 6 7 8 9 10];
T=[73.94 33.06 44.93 20.91 26.29 11.91 14.23 12.53 10.83 4.47];
f=@(x,t)x(1)*exp((-t/(m*c))*x(2));
obj=lsqcurvefit(f,[1 1],t,T);

T0=obj(1);
k=obj(2);
kgrid=k-4:1:k+4;
T0grid=T0-4:1:T0+4;
S=zeros(length(kgrid));

for i=1:9
    for j=1:9
        for h=1:10
            S(i,j)=S(i,j)+(T0grid(i)*exp(-kgrid(j)*t(h)/(m*c))-T(h)).^2; 
        end
    end
end

mesh(T0grid,kgrid,S);


%TT=T0*exp(t*(-k/(m*c)));
%plot(t,TT);

%hold on 
%plot(t,T,'r*');
