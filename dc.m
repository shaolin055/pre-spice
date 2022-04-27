function ret=dc(A,B,C)
%clc
%clear all

len=length(nodes(A,B,C));
moth=zeros(len,2);
siz1=size(A);
siz2=size(B);
a=[];
b=[];
c=C;
j=1;
k=1;
for i=1:siz1(1)
    if A(i,4)==0
        a(j,1:siz1(2))=A(i,1:siz1(2));
        j=j+1;
    end
    if A(i,4)==1
        continue;
    end
    if A(i,4)==2
        b(k,1:2)=A(i,1:2);
        b(k,3:6)=[0,0,0,1];
        k=k+1;
    end
end
k1=k;
b_=b;
for l=1:siz2(1)         %superposition
    b=b_;
    k=k1;
    if B(l,3)==0&&B(l,4)~=0
        continue;
    end
    for i=1:siz2(1)
        if B(i,4)==0&&i==l
            b(k,1:siz2(2))=B(i,1:siz2(2));
            k=k+1;
        else
            if B(i,6)==1
                b(k,1:2)=B(i,1:2);
                b(k,3:6)=[0,0,0,1];
                k=k+1;
            end
            if B(i,6)==0
                continue;
            end
        end
    end
    b;
    mot=core(a,b,c);
    si=size(mot);
    moth=moth(1:si(1),1)+mot(1:si(1),1);
end
x=nodes(a,b,c);
ret=[x' moth];
