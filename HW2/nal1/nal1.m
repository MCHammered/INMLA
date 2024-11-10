function nal1
% Nalogo sem reševal samostojno
V = (6*2*0 + 3*5 + 20)/1000;

Q = loadStanfordMatrix;
n = size(Q,1);
e = ones(n,1);

d = zeros(n,1);
d(find(sum(Q)==0)) = 1;


% p1 = eigs_fun(Q,0.95,e,d,n)
% p2 = potencna_metoda(Q,V,e,d,n)
% p3 = Arnoldi(Q,V,e,d,n)

alfa = [V 0.01 0.04 0.1 0.3 0.5 0.8 0.95];
for i = 1:length(alfa)
    tic;
    p1 = eigs_fun(Q,alfa(i),e,d,n);
    t1 = toc;
    tic;
    p2 = potencna_metoda(Q,alfa(i),e,d,n);
    t2 = toc;
    tic;
    p3 = Arnoldi(Q,alfa(i),e,d,n);
    t3 = toc;
    if i == 1
        fprintf("alfa = %f (V): \n", alfa(1));
    else
        fprintf("alfa = %f: \n", alfa(i));
    end
    fprintf("eigs     = %f  | cas = %fs \n",p1,t1);
    fprintf("potencna = %f  | cas = %fs \n",p2,t2);
    fprintf("arnoldi  = %f  | cas = %fs \n",p3,t3);
    if i ~= length(alfa)
    fprintf("----------------------------- \n");
    end
end

end