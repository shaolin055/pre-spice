function ret=det_(a,x)
len=length(x);
for i=1:len
    if a==x(i)
        ret=i;
        break;
    end
end