% Primerjave metod z A\b metodo
% Nalogo sem reševal samostojno

A = load("1224.mat"); % c-63
B = load("1311.mat"); % Gridgena
C = load("1877.mat"); % RFdevice

b1 = A.Problem.b;
A1 = A.Problem.A;
tic;
u1=A1\b1;
t1=toc;

[L,U] = ilu(A1);
tic;
[~, ~,res, ~, rv] = gmres(A1,b1,100,10^-3, 2000,L,U);
t11=toc;

disp('Razlike v ostankih')
norm(b1 - A1*u1)
res

disp('Razlike po času')
t1
t11


A2 = B.Problem.A;
b2 = A2*ones(size(A2,2),1);
tic;
u2=A2\b2;
t2=toc;

tic;
[~, ~,res,~, rv] = pcg(A2,b2,10^-3, 2000);
t22=toc;

disp('Razlike v ostankih')
norm(b2 - A2*u2)
res

disp('Razlike po času')
t2
t22


A3 = C.Problem.A;
b3 = C.Problem.b;
b3 = b3(:,2);
tic;
u3=A3\b3;
t3=toc;

tic;
[~, ~,res, ~, rv] = gmres(A3,b3,16,10^-3, 2000);
t33=toc;

disp('Razlike v ostankih')
norm(b3 - A3*u3)
res

disp('Razlike po času')
t3
t33
