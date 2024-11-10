function J = sestavi_Jac_matriko_bf(N,L)
% Nalogo sem reševal samostojno

    B = 5.45;
    C = 2;
    Du = 0.004;
    Dv = 0.008;
    n = sqrt(N/2);
    h = 1/(n+1);
    J = zeros(N);
    for i=1:n
        for j=1:n
            k = j+n*(i-1);
            if i ~= 1
                J(2*k-1,2*k-1-2*n) = Du/(L*h)^2; % u
                J(2*k,2*k-2*n) = Dv/(L*h)^2; % v
            end
            if i ~= n
                J(2*k-1,2*k-1+2*n) = Du/(L*h)^2; % u
                J(2*k,2*k+2*n) = Dv/(L*h)^2; % v
            end
            if j ~= 1
                J(2*k-1,2*k-3) = Du/(L*h)^2; % u
                J(2*k,2*k-2) = Dv/(L*h)^2; % v
            end
            if j ~= n
                J(2*k-1,2*k+1) = Du/(L*h)^2; % u
                J(2*k,2*k+2) = Dv/(L*h)^2; % v
            end
            J(2*k-1,[2*k-1 2*k]) = [(-4*Du/(L*h)^2+B-1) C^2]; % u
            J(2*k,[2*k-1 2*k]) = [-B (-4*Dv/(L*h)^2-C^2)]; % v
        end
    end
end