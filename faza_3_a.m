function [Delta_pr, Delta_sr] = faza_3_a(h, omega_p, omega_s)
    grila_frecv = 0:pi/1000:pi;
    H = freqz(h, 1, grila_frecv);
    omega_p_vector = grila_frecv(grila_frecv <= omega_p);
    omega_s_vector = grila_frecv(grila_frecv >= omega_s);

    H_p = H(1:length(omega_p_vector));
    H_s = H(end - length(omega_s_vector) + 1:end);

    Delta_pr = max(abs(1 - abs(H_p)));

    Delta_sr = max(abs(H_s(omega_s_vector >= omega_s)));
end