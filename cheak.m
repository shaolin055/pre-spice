function ret=cheak(c,rem)
len=length(rem);
pass=1;
for i=1:len
    if rem(i)==c(1)||rem(i)==c(2)
        pass=0;
    end
end
if pass==0
    ret=0;
else
    ret=1;
end