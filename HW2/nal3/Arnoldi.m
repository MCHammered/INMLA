function eigens = Arnoldi(A,k,ind)
% Nalogo sem reševal samostojno

    if ind == 1
        text = 'largestabs';
    elseif ind == -1
        text = 'smallestabs';
    else
        error('ind naj bo 1 (max abs) ali -1 (min abs)');
    end
    n = size(A,1);
    r0 = ones(n,1);
    eigens = ArnoldiBasic(A,r0,k,text);

    
    function eigens = ArnoldiBasic(A,r0,k,text)
        V(:,1) = r0/norm(r0);
        for j = 1:k
             z = A*V(:,j);
             for i = 1:j
                 H(i,j) = V(:,i)'*z;
                 z = z - H(i,j)*V(:,i);
             end
             t = norm(z);
             if t <= 0
                 return
             end
            H(j+1,j) = t;
            V(:,j+1) = z/H(j+1,j);
        end
        eigens = eigs(full(H(1:k,1:k)),[],8,text);
    end
end



