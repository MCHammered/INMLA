function maxlamb = potencna_metoda(Q,alfa,e,d,n)
% Nalogo sem reševal samostojno
    z = ones(n,1);
    tol = inf;
    r = inf;
    while tol > 10^-14
        y = alfa*(Q*z+1/n*e*(d'*z))+(1-alfa)*1/n*e*(e'*z); % Az
        maxlamb = z'*y; % z'*A*z
        z = y/norm(y);
        tol = abs(maxlamb - r);
        r = maxlamb;
    end
end