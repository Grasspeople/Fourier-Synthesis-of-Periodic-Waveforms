clear
% set signal period to 1s
T = 1;
% Time variable
t = linspace(0, T, 1000);
% t(t <= T/2);logic matrix
% Amplitute
V0 = 1;

% triangular function
Sawtooth = zeros(size(t));
Sawtooth = V0 - t.*2*V0./T;
t = linspace(0, 3*T, 3*1000);
Sawtooth = repmat (Sawtooth, 1, 3);
plot(t, Sawtooth,'b-')
hold on

% Synthesis
max_harmonics = 10;
a = zeros(1, max_harmonics+1);
b = zeros(1, max_harmonics+1);
synth_Sawtooth = zeros(size(t));

for n = 1 : max_harmonics
    b(n) = 2.*V0./(n.*pi);
    synth_Sawtooth = synth_Sawtooth + b(n)*sin(2*pi*(n)*(1/T)*t);
end

plot(t, synth_Sawtooth,'r--')


% % the value of a0
% syms x;
% f = sum(x.*synth_triang,"all")/T;
% a0 = limit(f, x, 0);
% formatSpec = 'a0 is %4.2f\n';
% fprintf(formatSpec,a0)


% stem(n,a(n))
figure
c = sqrt(a.^2 + b.^2);
stem(c)