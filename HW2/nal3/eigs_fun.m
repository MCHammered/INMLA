function l = eigs_fun(A,ind)
% Nalogo sem reševal samostojno

if ind == 1
    l = eigs(A,8);
elseif ind == -1
    l = eigs(A,8,'smallestabs');
else
    error('ind naj bo 1 (max abs) ali -1 (min abs)');
% f = @(x)alfa*(Q*x+1/n*e*(d'*x))+(1-alfa)*1/n*e*(e'*x);
end


end