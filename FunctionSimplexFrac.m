function [x,  fopt,ex] = SimplexFrac( c,d,alpha,beta,A,b)

%Forme standard
[m,n] = size(A);
A = [A eye(m)];
c = [c zeros(1,m)];
d = [d zeros(1,m)];

%Trouver une base réalisable
x = zeros(n+m,1);
vb = [n+1:m+n];
vhb = 1:n;
ex = 0; %1 opt 0 irrea 2

%SI AUCUNE BASE n'est réalisable on renvoit 0 ex=0 sinon 1
while ex == 0
    %cout réduit
    invA = A(:,vb)^(-1);
    x(vb) = invA*b;  %Solution associée à la base vb
    x(vbh) = 0; %variables hors base = 0
    yc = invA*c(vb);
    yd = invA*d(vb);
    
    cbar = c(vhb) - yc'*A(:,vhb);
    dbar = d(vhb) - yd'*A(:,vhb);
    alphabar = c*x + alpha;
    betabar = d*x + beta;
    gamma = betabar*cbar - alphabar*dbar;
    
    % Condition d'optimalité
    [minGamma,indent] = max(gamma);
    if (minGamma < 0)
        % optimum
        ex = 1;   
        fopt = (c*x+alpha)/(d*x+beta)
        break;
    else 
        %Trouver l'indice de la variable sortante
        ds = invA*A(:,vhb(indEnt));
        ds(ds<=0) = inf;
        [minDS,indSort] = min(x(vb)./ds);
        if (minDS==inf)
            %PB unb
            ex=0;
            break;
        else 
            %Mise à jour de la basse
            vi=vhb(indEnt);
            vhb(indEnt) = vb(indsort);
            vb(indSort) = vi;
        end
    end

end

