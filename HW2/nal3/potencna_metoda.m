function maxlamb = potencna_metoda(A)
% Nalogo sem reševal samostojno

    n = size(A,1);
    z = ones(n,1);
    % 1. korak
    y = A*z;
    alfa = z'*y;
    tol = inf;
    r = alfa;
    % korak 2,3,...
    while tol > 10^-10
        z = y/norm(y);
        y = A*z; % Az
        alfa = z'*y; % z'*A*z
        tol = norm(alfa - r)/norm(r);
        r = alfa;
    end
    maxlamb = alfa;
end