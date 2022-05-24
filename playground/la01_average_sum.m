% Linear ALgebra - Gilbert Strang

v = randn(3,1);
v_m = sqrt((v(1))^2 + (v(2))^2 + (v(3))^2);
u = v/v_m;
u_m = sqrt((u(1))^2 + (u(2))^2 + (u(3))^2);
V = randn(3,30);
k = 1;
res = 0;
for k = 1:10
    res = res + abs(dot(u, V(1:3,k)));
end
res = res/10