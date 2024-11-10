function rezultat = nal4(N)
% Nalogo sem reševal samostojno


n = sqrt(N/2);
if floor(n) == n
    a = 0.5;
    b = 1;
    f = @(L)sestavi_Jac_matriko(N,L);
    
    rezultat = bisekcija(f,a,b);
else
    error("N naj bo vrednosti 2*n^2!");
end