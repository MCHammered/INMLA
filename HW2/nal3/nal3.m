function nal3
% Nalogo sem reševal samostojno

R = 5;
N = [100 1000 10000];
fprintf("Lastne vrednosti:\n");
for i = 1:length(N)
    % sestavimo matriko
    A = sestavi_matriko(R,N(i));
    
    % uporabimo metode za iskanje l. vr.
    p1 = potencna_metoda(A);
    l1 = inv_potencna_metoda(A);
    p2 = Arnoldi(A,min(N(i),1250),1);
    l2 = Arnoldi(A,min(N(i),1250),-1);
    p3 = eigs_fun(A,1);
    l3 = eigs_fun(A,-1);

    kappa = cond(full(A));

    fprintf("N = %f\n", N(i));
    fprintf("potencna = %f | inv. potencna = %f\n", p1, l1);
    fprintf("Arnoldi (max) = "); fprintf("%g ", p2); fprintf("\n");
    fprintf("| Arnoldi (min) = "); fprintf("%g ", l2); fprintf("\n");
    fprintf("Eigs (max) = "); fprintf("%g ", p3); fprintf("\n");
    fprintf("| Eigs (min) = "); fprintf("%g ", l3); fprintf("\n");
    fprintf("\n")
    fprintf("Pogojenostno število: %f\n", kappa);
    fprintf("----------------------------------\n");

end

end