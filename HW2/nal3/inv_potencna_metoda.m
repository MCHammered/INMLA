function maxlamb = inv_potencna_metoda(A)    
% Nalogo sem reševal samostojno

    n = size(A,1);
    z = ones(n,1);
    % 1. korak
    y = A\z;
    alfa = z'*y;
    tol = inf;
    r = alfa;
    % korak 2,3,...
    while tol > 10^-16
       z = y/norm(y);
       y = A\z;
       alfa = z'*y;
       tol = norm(alfa-r)/norm(r);
       r = alfa;
    end
    maxlamb = 1/alfa;
end