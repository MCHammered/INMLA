function lastne_funkcije(V,M,D,n,str)
% Nalogo sem reševal samostojno

    d = diag(D);
    [d,ord] = sort(d);
    V = V(:,ord);
    [X,Y] = ndgrid(linspace(0,1,n+2),linspace(0,1,n+2));
    
    k = randi([1 5]);
    x = V(:,k);
    U = M;
    U(M>0) = full(x(M(M>0)));
    U(M==0) = NaN;
    figure
    surf(X,Y,U)
    shading interp
    title([str ' lastna vrednost = ' num2str(d(k)) ', n=' num2str(n)]);
    
end