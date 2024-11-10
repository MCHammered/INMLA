function l = eigs_fun(Q,alfa,e,d,n)
% Nalogo sem reševal samostojno


f = @(x)alfa*(Q*x+1/n*e*(d'*x))+(1-alfa)*1/n*e*(e'*x);
l = eigs(f,n,1);

end