function [iters,xnew,  xold,  Ees,Erel,fxold, fxnew,endtime] = Newton1(array,funct,iter)
format long
    func=funct;
    data = array;
    iterations=iter;
    intialpoint=cell2mat(data(2));
    tolerance=cell2mat(data(4));
    eq = sym(func);
    f = inline(char(eq));
    fdiff = inline(char(diff(eq)));
    %f(2)
    %fdiff(2)
   xnew=[];
   xold=[];
   Ees=[];
   Erel=[];
   iters=[];
   fxold=[];
   fxnew=[];
  tic;
   for i= 1 : iterations
       iters=[iters i]; 
       newpoint= intialpoint-(f(intialpoint)/fdiff(intialpoint));
       fxold=[fxold f(intialpoint)];
       fxnew=[fxnew f(newpoint)];
       xnew=[xnew newpoint];
       xold=[xold intialpoint];
       abserror=abs(newpoint-intialpoint);
       relerror= abs(abserror/newpoint)*100;
       Ees=[Ees abserror];
       Erel=[Erel relerror];
           if (abserror<tolerance)
               break
           end    
           
       intialpoint=newpoint;
        
   end 
   endtime=toc;
  iters ;
  xnew;
  xold;
  Ees;
  Erel;     
    
end 