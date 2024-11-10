function [c,s] = Givens_rot(a,b)
% Nalogo sem reševal samostojno
% Funkcija poračuna vrednosti rotacijskih koef c in s
% Vhodni podatki:
%   elementa matrika a in b
% Izhodni podatki:
%   rotacijska koeficienta c in s

% (https://www.math.usm.edu/lambers/mat610/class0208.pdf, str. 3)
% zaradi možnega overflowa se poslužimo kanček drugačnega pristopa.
if abs(a) >= abs(b)
    t = b/a;
    c = sign(a)/sqrt(1+t^2);
    s = c*t;
else
    t = a/b;
    s = sign(b)/sqrt(1+t^2);
    c = s*t;
end