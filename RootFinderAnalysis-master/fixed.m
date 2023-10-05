function [ root_xi , root_xinew ,time_taken ,counter ,state , ea , rel ] = fixed(array,funct)
    func = '@(x)';
    f = strcat(func,funct);
    
    data = array;
    iter = cell2mat(array(2));
    initial = cell2mat(array(4));
    tol = cell2mat(array(6));
    syms x ; 
    
    f = str2func(f);
    G = diff(f,x);
    G = inline(G);
    ea(1) = 0;
    rel(1) = 0;
    root_xi(1) = initial;
    root_xinew(1) = 0;
    state = '';
    time_taken = 0;
    
    G_initial = G(initial);
    counter = 0;
    if abs(G_initial)>1
        state = 'diverge';
    else
        start_time = tic;
        state = 'converge';
        for i = 1:1:iter
            counter = i;
            root_xinew(i) = f(root_xi(i));
            
            ea(i+1) = abs(root_xinew(i) - root_xi(i));
            rel(i+1) = (ea(i+1)/root_xinew(i))*100;
            if ea(i+1) < tol
                time_taken = toc(start_time);
                break;
            end
            if i ~= iter
                next_value = i+1;
                root_xi(next_value) = root_xinew(i);
            end
        end
        
        if time_taken == 0
            time_taken = toc(start_time);
        end
        
    end
end