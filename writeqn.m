function ret=writeqn(mem,a,b,c,moth,x)
%clc
%clear all
%b=[2 0 0 0;   1 0 1 1;   3 4 4 1 ;   6 4 6 1;   6 0 0 1;   6 5 5 1];
%mem=[3 4 6 0 5 1];
%x  =[0 1 2 3 4 5 6];
len=length(x);
%moth=zeros(len,len+1);
siz=size(b);
sizc=size(c);
len1=length(mem);
moth;
for i=1:len1
    for j=i+1:len1
        for k=1:siz(1)
            if mem(i)==b(k,1)&&mem(j)==b(k,2)&&b(k,6)==1        %6666666666666666666
                a1=det_(mem(j),x);
                a2=det_(mem(i),x);
                moth(a1,a1)=moth(a1,a1)-1;
                moth(a1,a2)=moth(a1,a2)+1;
                moth(a1,len+1)=moth(a1,len+1)+b(k,3);
            end
            if mem(i)==b(k,2)&&mem(j)==b(k,1)&&b(k,6)==1       %6666666666666666666
                a1=det_(mem(j),x);
                a2=det_(mem(i),x);
                moth(a1,a1)=moth(a1,a1)+1;
                moth(a1,a2)=moth(a1,a2)-1;
                moth(a1,len+1)=moth(a1,len+1)+b(k,3);
            end
        end
        for k=1:sizc(1)
            if mem(i)==c(k,1)&&mem(j)==c(k,2)&&c(k,5)==1        %6666666666666666666
                a1=det_(mem(j),x);
                a2=det_(mem(i),x);
                a3=det_(c(k,3),x);
                a4=det_(c(k,4),x);
                moth(a1,a1)=moth(a1,a1)-1;
                moth(a1,a2)=moth(a1,a2)+1;
                moth(a1,a3)=moth(a1,a3)-c(k,6);
                moth(a1,a4)=moth(a1,a4)+c(k,6);
            end
            if mem(i)==c(k,2)&&mem(j)==c(k,1)&&c(k,5)==1        %6666666666666666666
                a1=det_(mem(j),x);
                a2=det_(mem(i),x);                
                a3=det_(c(k,3),x);
                a4=det_(c(k,4),x);
                moth(a1,a1)=moth(a1,a1)+1;
                moth(a1,a2)=moth(a1,a2)-1;
                moth(a1,a3)=moth(a1,a3)-c(k,6);
                moth(a1,a4)=moth(a1,a4)+c(k,6);
            end
            if mem(i)==c(k,1)&&mem(j)==c(k,2)&&c(k,5)==3        %6666666666666666666
                a1=det_(mem(j),x);
                a2=det_(mem(i),x);                
                moth(a1,a1)=moth(a1,a1)-1;
                moth(a1,a2)=moth(a1,a2)+1;
                moth=moth-c_v_dep(a,b,c,x,k,a1);
            end
            if mem(i)==c(k,2)&&mem(j)==c(k,1)&&c(k,5)==3        %6666666666666666666
                a1=det_(mem(j),x);
                a2=det_(mem(i),x);                
                moth(a1,a1)=moth(a1,a1)+1;
                moth(a1,a2)=moth(a1,a2)-1;
                moth=moth-c_v_dep(a,b,c,x,k,a1);
            end
        end
    end
end
ret=moth;