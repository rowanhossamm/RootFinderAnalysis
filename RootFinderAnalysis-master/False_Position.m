function [ a,fa,b,fb,xr,fxr,tol,relerr,counter,endtime ] = False_Position ( data_array,funct)
    format long
    func = '@(x)';
    %test_funct = 'x.^4-2.*x.^3-4.*x.^2+4.*x+4'
    func = strcat(func,funct);
    f = str2func(func);
    xl = cell2mat(data_array(6));
    xu = cell2mat(data_array(4));
    tolerance = cell2mat(data_array(8));
    N = cell2mat(data_array(2));
    counter = 0;
    tic;
    if ( f(xl) == 0 )
        a(1) = xl;
        b(1) = xu;
        fa(1) = f(xl);
        fb(1) = f(xu);
        tol(1) = Inf;
        xr(1) = xl;
        fxr(1) = f(xl);
        endtime=toc;
        return;
    elseif ( f(xu) == 0 )
        a(1) = xl;
        b(1) = xu;
        fa(1) = f(xl);
        fb(1) = f(xu);
        tol(1) = Inf;
        xr(1) = xu;
        fxr(1) = f(xu);
        endtime=toc;
        return;
    elseif ( f(xl) * f(xu) > 0 )
        error( 'f(xl) and f(xu) do not have opposite signs' );
    elseif ( f(xl) * f(xu) < 0 )
        xr_old = Inf;
        for i = 1:N
            counter = counter + 1;
            xr_new = ((xl*f(xu))-(xu*f(xl)))/(f(xu)-f(xl));
            a(i) = xl;
            b(i) = xu;
            fa(i) = f(xl);
            fb(i) = f(xu);
            tol(i) = abs(xr_new - xr_old);
            relerr(i)=(tol(i)/xr_new)*100;
            xr(i) = xr_new;
            fxr(i) = f(xr_new);
            if( f(xr_new) == 0)
                endtime=toc;
                return;
            elseif (f(xl) * f(xr_new) < 0)
                xu = xr_new;
            elseif (f(xu) * f(xr_new) < 0)
                xl = xr_new;
            end
            if ( abs(xr_new - xr_old) < tolerance)
                endtime=toc;
                return;
            end
            xr_old = xr_new;
        end
        endtime=toc;
    end
    error( 'the method did not converge' );
    
end