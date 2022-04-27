function ret=impsweep(A,B,C)

clc
%clear all


A_=A;

imp=input('Please input the whole impedance branch of which u wanna sweep in a braket []\n: ');

start=input('start value: ');         %milisecond
termina=input('terminal value: ');
nd=input('node: ');        %node point

%det=input('1 to linear sweep 2 to decade sweep: ');

div1=(termina-start)/200;
%div2=(termina/start)^(1/199);
%format long;
len=length(nodes(A,B,C));
siz=size(A);

jud=1;
p=0;
y1=[];
y2=[];
x_=nodes(A,B,C);
x_=arr(x_);
n=det_(nd,x_);

for i=0:200
    x(i+1)=start+i*div1;
        
    for j=1:siz(1)
        if A_(j,1:4)==imp
            p=1;
            A(j,3)=x(i+1);
        end
    end
    if p==0
        jud=0;
        break;
    end
    %B(1,4)=i*10;
    
    ans=zeros(len,2);
    mot=ac(A,B,C);
    si=size(mot);
    ans(1:si(1),1)=mot(1:si(1),1);
    ans(1:si(1),2)=ans(1:si(1),2)+mot(1:si(1),2);
    y1(i+1)=abs(ans(n,2));                 %00000000000  
    
    mot=dc(A,B,C);
    y2(i+1)=mot(n,2);    
end

if jud==0
    ret=0;
else    
    y=y1+y2;
    plot(x,y);
    grid on
    ret=1;
end
