clear
% set signal period to 1s
T = 1;
% Time variable
t = linspace(0, 3*T, 3000);
% t(t <= T/2); logic matricx
% Amplitute
V0 = 1;

% Synthesis
max_harmonics = 10;
a = zeros(1, max_harmonics+1);
b = zeros(1, max_harmonics+1);
f2 = zeros(size(t));
for n = 1 : max_harmonics
    b(n) = 0.1;
    f2 = f2 + b(n)*cos(2*pi*n*(1/T)*t);
end

plot(t, f2,'r--')


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