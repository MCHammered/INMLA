function J = sestavi_Jac_matriko(N,L)
% Nalogo sem reševal samostojno

    B = 5.45;
    C = 2;
    Du = 0.004;
    Dv = 0.008;
    n = sqrt(N/2);
    h = 1/(n+1);
    
    % diagonala
    d1 = zeros(N,1);
    d1(1:2:end-1) = -4*Du/(L*h)^2+B-1;
    d1(2:2:end) = -4*Dv/(L*h)^2-C^2;
    % naddiagonala = 1 vrednost "vij pri uij"
    v = zeros(1,N-1);
    v(1:2:end) = C^2;
    d2 = [0 v]';
    % poddiag = -2 vrednost "uij pri vij"
    v = zeros(1,N-1);
    v(1:2:end) = -B;
    d3 = [v 0]';

    % diag = -2
    d4 = zeros(1,N);
    v = zeros(1,2*(n-1));
    v(1:2:end-1) = Du/(L*h)^2;
    v(2:2:end) = Dv/(L*h)^2;
    for i = 1:n
        d4(1+2*n*(i-1):2*n*i) = [0 0 v]';
    end
    d4 = [d4(3:end) 0 0]';

    % diag = 2
    d5 = zeros(1,N);
    v = zeros(1,2*(n-1));
    v(1:2:end-1) = Du/(L*h)^2;
    v(2:2:end) = Dv/(L*h)^2;
    for i = 1:n
        d5(1+2*n*(i-1):2*n*i) = [v 0 0]';
    end
    d5 = [0 0 d5(1:end-2)]';

    v = zeros(1,N-2*n);
    v(1:2:end-1) = Du/(L*h)^2;
    v(2:2:end) = Dv/(L*h)^2;
    % diag = -2*n
    d6 = [v zeros(1,2*n)]';

    % diag = 2*n
    d7 = [zeros(1,2*n) v]';
    
    J = spdiags([d6 d4 d3 d1 d2 d5 d7], [-2*n -2 -1 0 1 2 2*n], N,N);

end