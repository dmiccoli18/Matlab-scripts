% code message test

%{
this was a personal project I worked on combining amplitude modulation
and DSP concepts with simple message encryption and decryption I learned in
undergrad. The concept was to create messages outside the range of human
hearing with each letter corresponding to a frequency for communication
between two or more people. the input characters include all letters a-z, 
periods, spaces, and commas. 
%}
clc; clear; close all;

Fs = 96000;
dt = 1/Fs;

% input string
S = input("Enter a word or phrase: ",'s');
newS = convertStringsToChars(S);
t_info = ((0:Fs/10-1)*dt) .';
x = zeros(Fs/10,1);

% cryptography encoding
M = input("Multiplier: ");

numbers = zeros(1,length(newS));
enc = zeros(1,length(newS));
for n = 1:length(newS)
    numbers(1,n) = encoder(newS(n));
    enc(1,n) = mod(M*numbers(1,n),29);
end

% scrambled message
message = blanks(length(enc));
for n = 1:length(enc)
    message(n) = decoder(enc(1,n));
end

% make the transmission wave
yy = zeros(Fs/10 * length(enc),1);
for n = 1:length(enc)
    info_f = letterFinder(message(n));
    yy((n-1)*Fs/10 +1:n*Fs/10,1) = sin(2*pi*info_f*t_info);
end
yy1 = (yy .* .5)  + .5;

t_carrier = ((0:length(yy)-1)*dt) .';
y_carrier = sin(2*pi*(Fs/4)*t_carrier);

% modulation
y_enc = yy .* y_carrier;
t = ((0:length(y_enc)-1)*dt) .';

plot(t,yy,t,yy1,t,abs(hilbert(yy1)))

%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%

%{
the idea for this portion would be to have an imported modulated wave
that can be read by the algorithm to descramble the message. the code
below would how to achieve this
%}

% demodulation
cc = length(newS);

df = 1/((Fs/10)*dt);
f = ((0:Fs/10 - 1)*df).' ;

mChar = zeros(cc,1);
for c = 1:cc
    yy1 = hilbert(y_enc((c-1)*Fs/10 +1:c*Fs/10));
    yy_new = abs(yy1);
    YY_new = abs(fft(yy_new)); YY_new(1,1) = 0;
    [~,freq] = max(YY_new);
    f_found = round(f(freq,1))/2;

    % find the letters
    mChar(c,1) = freqFinder(f_found);
end

%decoding cryptography, finding multiplicative value
w = 1;
f = false;
while f == false
    z = mod((M*w),29);
    if z ~= 1
        w = w + 1;
    elseif z == 1
        f = true;
    end
end

% correct corresponding numbers 
mCharNumbers = zeros(1,length(mChar));

% preallocated char array
messageDec = blanks(length(mChar));

for n = 1:length(mChar)
    mCharNumbers(1,n) = encoder(mChar(n,1));
    messageDec(n) = decoder(mod(w*mCharNumbers(1,n),29));
end

messageFinal = convertCharsToStrings(messageDec);
disp(messageFinal)
