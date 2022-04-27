function void=moderator(A,B,C,start,termina,nd)
clc
%clear all
clf
%A=[1 2 20 0;   2 3 47*10^-6 1;   4 5 10^-5 2;   5 0 4 0;   3 6 2 0   ];
%B=[1 0 10 90 -pi/6 1;   0 4 -2 60 0 0;   6 0 5 30 pi/3 1;   3 4 24 0 0 1;   ];
B_=B;
%start=50;         %milisecond
%termina=100;
%nd=[3 4];        %node point
%format long;
len=length(nodes(A,B,C));
siz=size(B);
moj=1;

for m=1:length(nd)
    y1=[];
    y2=0;
    x_=nodes(A,B,C);
    x_=arr(x_);
    n=det_(nd(m),x_);
    
    for i=start:termina
        moj=moj+1;
        if moj==20
            clc;
            disp('completing work...')            
        elseif moj==35
            clc;
            disp('completing work... ...')
        elseif moj==50
            clc;
            disp('completing work... ... ...')            
        elseif moj==65
            clc;
            disp('completing work... ... ... ...')            
        elseif moj==80
            clc;
            disp('completing work... ... ... ... ...')
        elseif moj==90
            clc
            disp('completing work... ... ... ... ... ...')
            moj=1;            
        end
        x(i-start+1)=i;
        
        for j=1:siz(1)
            if B_(j,4)~=0
                B(j,5)=2*pi*i*10^-3*B_(j,4)+B_(j,5);
            end
        end
       
        ans=zeros(len,2);
        mot=ac(A,B,C);
        si=size(mot);
        ans(1:si(1),1)=mot(1:si(1),1);
        ans(1:si(1),2)=ans(1:si(1),2)+mot(1:si(1),2);
        y1(i-start+1)=abs(ans(n,2))*sin(angle(ans(n,2)));                 %00000000000          
    end
    clc;
    mot=dc(A,B,C);
    y2=mot(n,2);     %00000000000
    si=size(mot);
    ans(1:si(1),1)=mot(1:si(1),1);
    ans(1:si(1),2)=ans(1:si(1),2)+mot(1:si(1),2);

    y=y1+y2;
    plot(x,y);
    hold on
end
grid on

%load gong.mat
%sound(y,Fs)

ans