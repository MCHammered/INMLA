function M = sestavi_boben(n, k)
% Nalogo sem reševal samostojno

A = ones(n/3);
Z = zeros(n/3);
B = zeros(n+2);
if k == 1
    U = triu(A);
    B(2:end-1,2:end-1) = [A Z Z; U A U'; Z U Z];
elseif k == 2
    U = triu(A);
    V1 = rot90(U);
    V2 = rot90(V1,2);
    B(2:end-1,2:end-1) = [V2 Z Z; U A A; Z Z V1];
end

ind = find(B>0);
for i = 1:length(ind)
    B(ind(i)) = i;
end
M=B;
end