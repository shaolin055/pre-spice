function ret=core(a,b,c)
%clc 
%clear all

%a=[0 1 4 1    1 3 1 1    2 0 1 1    3 0 4 1    3 4 2 1  ];
%b=[0 1 1 0 0 0    4 0 10 0 0 1    ];
%c=[2 1 3 0 3 4    3 2 1 3 2 2    ];
%a=[1 2  60 0;   2 0  0-25i 1;   2 0  0+20i 2;   ];
%b=[1 0 19.3185-5.17638i 0.63662 -pi/12 1];
siz1=size(a);
siz2=size(b);
siz3=size(c);
x=nodes(a,b,c);
%% Mother matrix
len=length(x);
moth=zeros(len,len+1);
remember=[];
len_=length(remember);
pass=1;

for i=1:len
    x(i);
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

    
    for j=1:siz2(1)        % Building source matrix
        if b(j,1)==x(i)||b(j,2)==x(i)
            if b(j,6)==0                       %6666666666666666666
                if b(j,1)==x(i)
                    moth(i,len+1)=moth(i,len+1)-b(j,3);
                else
                    moth(i,len+1)=moth(i,len+1)+b(j,3);
                end
            end
            if b(j,6)==1                      %6666666666666666666    
                ck=cheak(b(j,:),remember);
                if ck==1
                    mem=noeqn(x(i),b,c);
                    moth=writeqn(mem,a,b,c,moth,x);
                    remember=[remember mem(2:length(mem))];
                    len_=length(remember);
                    moth=supernode(moth,a,b,c,x,mem,i);
                end
            end
        end
    end
    for j=1:siz3(1)
        if c(j,1)==x(i)||c(j,2)==x(i)
            if c(j,5)==1
                ck=cheak(c(j,:),remember);
                if ck==1
                    mem=noeqn(x(i),b,c);
                    moth=writeqn(mem,a,b,c,moth,x);
                    remember=[remember mem(2:length(mem))];
                    len_=length(remember);
                    moth=supernode(moth,a,b,c,x,mem,i);
                end
            end
            if c(j,5)==2
                if c(j,1)==x(i)
                    moth=moth+v_c_dep(c(j,:),x,i);
                else 
                    moth=moth-v_c_dep(c(j,:),x,i);
                end                
            end
            if c(j,5)==3
                ck=cheak(c(j,:),remember);
                if ck==1
                    mem=noeqn(x(i),b,c);
                    moth=writeqn(mem,a,b,c,moth,x);
                    remember=[remember mem(2:length(mem))];
                    len_=length(remember);
                    moth=supernode(moth,a,b,c,x,mem,i);
                end
            end
            if c(j,5)==4
                if c(j,1)==x(i)
                    moth=moth+c_c_dep(a,b,c,x,j,i);
                else
                    moth=moth-c_c_dep(a,b,c,x,j,i);
                end
            end
        end        
    end
    moth;
end


l=size(moth);
p=moth(1:l(1),1:l(1));
q=moth(1:l(1),l(2));

ans1=pinv(p)*q;
ans1=[ans1 x'];

for i=1:len
    if ans1(i,2)==0
        temp=ans1(i,1);
        break;
    end
end
for i=1:len
    ans1(i,1)=ans1(i,1)-temp;
end
siz=size(ans1);
temp1=[];
temp2=[];
for i=1:siz(1)
    for j=i:siz(1)
        if ans1(i,2)>ans1(j,2)
            temp1=ans1(i,2);
            ans1(i,2)=ans1(j,2);
            ans1(j,2)=temp1;
            temp2=ans1(i,1);
            ans1(i,1)=ans1(j,1);
            ans1(j,1)=temp2;
        end
    end
end
ret=ans1;