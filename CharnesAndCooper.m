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
%D�finition de la fonction objectif
f = -[c alpha]; 
%D�finition des coefficients de les contraintes lin�aires in�galit�s
Aing = [A -b]; 
bing = zeros(m,1); 

%D�finition des coefficients de les contraintes lin�aires �galit�s
Aeq = [d beta]; 
beq = 1;

%D�finition des bornes inf�rieures
lb2 = [lb 0];
%D�finition des bornes sup�rieures
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

