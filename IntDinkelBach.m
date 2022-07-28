function [ xopt, fopt, ex ] = IntDinkelBach( c,d,alpha,beta,A,b,lb )
[xo,~,ex] = linprog(d, A, b);
if ex~=1
    disp('the problem has not a solution');
    xopt = [];
    fopt = [];
else
    %tolétance
    tol = 10^(-4);
    while true
        lambda = ((c*xo+alpha)/(d*xo+beta));
        [xo, F, ex] = linprog(-(c-lambda*d), A, b, [], [], lb);
        if abs(-F+alpha-lambda*beta)<=tol
            xopt = xo;
            fopt = (c*xo+alpha)/(d*xo+beta);
        break;
        end
    end
    
end



end

