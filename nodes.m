function ret=nodes(a,b,c)
%a=[1 2 1;   2 3 5;   4 5 1;   3 0 1];
%b=[2 0 10 0;   1 0 10 1;   3 4 5 1 ;   4 6 15 1;   6 0 10 0;   6 5 5 1];
siz1=size(a);
siz2=size(b);
siz3=size(c);
x=[];
for i=1:siz1(1)
    for j=1:2
        len=length(x);
        for k=1:len+1
            if k==len+1
                x(len+1)=a(i,j);
            end
            if x(k)==a(i,j)
                break;
            end
        end
    end
end
for i=1:siz2(1)
    for j=1:2
        len=length(x);
        for k=1:len+1
            if k==len+1
                x(len+1)=b(i,j);
            end
            if x(k)==b(i,j)
                break;
            end
        end
    end
end
for i=1:siz3(1)
    for j=1:2
        len=length(x);
        for k=1:len+1
            if k==len+1
                x(len+1)=c(i,j);
            end
            if x(k)==c(i,j)
                break;
            end
        end
    end
end
x=arr(x);
ret=x;