function ret=c_v_dep(a,b,c,x,nd1,nd2)
%clc
%clear all

%a=[1 2 5 1
%   3 0 2 1 
%  ];
%b=[1 0 10 0 0 0
%   2 0 5 0 0 1 
%    ];
%c=[2 3 2 0 3 4];
%nd1=1;
%nd2=3;
%x=nodes(a,b,c);

br=0;
len=length(x);
siza=size(a);
sizb=size(b);
sizc=size(c);

moth=zeros(len,len+1);

for i=1:1
    for j=1:siza(1)
        if (a(j,1)==c(nd1,3)||a(j,1)==c(nd1,4))&&(a(j,2)==c(nd1,3)||a(j,2)==c(nd1,4))
            %'1'
            a1=det_(c(nd1,3),x);
            a2=det_(c(nd1,4),x);
            moth(nd2,a1)=moth(nd2,a1)+1/a(j,3)*c(nd1,6);
            moth(nd2,a2)=moth(nd2,a2)-1/a(j,3)*c(nd1,6);
            br=1;
            break;
        end
    end
    if br==1
        break;
    end
    for j=1:sizb(1)  
        if (b(j,1)==c(nd1,3)||b(j,1)==c(nd1,4))&&(b(j,2)==c(nd1,3)||b(j,2)==c(nd1,4))&&(b(j,6)==1)
            %'2'
            mem=sp_noeqn(c(nd1,4),c(nd1,3),b,c);
            moth=supernode(moth,a,b,c,x,mem,nd2)*c(nd1,6);
            br=1;
            break;
        end
        if (b(j,1)==c(nd1,3)||b(j,1)==c(nd1,4))&&(b(j,2)==c(nd1,3)||b(j,2)==c(nd1,4))&&(b(j,6)==0)
            %'3'
            moth(nd2,len+1)=moth(nd2,len+1)+c(nd1,6)*b(j,3);
            br=1;
            break;
        end
    end
    
    if br==1
        break;
    end
    
    for j=1:sizc(1)
        
        break;
    end
    
end
ret=moth;