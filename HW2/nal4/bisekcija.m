function L = bisekcija(f,a,b)
% Nalogo sem reševal samostojno

    r = inf;
    tol = inf;
    while tol > 10^-3
        c = (a+b)/2;
        q = eigs(f(c),3,"largestreal");
        q = real(q(1));
        if q >= 0
            b = c;
        else
            a = c;
        end
        tol = abs(r-q);
        r=q;
    end
    L = c;
end