function [ x, fopt, ex ] = CharnesAndCooper( c,d,alpha,beta,A,b,lb,ub)
%p
%q = [];
%alpha = ;
%beta = ;
%A = [];
%b = [];
%lb = [];
%ub = [];
%lb2 = [];
%ub2 = [];
[m,n] = size(A);
%Définition de la fonction objectif
f = -[c alpha]; 
%Définition des coefficients de les contraintes linéaires inégalités
Aing = [A -b]; 
bing = zeros(m,1); 

%Définition des coefficients de les contraintes linéaires égalités
Aeq = [d beta]; 
beq = 1;

%Définition des bornes inférieures
lb2 = [lb 0];
%Définition des bornes supérieures
ub2 = [ub inf];

[y,fopt,ex] = linprog(f,Aing,bing,Aeq,beq,lb2,ub2);

if ex == 1
    if (y(n+1)>0)
        x = y(1:n)/y(n+1);
        fopt = (c*x + alpha)./(d*x +beta);
    else
    ex =0;
    end
else 
    disp('Pas de solution');
end 
%t2 = toc;
%t2

end

