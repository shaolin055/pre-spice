function ret=noeqn(xi,b,c)
%clc
%clear all
%b=[2 0 1 0 0 0;   1 0 1 0 0 1;   3 4 1 0 0 1;   4 6 1 0 0 1 ;   6 0 1 0 0 0 ;   6 5 1 0 0 1];
%c=[4 0 3 2 2 3];
%xi=3;
pass=1;
mem=xi;
len=length(mem);
siz=size(b);
sizc=size(c);
for i=1:100
    for j=1:siz(1)
        mem;
        pass=1;
        if b(j,1)==mem(i)&&b(j,6)==1        %6666666666666666666
            for k=1:len
                if b(j,2)==mem(k)
                    pass=0;
                    break;
                end
            end
            if pass==1
                mem=[mem b(j,2)];
            end
            %break;
        end
        if b(j,2)==mem(i)&&b(j,6)==1       %6666666666666666666
            for k=1:len
                if b(j,1)==mem(k)
                    pass=0;
                    break;
                end
            end
            if pass==1
                mem=[mem b(j,1)];                
            end
            %break;
        end        
    end
    
    for j=1:sizc(1)
        pass=1;
        if c(j,1)==mem(i)&&(c(j,5)==1||c(j,5)==3)        %6666666666666666666
            for k=1:len
                if c(j,2)==mem(k)
                    pass=0;
                    break;
                end
            end
            if pass==1
                mem=[mem c(j,2)];
            end
            %break;
        end
        if c(j,2)==mem(i)&&(c(j,5)==1||c(j,5)==3)       %6666666666666666666
            for k=1:len
                if c(j,1)==mem(k)
                    pass=0;
                    break;
                end
            end
            if pass==1
                mem=[mem c(j,1)];                
            end
            %break;
        end        
    end
    len=length(mem);
    if i==len
        break;
    end    
end
if len==1
    mem=[];
end
ret=mem;