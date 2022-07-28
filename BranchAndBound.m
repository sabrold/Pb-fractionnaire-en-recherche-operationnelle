% pour avoir la solution entière
function [ xopt, fopt ] = BranchAndBound(A,b,c,alpha,beta)
d=[1 2 2];
[x,f] = CharnesAndCooper(A,b,c,d,alpha,beta);
check = abs(x-floor(x));
indCt = find(check>0);
if isempty(indCt)
    if fopt<f
        xopt = x;
        fopt =f;
    end 
    return ;
    % solution ent stop
else 
    indCt = indCt(1);
    
    A1 = [A;111];
    b1 = [b;floor(xot)];
    
    A1,b1>=x(indCt) <= floor(x(indCt));
    A2,b2>= x(indCt) <= floor(x(indCt))+1;
    
    [xopt,fopt] = BranchAndBound(A1,b1,c,alpha,beta,fopt,xopt);
    [xopt,fopt] = BranchAndBound(A2,b2,c,alpha,beta,fopt,xopt);  
end

