% Linear ALgebra - Gilbert Strang

clear
P = [1 0 0 0; 1 1 0 0; 1 2 1 0; 1 3 3 1]
E1 = [1 0 0 0; -1 1 0 0; 0 -1 1 0; 0 0 -1 1]
P1 = E1 * P

E2 = [1 0 0 0; 0 1 0 0; 0 -1 1 0; 0 1 -2 1]
P2 = E2 * P1

M = E1 * E2