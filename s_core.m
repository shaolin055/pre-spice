function ret=s_core(a,b,c)
%clc 
%clear all
%a = [4     5    10     0;    5     1    50     0;    7     0     1     0;     8     0   100     0];
%b = [1     0     0     0     0     1;    1     3    0     0     0     1;    5     6     0     0     0     1;     0     6     10     0     0     0];
%a=[1 2 1;   2 3 5;   4 5 1;   3 0 1];
%b=[2 0 10 0;   1 0 10 1;   3 4 5 1 ;   4 6 15 1;   6 0 10 0;   6 5 5 1];
%a=[1 2  60 0;   2 0  0-25i 1;   2 0  0+20i 2;   ];
%b=[1 0 19.3185-5.17638i 0.63662 -pi/12 1];
siz1=size(a);
siz2=size(b);
x=[];
%% Search NODES 
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
%% Mother matrix
len=length(x);
moth=zeros(len,len+1);
remember=[];
len_=length(remember);
pass=1;

for j=1:len_  %cheaking
    if x(i)==remember(j)
        pass=0;
        break;
    end
end
if pass==0
    pass=1;
    continue;
end
for j=1:siz1(1)     % Building impedance matrix
    if a(j,1)==x(i)||a(j,2)==x(i)
        
        moth(i,i)=moth(i,i)+1/a(j,3);
        if a(j,1)==x(i)
            for k=1:len
                if a(j,2)==x(k)                        
                    moth(i,k)=moth(i,k)-1/a(j,3);
                end
            end
        end
        if a(j,2)==x(i)
            for k=1:len
                if a(j,1)==x(k)                        
                    moth(i,k)=moth(i,k)-1/a(j,3);
                end
            end
        end
    end
end
x;
moth;

for j=1:siz2(1)        % Building source matrix
    if b(j,1)==x(i)||b(j,2)==x(i)
        if b(j,6)==0                       %6666666666666666666
            if b(j,1)==x(i)
                moth(i,len+1)=moth(i,len+1)-b(j,3);
            else
                moth(i,len+1)=moth(i,len+1)+b(j,3);
            end
        end            if b(j,6)==1                      %6666666666666666666     
            mem=noeqn(x(i),b);
            moth=writeqn(mem,b,moth,x);
            remember=[remember mem(2:length(mem))];
            len_=length(remember);
            moth=supernode(moth,a,b,c,x,mem,i);
            break;
        end
    end
end
for j=1:siz3(1)
    if c(j,1)==x(i)||c(j,2)==x(i)
        if c(j,5)==1
            mem=sp_noeqn(x(i),c);
            moth=writeqn(mem,b,moth,x);
            remember=[remember mem(2:length(mem))];
            len_=length(remember);
            moth=supernode(moth,a,b,c,x,mem,i);
            break;
        end
    end
end

end

x;
moth;
l=size(moth);
p=moth(1:l(1),1:l(1));
q=moth(1:l(1),l(2));
x;
ans=pinv(p)*q;
ans=[ans x'];

for i=1:len
    if ans(i,2)==0
        temp=ans(i,1);
        break;
    end
end
for i=1:len
    ans(i,1)=ans(i,1)-temp;
end
siz=size(ans);
temp1=[];
temp2=[];
for i=1:siz(1)
    for j=i:siz(1)
        if ans(i,2)>ans(j,2)
            temp1=ans(i,2);
            ans(i,2)=ans(j,2);
            ans(j,2)=temp1;
            temp2=ans(i,1);
            ans(i,1)=ans(j,1);
            ans(j,1)=temp2;
        end
    end
end
ret=ans;