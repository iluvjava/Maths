Homemade Spectrumgram. 
prereq: [[Lecture 4 13.4 (Gobar Trans)]]

---
### Intro
We can implement the Gobar transform pretty easily in MATLAB. 

---
### Practical Implementations

The implementations in MATLAB is not hard. Let's take a look: 
```matlab
clear all; close all; clc

%% SIGNAL CONSTRUCTION

L = 10; n = 2048;
t2 = linspace(0 ,L ,n + 1); t = t2(1:n);  % Half domain
k = (2*pi/L)*[0:n/2 - 1 -n/2: -1]; 
ks = fftshift(k);

% This is the signal. 
S  =    (3*sin(2*t) + ...
        0.5*tanh(0.5*(t - 3)) + ... 
        0.2*exp(-(t - 4).^2) + ... 
        1.5*sin(5*t) + ...
        4*cos(3*(t - 6).^2))/10 + ...
        (t/20).^3;

St = fft(S);

figure(1)
subplot(3, 1, 1) % Time domain
plot(t, S, 'k') 
set(gca, 'Fontsize', [14]), xlabel('Time (t)'), ylabel('S(t)')

subplot(3, 1, 2) % Fourier domain 
plot(ks, abs(fftshift(St))/max(abs(St)), 'k'); axis([-50 50 0 1])
set(gca, 'Fontsize', [14])
xlabel('frequency (\omega)'), ylabel('FFT(S)')

%%  GABOR WINDOW, DIFFERENT SIZES
figure(2) 
width  = [10 1 0.2];
for JJ = 1:3
    g  = exp(-width(JJ)*(t - 4).^2);  % Gaussian window
    subplot(3, 1, JJ)
    plot(t, S, 'k'), hold on 
    plot(t, g, 'k','Linewidth', [2]) 
    set(gca, 'Fontsize', [14]) 
    ylabel('S(t), g(t)')
end
xlabel('time (t)')

%%  GABOR TRANSFORM

figure(3) 
g   = exp(-2*(t - 4).^2);  % Filter centered at t = 4
Sg  = g.*S;
Sgt = fft(Sg);

subplot(3, 1, 1), plot(t, S, 'k'), hold on 
plot(t, g, 'k', 'Linewidth', [2]) 
set(gca, 'Fontsize', [14])
ylabel('S(t), g(t)'), xlabel('time (t)')

subplot(3, 1, 2), plot(t, Sg, 'k') 
set(gca, 'Fontsize', [14]) 
ylabel('S(t)g(t)'), xlabel('time (t)')

subplot(3, 1, 3), plot(ks, abs(fftshift(Sgt))/max(abs(Sgt)), 'k') 
axis([-50 50 0 1])
set(gca, 'Fontsize', [14])
ylabel('FFT(Sg)'), xlabel('frequency (\omega)')

%% SLIDING GABOR WINDOW

figure(4)
Sgt_spec =[]; 
tslide = 0: 0.05: 10  % Over sampling is better. 
for JJ = 1: length(tslide)
    g        = exp(-2*(t - tslide(JJ)).^2); % Gabor Filter Offset
    Sg       = g.*S; 
    Sgt      = fft(Sg); 
    Sgt_spec = [Sgt_spec; abs(fftshift(Sgt))]; 
    subplot(3, 1, 1), plot(t, S, 'k', t, g,'r') % 
    subplot(3, 1, 2), plot(t, Sg, 'k')
    subplot(3, 1, 3), plot(ks, abs(fftshift(Sgt))/max(abs(Sgt))) 
    axis([-50 50 0 1])
    drawnow
end

figure(5)
pcolor(tslide, ks, Sgt_spec.'), 
shading interp 
set(gca, 'Ylim', [-50 50], 'Fontsize', [14]) 
colormap(hot)

%% MATLAB SPECTROGRAM
Sp = spectrogram(S);
figure(6)
pcolor(abs(Sp))
shading interp
set(gca,'Ylim', [0 20], 'Fontsize', [14]) 
colormap(hot)
```
![[gobar-transform-spectrogram.png]]
Figure 5
