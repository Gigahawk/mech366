T_1 = 3.2;
T_2 = 9.6;
T_d = T_2 - T_1;
f_d = 1/T_d;
omega_d = 2*pi*f_d;
y_inf = 1;
y_1 = 1.53 - y_inf;
y_2 = 1.14 - y_inf;

delta = log(y_1/y_2);
zeta = 1/sqrt(1 + (2*pi/delta)^2);

K = 1/10;
omega_n = omega_d/sqrt(1 - zeta^2);

step_input = 10;