function ret=acsweep(A,B,C)

clc
%clear all
%A=[1 2 100 0;  2 0 2*10^-5 1;   2 0 10^-6 2;    4 3 100 0;    3 0 20*10^-6 1;   3 0 10^-6 2    ];
%B=[1 0 10 60 0 1;   4 1 2 60 0 1;     % 6 0 5 30 pi/3 1;   % 3 4 24 0 0 1 ];
B_=B;

start=input('start frequncy: ');         %milisecond
termina=input('terminal frequency: ');
nd=input('node: ');        %node point
%det=input('1 to linear sweep 2 to decade sweep: ');

div1=(termina-start)/100;
%div2=(termina/start)^(1/199);
%format long;
len=length(nodes(A,B,C));
siz=size(B);

moj=1;
y1=[];
x_=nodes(A,B,C);
x_=arr(x_);
n=det_(nd,x_);

for i=0:200
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
    x(i+1)=start+i*div1;
        
    for j=1:siz(1)
        if B_(j,4)~=0
            B(j,4)=x(i+1);
        end
    end
    %B(1,4)=i*10;
    
    ans=zeros(len,2);
    mot=ac(A,B,C);
    si=size(mot);
    ans(1:si(1),1)=mot(1:si(1),1);
    ans(1:si(1),2)=ans(1:si(1),2)+mot(1:si(1),2);
    y(i+1)=abs(ans(n,2));                 %00000000000  
end
clc;
plot(x,y);

grid on

ans