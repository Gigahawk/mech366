J_m = 5.62*10^-5; % kgm^2
b = 2.61*10^-4; % Nms
K_e = 0.068; % V/(rad/s)
K_t = 0.068; % Nm/A
L_a = 3*10^-3; % H
R_a = 1.63; % Ohm
K_Tach = 0.134; % V/(rad/s)
T_mech = 0.0; % Nm
V_a = 14.6; % V
V_sig = 7; %V
K_p = 4.2;


for k = [1 2.1 4.2]
    K_p = k;
    T_m = [];
    omega_f = [];
    for i = 0.0:0.1:0.5
        T_mech = i;
        simOut = sim('pcontrol');
        omega_final = simOut.omega.Data(end)
        T_fric = omega_final*b;
        T_m = [T_m (T_mech+T_fric)];
        omega_f = [omega_f omega_final];
    end
    out_data = [omega_f.' T_m.']
    out_table = array2table(out_data, 'VariableNames', {'omega_f', 'T'})
    writetable(out_table, sprintf('k=%.1f.csv', K_p));
end
%plot(omega_f, T_m);

%csvwrite('file.csv', out_data);



