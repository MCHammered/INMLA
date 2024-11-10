function Naloga3a(A)
% Nalogo sem reševal samostojno

%% C-63: simetrična matrika
% % Uporabimo MINRES, SYMMLQ z modificiranim GMRES
% b1 = A.Problem.b;
% M1 = A.Problem.A;
% min_cas1 = [10^16 10^16 10^6];
% cas1 = [];
% res1 = [];
% k1 = 0;
% k2 = 0;
% k3 = 0;
% x = 1:1:10;
% 
% for i = 1:10
%     i
%     if i>1
%         break
%     end
%     tic;
%     [r, k,rv1] = MINRES(M1,b1);
%     t=toc;
%     min_cas1(1) = min(min_cas1(1),t);
%     cas1(i,1) = t;
%     res1(i,1) = r;
%     k1 = k1 + k;
% 
%     tic;
%     [r, k,rv2] = SYMMLQ(M1,b1);
%     t=toc;
%     min_cas1(2) = min(min_cas1(2),t);
%     cas1(i,2) = t;
%     res1(i,2) = r;
%     k2 = k2 + k;
% 
%      tic;
%     [r,k,rv3,U,L] = GMRES(M1,b1);
%     t=toc;
%     min_cas1(3) = min(min_cas1(3),t);
%     cas1(i,3) = t;
%     res1(i,3) = r;
%     k3 = k3 + k;
% end
% 
% figure('Name','Graf po času (toleranca 10^-6)')
% plot(x,cas1(:,1))
% hold on
% plot(x, cas1(:,2))
% hold on
% plot(x, cas1(:,3))
% legend('Minres', 'Symmlq', 'GMRES(30)');
% hold off
% 
% figure('Name','Graf po ostanku (toleranca 10^-6)')
% plot(x,res1(:,1))
% hold on
% plot(x, res1(:,2))
% hold on
% plot(x, res1(:,3))
% legend('Minres', 'Symmlq', 'GMRES');
% hold off
% 
% 
% title('Konvergenca za c-63 (toleranca 10^-6, št. iteracij 2000)')
% 
% semilogy(0:length(rv1)-1,rv1./norm(b1),'g-');
% hold on
% semilogy(0:length(rv2)-1,rv2./norm(b1),'o-');
% semilogy(0:length(rv3)-1,rv3./norm(U\(L\b1)),'b-');
% yline(10^-6,'r--');
% xlabel('Iteracija');
% ylabel('Norma ostanka');
% legend('MINRES','SYMMLQ', ...
%    'GMRES(30)', 'Toleranca','Location','northeast');
% 
% disp('Minimalni čas izvajanja (toleranca 10^-6):')
% disp('MINRES')
% min_cas1(1)
% disp('Symmlq')
% min_cas1(2)
% disp('GMRES')
% min_cas1(3)
% 
% disp('Povprečno število korakov (toleranca 10^-6):')
% disp('MINRES')
% k1/10
% disp('Symmlq')
% k2/10
% disp('GMRES')
% k3/10
% 

%% Gridgena
% % Uporabimo MINRES, SYMMLQ in PCG in modificiran GMRES
% M1 = A.Problem.A;
% % b1 = M1*ones(size(M1,1),1);
% b1 = ones(size(M1,1),1);
% min_cas1 = [10^16 10^16 10^6 10^6];
% cas1 = [];
% res1 = [];
% k1 = 0;
% k2 = 0;
% k3 = 0;
% k4 = 0;
% x = 1:1:50;
% L = ichol(M1, struct('type','ict','diagcomp',1e-6,'droptol',1e-14));
% 
% for i = 1:50
%     if i > 1
%         break
%     end
%     tic;
%     [r, k,rv1] = MINRES(M1,b1);
%     t=toc;
%     min_cas1(1) = min(min_cas1(1),t);
%     cas1(i,1) = t;
%     res1(i,1) = r;
%     k1 = k1 + k;
% 
%     tic;
%     [r, k,rv2] = SYMMLQ(M1,b1);
%     t=toc;
%     min_cas1(2) = min(min_cas1(2),t);
%     cas1(i,2) = t;
%     res1(i,2) = r;
%     k2 = k2 + k;
% 
%     tic;
%     [r, k,rv3] = PCG(M1,b1);
%     t=toc;
%     min_cas1(2) = min(min_cas1(3),t);
%     cas1(i,3) = t;
%     res1(i,3) = r;
%     k3 = k3 + k;
% 
%     tic;
%     [r, k,rv4] = GMRES(M1,b1);
%     t=toc;
%     min_cas1(4) = min(min_cas1(4),t);
%     cas1(i,4) = t;
%     res1(i,4) = r;
%     k4 = k4 + k;
% end

% figure('Name','Graf po času (toleranca 10^-8)')
% plot(x,cas1(:,1))
% hold on
% plot(x, cas1(:,2))
% hold on
% plot(x, cas1(:,3))
% legend('Minres', 'Symmlq', 'PCG');
% hold off
% 
% figure('Name','Graf po ostanku (toleranca 10^-8)')
% plot(x,res1(:,1))
% hold on
% plot(x, res1(:,2))
% hold on
% plot(x, res1(:,3))
% legend('Minres', 'Symmlq', 'PCG');
% hold off
% 
% disp('Minimalni čas izvajanja (toleranca 10^-8):')
% disp('MINRES')
% min_cas1(1)
% disp('Symmlq')
% min_cas1(2)
% disp('PCG')
% min_cas1(3)

