function [x, res] = Naloga2(A,x)
% Funkcija, ki poračuna varianto D-Lanczsovega algoritma 
% (QR razcep z Givensovimi rotacijami) in primerja rezultat z metodo FOM
% Vhodni podatki:
%   Matrika A velikosti nxn
%   Začetni približek x: vektor


epsilon = 10^-10; % toleranca
k = 5000; % fiksno število korakov
e = ones(size(A,2),1);
b = A*e; % desna stran
r0 = b - A*x; % zacetni ostanek
res = 0;
if norm(r0) == 0
    return
end

beta = [0 0];
alfa = [0 0];

% Napravimo 1. in 2. korak ročno
V = [r0/norm(r0) zeros(size(r0,1),1) zeros(size(r0,1),1)]; % v1 v2 v3
% 1. korak (k = 1)
z = A*V(:,1);
alfa(1) = V(:,1)'*z;
z = z - alfa(1)*V(:,1); % beta0 = beta(1) = 0
beta(1) = norm(z);

% res = beta(2)*norm(r0)/abs(alfa(1));
if beta(1) == 0
    return
end
V(:,2) = z/beta(1); % v2

% 2. korak (k = 2)
z = A*V(:,2) - beta(1)*V(:,1);
alfa(2) = V(:,2)'*z;
z = z - alfa(2)*V(:,1);
beta(2) = norm(z);

T = [alfa(1) beta(1); beta(1) alfa(2)];
[c1, s1] = Givens_rot(T(1,1), T(2,1));
T = [c1 s1; -s1 c1]*T;
p1 = V(:,1)/T(1,1);
x = x + norm(r0)*p1; % 1. novi približek
p2 = (V(:,2)-T(1,2)*p1)/T(2,2);
x = x + norm(r0)*c1*p2; % 2. novi približek
res = beta(2)*norm(r0)*abs(s1)/abs(T(2,2));
if res < epsilon
    return
end
V(:,3) = z/beta(2); % v3
% ======================================
V = V(:,2:end);
% ======================================
R = [c1 s1]; % hranimo zadnjo rotaciji
% ======================================
% S 3. korakom dalje pričnemo z modificiranim DLanczos algoritmom
sk = -s1; 
P = [p1 p2];
rii = T(2,2); % zadnji el na diagonali Ri
for i = 3:k
    z = A*V(:,2) - beta(2)*V(:,1);
    alfa = [alfa(2) V(:,2)'*z];
    z = z - alfa(2)*V(:,2);
    beta = [beta(2) norm(z)];
    % podobne operacije vzete iz 
    % https://ucilnica.fmf.uni-lj.si/pluginfile.php/103852/mod_resource/content/0/IMLA.pdf
    % stran 52, 53.
    % ----------------------------------------
    % 1) Popravimo zadnji stolpec v Tk
    h1 = R(2)*beta(1); % uporabimo za izrazun P
    gg1 = R(1)*beta(1);
    % ----------------------------------------
    % 2) Dodamo rotacijo R_{k-1,k}
    [c, s] = Givens_rot(rii, beta(1));
    g1 = c*gg1 + s*alfa(2); % uporabimo za izracun P
    f = -s*gg1 + c*alfa(2);
    P = [P(:,2) (V(:,2)-h1*P(:,1)-g1*P(:,2))/f]; % določimo pk
    zeta = norm(r0)*c*sk;
    sk = -s * sk;
    x = x + zeta*P(:,2); % posodobimo xk iz x_(k-1) v smeri pk
    rii = f;
    res = beta(2)*norm(r0)*abs(sk)/abs(rii);
    if res < epsilon
        return
    end
    V = [V(:,2) z/beta(2)]; % v_{i+1}
    R = [c s]; % shranimo zadnjo rotacijo
       
end

end