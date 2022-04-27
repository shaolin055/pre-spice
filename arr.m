function ret=arr(x)
%x=[1 5 3 0 7 9];
len=length(x);
temp=[];
for i=1:len
    for j=i:len
        if x(i)>x(j)
            temp=x(i);
            x(i)=x(j);
            x(j)=temp;
        end
    end
end
ret=x;