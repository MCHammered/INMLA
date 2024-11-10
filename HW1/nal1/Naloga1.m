% Rešitev 1. naloge za DN predmeta INMLA
% Nalogo sem reševal samostojno

% poljubno izberemo parametra:
%   n: število točk na mreži
%   k: koeficient kaznovalne metode

% 1)
% n = 18, k = 50
n = 18;
k = 10^5;
x = linspace(-1,1,n);
y = linspace(-1,1,n);
U1 = zeros(n); % robni pogoji so 0
U2 = zeros(n);
[X,Y] = meshgrid(x,y);
[A,b] = kaznovalna_metoda(n,k);

% vgrajena metoda za reševanje lin sistemov
u1 = reshape(A\b,n-2,n-2);
U1(2:end-1,2:end-1) = u1;

% Jacobi
u2 = Jacobi(A,b,zeros((n-2)^2,1));
U2(2:end-1,2:end-1) = reshape(u2,n-2,n-2);

% norm(U2-U1)
% rezultat: 3.798237831304833e-15
% max(max(abs(U2-U1)))
% rezultat: 5.551115123125783e-16

mesh(X,Y,U1)
hold on
mesh(X,Y,U2);

% % 2)
% % n = 66, k = 100
% n = 66;
% k = 100;
% x = linspace(-1,1,n);
% y = linspace(-1,1,n);
% U1 = zeros(n); % robni pogoji so 0
% U2 = zeros(n);
% [X,Y] = meshgrid(x,y);
% [A,b] = kaznovalna_metoda(n,k);
% 
% % vgrajena metoda za reševanje lin sistemov
% u1 = reshape(A\b,n-2,n-2);
% U1(2:end-1,2:end-1) = u1;
% 
% % Jacobi
% u2 = Jacobi(A,b,zeros((n-2)^2,1));
% U2(2:end-1,2:end-1) = reshape(u2,n-2,n-2);
% 
% % norm(U2-U1)
% % rezultat : 9.483138912288737e-15
% % max(max(abs(U2-U1)))
% % rezultat: 5.134781488891349e-16
% 
% mesh(X,Y,U1)
% hold on
% mesh(X,Y,U2)

% % 3)
% % n = 42, k = 21
% n = 42;
% k = 21;
% x = linspace(-1,1,n);
% y = linspace(-1,1,n);
% U1 = zeros(n); % robni pogoji so 0
% U2 = zeros(n);
% [X,Y] = meshgrid(x,y);
% [A,b] = kaznovalna_metoda(n,k);
% 
% % vgrajena metoda za reševanje lin sistemov
% u1 = reshape(A\b,n-2,n-2);
% U1(2:end-1,2:end-1) = u1;
% 
% % Jacobi
% u2 = Jacobi(A,b,zeros((n-2)^2,1));
% U2(2:end-1,2:end-1) = reshape(u2,n-2,n-2);
% 
% % norm(U2-U1)
% % rezultat: 5.866215168543380e-15
% % max(max(abs(U2-U1)))
% % rezultat: 5.273559366969494e-16
% 
% mesh(X,Y,U1)
% hold on
% mesh(X,Y,U2)

% % 4)
% % n = 34, k = 2000
% n = 34;
% k = 2000;
% x = linspace(-1,1,n);
% y = linspace(-1,1,n);
% U1 = zeros(n); % robni pogoji so 0
% U2 = zeros(n);
% [X,Y] = meshgrid(x,y);
% [A,b] = kaznovalna_metoda(n,k);
% 
% % vgrajena metoda za reševanje lin sistemov
% u1 = reshape(A\b,n-2,n-2);
% U1(2:end-1,2:end-1) = u1;
% 
% % Jacobi
% u2 = Jacobi(A,b,zeros((n-2)^2,1));
% U2(2:end-1,2:end-1) = reshape(u2,n-2,n-2);
% 
% % norm(U2-U1)
% % rezultat: 3.476488735357281e-15
% % max(max(abs(U2-U1)))
% % rezultat: 3.469446951953614e-16
% 
% mesh(X,Y,U1)
% hold on
% mesh(X,Y,U2)

% % 5)
% % n = 38, k = 10^5
% n = 38;
% k = 10^5;
% x = linspace(-1,1,n);
% y = linspace(-1,1,n);
% U1 = zeros(n); % robni pogoji so 0
% U2 = zeros(n);
% [X,Y] = meshgrid(x,y);
% [A,b] = kaznovalna_metoda(n,k);
% 
% % vgrajena metoda za reševanje lin sistemov
% u1 = reshape(A\b,n-2,n-2);
% U1(2:end-1,2:end-1) = u1;
% 
% % Jacobi
% u2 = Jacobi(A,b,zeros((n-2)^2,1));
% U2(2:end-1,2:end-1) = reshape(u2,n-2,n-2);
% 
% % norm(U2-U1)
% % rezultat: 4.003145380910249e-15
% % max(max(abs(U2-U1)))
% % rezultat: 3.608224830031759e-16
% 
% mesh(X,Y,U1)
% hold on
% mesh(X,Y,U2)

% % 6)
% % n = 44, k = 10^12
% n = 44;
% k = 10^12;
% x = linspace(-1,1,n);
% y = linspace(-1,1,n);
% U1 = zeros(n); % robni pogoji so 0
% U2 = zeros(n);
% [X,Y] = meshgrid(x,y);
% [A,b] = kaznovalna_metoda(n,k);
% 
% % vgrajena metoda za reševanje lin sistemov
% u1 = reshape(A\b,n-2,n-2);
% U1(2:end-1,2:end-1) = u1;
% 
% % Jacobi
% u2 = Jacobi(A,b,zeros((n-2)^2,1));
% U2(2:end-1,2:end-1) = reshape(u2,n-2,n-2);
% 
% % norm(U2-U1)
% % rezultat: 3.203229916317847e-14
% % max(max(abs(U2-U1)))
% % rezultat: 1.415534356397075e-15
% 
% mesh(X,Y,U1)
% hold on
% mesh(X,Y,U2)

