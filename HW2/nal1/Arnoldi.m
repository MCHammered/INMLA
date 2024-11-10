function maxlambda = Arnoldi(Q,alfa,e,d,n)
% Nalogo sem reševal samostojno
    r0 = ones(n,1);
    maxlambda = ArnoldiBasic(Q,alfa,e,d,n,r0);

    
    function maxlambda = ArnoldiBasic(Q,alfa,e,d,n,r0)
        V(:,1) = r0/norm(r0);
        tol = inf;
        r = inf;
        k = 1;
        while tol > 10^-14
            z = (alfa*(Q*V(:,k)+1/n*e*(d'*V(:,k)))+(1-alfa)*1/n*e*(e'*V(:,k)));
            for i = 1:k
                H(i,k) = V(:,i)'*z;
                z = z - H(i,k)*V(:,i);
            end
            t = norm(z);
            if t <= 0
                return
            end
            H(k+1,k) = t;
            V(:,k+1) = z/H(k+1,k);
            maxlambda = eigs(full(H(1:k,1:k)),[],1);
            tol = abs(maxlambda - r);
            r = maxlambda;
            k = k + 1;
        end
    end
end



