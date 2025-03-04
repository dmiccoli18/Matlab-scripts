function G_xx = singleSpecDensity(x_n, T, dt)
X_m = fft(x_n) * dt;
N = length(x_n);
S_xx = 1/T * abs(X_m) .^ 2;
G_xx = S_xx(1:(N/2));
G_xx(2:end-1) = 2 * G_xx(2:end-1);
end