% title('Konvergenca za Gridgena (toleranca 10^-6, št. iteracij 2000)')
% 
% semilogy(0:length(rv1)-1,rv1./norm(b1),'g-');
% hold on
% semilogy(0:length(rv2)-1,rv2./norm(b1),'k-');
% semilogy(0:length(rv3)-1,rv3./norm(b1),'b-');
% semilogy(0:length(rv4)-1,rv4./norm(b1),'m-');
% yline(10^-6,'r--');
% xlabel('Iteracija');
% ylabel('Norma ostanka');
% legend('MINRES','SYMMLQ', ...
%    'PCG', 'GMRES(30)', 'Toleranca','Location','northeast');

% disp('Povprečno število korakov (toleranca 10^-8):')
% disp('MINRES')
% k1/5
% disp('Symmlq')
% k2/5
% disp('PCG')
% k3/5
% disp('GMRES')
% k3/5

%% RFdevice
% Uporabimo GMRES, BiCG, QMR in Bicgstab
M1 = A.Problem.A;
b1 = A.Problem.b; % podano je 9 možnosti za vektor b
b1 = b1(:,2:end); % podano je 9 možnosti za vektor b
min_cas1 = [10^16 10^16 10^6 10^6];
cas1 = [];
res1 = [];
k1 = 0;
k2 = 0;
k3 = 0;
k4 = 0;
x = 1:1:10;

for i = 5:8
    tic;
    [r, k,rv1] = GMRES(M1,b1(:,i));
    t=toc;
    min_cas1(1) = min(min_cas1(1),t);
    cas1(i,1) = t;
    res1(i,1) = r;
    k1 = k1 + k;

    tic;
    [r, k,rv2] = BICG(M1,b1(:,i));
    t=toc;
    min_cas1(2) = min(min_cas1(2),t);
    cas1(i,2) = t;
    res1(i,2) = r;
    k2 = k2 + k;

    tic;
    [r, k,rv3] = QMR(M1,b1(:,i));
    t=toc;
    min_cas1(2) = min(min_cas1(3),t);
    cas1(i,3) = t;
    res1(i,3) = r;
    k3 = k3 + k;

     tic;
    [r, k,rv4] = BICGSTAB(M1,b1(:,i));
    t=toc;
    min_cas1(2) = min(min_cas1(3),t);
    cas1(i,4) = t;
    res1(i,4) = r;
    k4 = k4 + k;

    figure('Name',sprintf('Konvergenca za RFdevice %d. (toleranca 10^-6, št. iteracij 2000)', i));
    title(sprintf('Konvergenca za RFdevice %d. (toleranca 10^-6, št. iteracij 2000)', i))
    semilogy(0:length(rv1)-1,rv1./norm(b1(:,i)),'g-', 'LineWidth',2);
    hold on
    semilogy(0:length(rv2)-1,rv2./norm(b1(:,i)),'k-');
    semilogy(0:length(rv3)-1,rv3./norm(b1(:,i)),'b-');
    semilogy(0:length(rv4)-1,rv4./norm(b1(:,i)),'m-');
    yline(10^-6,'r--');
    xlabel('Iteracija');
    ylabel('Norma ostanka');
    legend('GMRES(30)','BiCG', ...
       'QMR', 'BiCGSTAB', 'Toleranca','Location','northeast');

end
% 
% figure('Name','Graf po času (toleranca 10^-8)')
% plot(x,cas1(:,1))
% hold on
% plot(x, cas1(:,2))
% hold on
% plot(x, cas1(:,3))
% hold on
% plot(x, cas1(:,4))
% legend('Minres', 'Symmlq', 'PCG');
% hold off
% 
% figure('Name','Graf po ostanku (toleranca 10^-8)')
% plot(x,res1(:,1))
% hold on
% plot(x, res1(:,2))
% hold on
% plot(x, res1(:,3))
% hold on
% plot(x, res1(:,4))
% legend('GMRES', 'BICG', 'QMR', 'BICGSTAB');
% hold off
% 
% disp('Minimalni čas izvajanja (toleranca 10^-8):')
% disp('GMRES')
% min_cas1(1)
% disp('BICG')
% min_cas1(2)
% disp('QMR')
% min_cas1(3)
% disp('BICGSTAB')
% min_cas1(4)
% 
% disp('Povprečno število korakov (toleranca 10^-8):')
% disp('GMRES')
% k1/10
% disp('BICG')
% k2/10
% disp('QMR')
% k3/10
% disp('BICGSTAB')
% k4/10



 %% Funkcije   
    
function [res, k, rv] = BICGSTAB(M,b)
    [~, ~,res,k,rv] = bicgstab(M,b,10^-6, 10^5);
end

function [res, k,rv] = SYMMLQ(M,b)
    [~, h,res,k,rv] = symmlq(M,b, 10^-6, 2000,L,L');
end

function [res, k,rv] = QMR(M,b)
    [~, ~,res,k,rv] = qmr(M,b,10^-6, 10^5);
end

function [res, k, rv] = BICG(M,b)
    [~, ~,res,k,rv] = bicg(M,b,10^-6, 10^5);
end

function [res, k, rv] = PCG(M,b)
    [~, ~,res,k, rv] = pcg(M,b,10^-6, 2000);
end

function [res, k, rv] = MINRES(M,b)
    [~, h,res,k,rv] = minres(M,b,10^-6, 2000,L,L');
end

function [res, it, rv] = GMRES(M,b)
    % za c-63:
    % [L,U] = ilu(M);
    [~, ~,res, it, rv] = gmres(M,b,50,10^-6, 2000);
end

end