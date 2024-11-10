function Naloga3b(A,b)
% Nalogo sem reševal samostojno

%% Za c-63
% [L,U] = ilu(A);
% restart = [16 32 64, 100 128];
% rvs = [];
% res = 0;
% [~,flag,~,~,rv1] = gmres(A,b,restart(1),10^-6,2000,L,U);
% flag
% [~,flag,~,~,rv2] = gmres(A,b,restart(2),10^-6,2000,L,U);
% flag
% [~,flag,~,~,rv3] = gmres(A,b,restart(3),10^-6,2000,L,U);
% flag
% [~,flag,~,~,rv4] = gmres(A,b,restart(4),10^-6,2000,L,U);
% flag
% [~,flag,~,~,rv5] = gmres(A,b,restart(4),10^-6,2000,L,U);
% flag
% 
% title(sprintf('Konvergenca za RFdevice %d. (toleranca 10^-6, št. iteracij 2000)', i))
% semilogy(0:length(rv1)-1,rv1./norm(U\(L\b)),'g-');
% hold on
% semilogy(0:length(rv2)-1,rv2./norm(U\(L\b)),'k-');
% semilogy(0:length(rv3)-1,rv3./norm(U\(L\b)),'b-');
% semilogy(0:length(rv4)-1,rv4./norm(U\(L\b)),'m-', 'LineWidth',2);
% semilogy(0:length(rv5)-1,rv5./norm(U\(L\b)),'c-');
% yline(10^-6,'r--');
% xlabel('Iteracija');
% ylabel('Norma ostanka');
% legend('GMRES(16)','GMRES(32)', ...
%    'GMRES(64)', 'GMRES(100)', 'GMRES(128)','Toleranca','Location','northeast');

%% za Gridgena
% L = ichol(A);
% restart = [16 32 64, 100 128];
% [~,flag,~,~,rv1] = gmres(A,b,restart(1),10^-6,2000,L,L');
% flag
% [~,flag,~,~,rv2] = gmres(A,b,restart(2),10^-6,2000,L,L');
% flag
% [~,flag,~,~,rv3] = gmres(A,b,restart(3),10^-6,2000,L,L');
% flag
% [~,flag,~,~,rv4] = gmres(A,b,restart(4),10^-6,2000,L,L');
% flag
% [~,flag,~,~,rv5] = gmres(A,b,restart(4),10^-6,2000,L,L');
% flag
% 
% title('Konvergenca za Gridgena  (toleranca 10^-6, št. iteracij 2000)')
% semilogy(0:length(rv1)-1,rv1./norm(b),'g-');
% hold on
% semilogy(0:length(rv2)-1,rv2./norm(b),'k-');
% semilogy(0:length(rv3)-1,rv3./norm(b),'b-');
% semilogy(0:length(rv4)-1,rv4./norm(b),'m-', 'LineWidth',2);
% semilogy(0:length(rv5)-1,rv5./norm(b),'c-');
% yline(10^-6,'r--');
% xlabel('Iteracija');
% ylabel('Norma ostanka');
% legend('GMRES(16)','GMRES(32)', ...
%    'GMRES(64)', 'GMRES(100)', 'GMRES(128)','Toleranca','Location','northeast');

%% RFdevice
restart = [16 32 64, 100 128];
[~,flag,~,~,rv1] = gmres(A,b,restart(1),10^-6,2000);
flag
[~,flag,~,~,rv2] = gmres(A,b,restart(2),10^-6,2000);
flag
[~,flag,~,~,rv3] = gmres(A,b,restart(3),10^-6,2000);
flag
[~,flag,~,~,rv4] = gmres(A,b,restart(4),10^-6,2000);
flag
[~,flag,~,~,rv5] = gmres(A,b,restart(4),10^-6,2000);
flag

title('Konvergenca za RFdevice  (toleranca 10^-6, št. iteracij 2000)')
semilogy(0:length(rv1)-1,rv1./norm(b),'g-', 'LineWidth',10);
hold on
semilogy(0:length(rv2)-1,rv2./norm(b),'k-', 'LineWidth',8);
semilogy(0:length(rv3)-1,rv3./norm(b),'b-', 'LineWidth',6);
semilogy(0:length(rv4)-1,rv4./norm(b),'m-', 'LineWidth',4);
semilogy(0:length(rv5)-1,rv5./norm(b),'c-', 'LineWidth',2);
yline(10^-6,'r--');
xlabel('Iteracija');
ylabel('Norma ostanka');
legend('GMRES(16)','GMRES(32)', ...
   'GMRES(64)', 'GMRES(100)', 'GMRES(128)','Toleranca','Location','northeast');
end
