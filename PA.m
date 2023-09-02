clear
% set signal period to 1s
T = 1;
% Time variable
t = linspace(0, T, 1000);
% t(t <= T/2); logic matrix
% Amplitute
V0 = 1;

% % triangular function
% triang = zeros(size(t));
% triang (t<=T/2) = 1- 4*t(t <= T/2)/T;
% triang (t>T/2) = 4*t(t > T/2)/T - 3;

% Synthesis
max_harmonics = 9;
a = zeros(1, max_harmonics+1);
b = zeros(1, max_harmonics+1);
synth_tri = zeros(size(t));

for n = 0 : max_harmonics
    if mod (n,2) == 1
        a(n) = V0./n;
        synth_tri = synth_tri + a(n)*sin(2*pi*n*(1/T)*t);
    end
end

t = linspace(0, 3*T, 3*1000);
synth_tri = repmat (synth_tri, 1, 3);

plot(t, synth_tri,'r--')


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






