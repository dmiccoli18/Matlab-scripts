%coherence function, now usable
function Cxy = coherence(Gxx, Gyy, Gxy)
Cxy = abs(Gxy).^2 ./ (Gxx .* Gyy);
