% Linear ALgebra - Gilbert Strang C2.1E30

clear
v=[0; 1];
A=[.8 .3; .2 .7];
x=v;
k=[0:7];
for j = 1:7
    v = A*v;
    x=[x v];
end
plot(k,x)

hold on

s=[.6; .4];
A=[.8 .3; .2 .7];
x=s;
k=[0:7];
for j = 1:7
    s = A*s;
    x=[x s];
end
plot(k,x)

hold off