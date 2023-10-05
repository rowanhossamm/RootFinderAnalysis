function  [l,fxl,u,fxu,xr,fxr,ea,rel,elapsedTime,c] = Bisection1(array,funct,iter)
    format long
    func = '@(x)';
    func = strcat(func,funct);
    f = str2func(func);
    data = array;
    tol = cell2mat(data(6));
    u(1)=cell2mat(data(2));
    l(1)=cell2mat(data(4));
  
    
    tic;
    
    if f(l)*f(u) > 0
        errordlg('No root in this interval !','Bisection Error');
    return
    end

if f(u)==0
    xr(1)=u;
    fxu(1)=0;
    fxr(1)=0;
    fxl(1)=f(l);
    c=1;
  
    elapsedTime = toc;
  
    return;
elseif f(l)==0
    xr(1)=l;
    fxl(1)=0;
    fxr(1)=0;
    fxu(1)=f(u);
    c=1;
    elapsedTime = toc;
  
    return;
end

for i=1:1:iter
    xr(i)=(u(i)+l(i))/2;
    if i > 1
        rel(i)=abs((xr(i)-xr(i-1))/xr(i));
        ea(i)=abs(xr(i)-xr(i-1));
    else
        rel(i)=1;
    end
    
    test=f(xr(i))*f(l(i));
    if test == 0
        rel(i) = 0;
    end
    if rel(i) <= tol || i == iter
        c=i;
        break;
    end
    if test < 0
        u(i+1) = xr(i);
        l(i+1)=l(i);
        fxu(i+1)=f(u(i));
        fxr(i+1)=f(xr(i));
        fxl(i+1)=f(l(i));
    else
        l(i+1) = xr(i);
        u(i+1)=u(i);
        fxu(i+1)=f(u(i));
        fxr(i+1)=f(xr(i));
        fxl(i+1)=f(l(i));
    end
    
end
elapsedTime = toc;
end