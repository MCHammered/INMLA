function [A,b] = kaznovalna_metoda(n,k)
% Nalogo sem reševal samostojno
% Eden izmed možnih pristopov, kako rešiti robni problem na bolj zapleteni domeni Ω, je
% preko t.i. kaznovalne metode (angl. penalty method). Radi bi poiskali numerično rešitev
% parcialne diferencialne enačbe s homogenimi robnimi pogoji.
%
% Vhodni podatki:
%   n... stevilo tock v domeni (porazdelitev)
%   k... koeficient kaznovalne metode
% domena: [-1,1]^2\{(x,y) | x^2 + y^2 < 1/10}
% Izhod:
%   A... primerna matrika za naš problem kaznovalne metode
%   b... primeren vektor za naš problem kaznovalne metode
%   Ax=b

x = linspace(-1,1,n);
y = linspace(-1,1,n);
h = 2/(n-1); % (b-a)/(n-1)
s = n-2;

% robne točke so enake 0
b = ones(s^2,1);
% b(2:end-1,2:end-1)=1;
b = -h^2*b(:);

% ustvarimo matriko za standardno diskretno poiss. enačbo
% MakeFish.m vzeta iz predavanj
A = MakeFish(s);
% številčenje po vrsticah
for j = 1:s
    M = A(1+(j-1)*s:s*j,1+(j-1)*s:s*j);
    for i=1:s
        r = x(i+1)^2 + y(j+1)^2;
        if r < 1/10
            M(i,i) = 4 - h^2*k;
        end
    end
    A(1+(j-1)*s:s*j,1+(j-1)*s:s*j) = M;
end

end