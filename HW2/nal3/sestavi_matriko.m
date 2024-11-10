function A = sestavi_matriko(R,n)
% Nalogo sem reševal samostojno

h = R/n;
r = h*[0:1:n-1]'; % n

% diagonala
d1 = [2*ones(1,n)]';
% naddiag
v1 = -ones(1,n-2);
v2 = -h./(2*r(2:end-1)');
d2 = [0 -2 (v1+v2)]';
% poddiag
v1 = -ones(1,n-1);
v2 = h./(2*r(2:end)');
d3 = [(v1+v2) 0]';

A = spdiags([d1 d2 d3], [0 1 -1], n, n);

end