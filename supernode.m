function ret=supernode(moth,a,b,c,x,mem,i1)
%clc
%clear all
%a=[1 2 5 1
%   3 0 2 1 
%   %0 4 5 1
%  ];
%b=[2 0 5 0 0 1
%    ];
%c=[2 3 2 0 3 4
%    0 1 2 0 2 10];

%i1=3;
%x=nodes(a,b,c)
%mem=[2 0 3];

len=length(x);

%moth=zeros(len,len+1);
len1=length(mem);
siz1=size(a);
siz2=size(b);
siz3=size(c);
%i1=2;
for i=2:len1
    for j=1:siz1(1)
        if a(j,1)==mem(i)||a(j,2)==mem(i)
            a1=det_(mem(i),x);
            moth(i1,a1)=moth(i1,a1)+1/a(j,3);
            if a(j,1)==mem(i)
                for k=1:len
                    if a(j,2)==x(k)
                        %a2=det_(mem(k),x);
                        moth(i1,k)=moth(i1,k)-1/a(j,3);
                    end
                end
            end
            if a(j,2)==mem(i)
                for k=1:len
                    if a(j,1)==x(k)
                        %a2=det_(mem(k),x);
                        moth(i1,k)=moth(i1,k)-1/a(j,3);
                    end
                end
            end        
        end
    end
    
    
    for j=1:siz2(1)
        if b(j,1)==mem(i)||b(j,2)==mem(i)
            if b(j,6)==0                 %6666666666666666666
                if b(j,1)==mem(i)
                    moth(i1,len+1)=moth(i1,len+1)-b(j,3);
                else
                    moth(i1,len+1)=moth(i1,len+1)+b(j,3);
                end
            end
        end
    end
    for j=1:siz3(1)
        if c(j,1)==mem(i)||c(j,2)==mem(i)
            if c(j,5)==2
                if c(j,1)==mem(i)
                    moth=moth+v_c_dep(c(j,:),x,i1);
                else
                    moth=moth-v_c_dep(c(j,:),x,i1);
                end
            end
            if c(j,5)==4                
                if c(j,1)==mem(i)
                    moth=moth+c_c_dep(a,b,c,x,j,i1);
                else
                    moth=moth-c_c_dep(a,b,c,x,j,i1);
                end
            end
        end
    end
end

ret=moth;