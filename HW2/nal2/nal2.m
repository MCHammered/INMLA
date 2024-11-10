function nal2
% Nalogo sem reševal samostojno

N = [12 102 1002]; % N naj bo deljiv s 3
lambda = [-342 0 574];
for j = 1:length(lambda)
    for i = 1:length(N)
        [V1,M1,D1,V2,M2,D2] = bobni(lambda(j),N(i));
        r = max(abs(diag(D1)-diag(D2)));
        fprintf("lambda = %f, n = %f\n", lambda(j), N(i));
        fprintf("desni boben l. vr: ");
        fprintf("%g ", diag(D1));
        fprintf("\n");
        fprintf("levi boben l. vr: ");
        fprintf("%g ", diag(D2));
        fprintf("\n"); fprintf("\n");
        fprintf("maksimalna razlika: %f\n",r);
        fprintf("------------------------\n");
        lastne_funkcije(V1,M1,D1,N(i),'desni boben: ');
        lastne_funkcije(V2,M2,D2,N(i),'levi boben: ');
    end
end

end