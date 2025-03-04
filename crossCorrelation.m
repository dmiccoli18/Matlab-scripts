function Gxy = crossCorrelation(xn, yn, dt, N)
T = (N*dt);
X = fft(xn) * dt;
Y = fft(yn) * dt;
Sxy = (1/T)*(conj(Y) .* X);
Rxy = ifft(Sxy)/dt;
Gxy = [Rxy(N/2:end,1) ; Rxy(1:(N/2)-1,1)];