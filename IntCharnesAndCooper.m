function [x,fopt,ex] = IntCharnesAndCooper (A,b,c,d,alpha,beta,lb,ub)
    eps = 10^(-4);
    [ x, fopt, ex ] = CharnesAndCooper( c,d,alpha,beta,A,b,lb,ub)
    if ex<=0
        return
    end 
    if fopt>0
        return
    end

    ind = abs (x-round(x))<=eps;
    if any(ind == 0) ;
        ind = find(ind == 0);
        ind = idn(1);
        lb1 =lb;
        ub1 =ub;
        ub1 (ind) = floor (x(ind));
    
        [x, fopt] = IntCharnesAndCooper (A,b,c,d,alpha,beta,lb1,ub1,intcon,x,fopt);
        lb1 (ind)= floor (x(ind))+1;
    [x,fopt]= IntCharnesAndCooper (A,b,c,d,alpha,beta,lb,ub,intcon,x,fopt);
    else 
        if fopt<fopt
            x = x;
            fopt=f;
        end

    end
end