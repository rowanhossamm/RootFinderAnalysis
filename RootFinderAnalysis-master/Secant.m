function [A,B,Fa,Fb,XN,itr,tol,trr,telapsed] = Secant(array,funct,iter)
format long
   % x=eval(funct)
    f=inline(funct,'x');
    data=0;
    data1 = array;
    b=cell2mat(data1(2));
    a=cell2mat(data1(4));
    e=cell2mat(data1(6));
    itr = 0;
%     A =[a]
%     B =[b]
%     Fa =[ f(a)]
%     Fb =[ f(b)]
    A=[];
    B=[];
    Fa=[];
    Fb=[];
    XN=[];
    tol=[];
    trr=[];
    
    tic;
    for i=1:iter
        
       itr = itr +1;
       A =[A a];
       B =[B b];
       Fa =[Fa f(a)];
       Fb =[Fb f(b)];
        
       Xn=b-((f(b)*(a-b))/(f(a)-f(b)));
       XN=[XN Xn];
       t=abs(Xn-b);
       tol=[tol t];
       tr=(t/Xn)*100;
       trr=[trr tr];
       if(abs(Xn-b)<e)
           break;
       end
       a=b;
       b=Xn;
    end 
    
    telapsed=toc;
    
    
    A;
    B;
    Fa;
    Fb;
    XN;
    
end