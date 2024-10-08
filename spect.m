function spec = spect(x,dt, df, Fs, N, start, stop, step, N_step, overlap)

N_rec = step * overlap;
T = 1/df;
[W, ~] = Hann_window(step);
for m = 1:N_rec-1
    yy = W.*x(start:stop);
    Gxx_record = singleSpecDensity(yy, T, dt);
    Gxx_record = 10*log(Gxx_record);
    Gxx_record = Gxx_record / max(abs(Gxx_record));
    spec(m,:) = Gxx_record;
    start = start + N_step;
    stop = stop + N_step;
end


spec = spec.';
timeVec = (0:dt:(N*dt));
freqVec = (0:df:Fs/2);
imagesc(timeVec, freqVec, spec);
xlabel('Time (s)');
ylabel('Frequency (Hz)');
labelColorbar('dB re WU^2 * Hz');
axis xy
colormap(jet)
