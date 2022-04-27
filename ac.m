function ret=ac(A,B,C)
%clc
%clear all
%A=[1 2 4 0;   2 3 1/12 1;   3 0 1 0;   3 4 2 2;   4 0 6 0   ];
%B=[1 0 16 4/(2*pi) -pi/2 1;   0 3 2 4/(2*pi) 0 0;    ];
format long;
len=length(nodes(A,B,C));
moth=zeros(len,2);
siz1=size(A);
siz2=size(B);
a=[];
b=[];
c=C;
j=0;
term=1; %for ceaking purpose

for i=1:siz2(1)
    if B(i,4)==0
        continue;
    end
    j=j+1;
end
if j==0
    term=0;
end
l=1;
for i=1:j
    for k=l:siz2(1)
        if B(k,4)~=0
            B_(i,1:siz2(2))=B(k,1:siz2(2));
            l=k+1;
            break;
        end
    end
end
l=1;
for i=1:j
    b=[];
    fre=B_(i,4);    
    set=B_(i,1)+10*B_(i,2)+100*B_(i,3)+1000*B_(i,4)+10000*B_(i,5)+100000*B_(i,6);
    for k=1:siz1(1)
        if A(k,4)==0
            a(k,1:siz1(2))=A(k,1:siz1(2));
        end
        if A(k,4)==1
            r=complex(0,-1/(2*pi*fre*A(k,3)));
            a(k,1:siz1(2))=A(k,1:siz1(2));
            a(k,3)=r;
        end
        if A(k,4)==2
            r=complex(0,2*pi*fre*A(k,3));
            a(k,1:siz1(2))=A(k,1:siz1(2));
            a(k,3)=r;
        end
    end
    l=1;
    for k=1:siz2(1)        
        set_=B(k,1)+10*B(k,2)+100*B(k,3)+1000*B(k,4)+10000*B(k,5)+100000*B(k,6);
        if  set==set_
            b(l,1:6)=B(k,1:6);
            r=complex(cos(B(k,5)),sin(B(k,5)));
            b(l,3)=B(k,3)*r;
            l=l+1;    
            continue;
        end
        if set~=set_&&B(k,6)==1
            b(l,1:2)=B(k,1:2);
            b(l,3:6)=[0,0,0,1];
            l=l+1;
        end
        if set~=set_&&B(k,6)==0
            continue;
        end
    end
    b;
    mot=core(a,b,c);
    si=size(mot);
    moth=moth(1:si(1),1)+mot(1:si(1),1);
end
x=nodes(a,b,c);
if j~=0
    ret=[x' moth];       
else
    ret=zeros(len,2);
end