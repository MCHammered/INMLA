function u = Jacobi(A,b,x)
% Nalogo sem reševal samostojno
% Jacobijeva iteracija
% Vhodni podaki:
%   Matrika A velikosti n^2xn^2
%   Vektro x: zac priblizek
%   Vektor b: 
% Izhodni podatek:
%   Matrika, katero smo pridobili s Jacobijevo iteracijo

% Poslužimo se cenejšega kriterija za ustavitev. Pri temu se lahko zgodi da
% približek ne bo najboljši.

% Ker A na diagonali ne vsebuje ničel, vzamemo za M diagonalo.
M = diag(diag(A)); 
N = A - M;
D = diag(M); % M = diag(diag(M)), potrebuje zgolj vektor
% Ker uporabljamo Jacobijevo iteracijo, lahko računamo vzporedno.
% Mx = -Nx + b
epsilon = 10^-16; % empirično določen
while true
    u = (b - N*x)./D;
    if norm(u - x) <= epsilon*norm(x)
        break
    end
    x = u;
end

