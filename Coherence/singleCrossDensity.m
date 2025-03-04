function G_xy = singleCrossDensity(xn,yn,T,dt)
N = length(xn);
X = fft(xn) * dt;
Y = fft(yn) * dt;
S_xy = (1/T)*(conj(Y) .* X);
G_xy = S_xy(1:(N/2));
G_xy(2:end-1) = 2 * G_xy(2:end-1);
end