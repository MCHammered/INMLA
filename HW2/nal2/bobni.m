function [V1,M1,D1,V2,M2,D2] = bobni(lambda, n)
% Nalogo sem reševal samostojno

h = 1/n;

M1 = sestavi_boben(n, 1);
B1 = delsq(M1);
m1 = size(B1,1);
B1(1:(m1+1):end) = spdiags(B1,0) - lambda*h^2*ones(m1,1);
[V1,D1] = eigs(B1,5,'smallestabs');

M2 = sestavi_boben(n, 2);
B2 = delsq(M2);
m2 = size(B2,1);
B2(1:(m2+1):end) = spdiags(B2,0) - lambda*h^2*ones(m2,1);
[V2,D2] = eigs(B2,5,'smallestabs');

% lastne_funkcije(V1,M1,D1,n,'desni boben: ');
% lastne_funkcije(V2,M2,D2,n,'levi boben: ');


end