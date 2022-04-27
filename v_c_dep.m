function ret=v_c_dep(c,x,i)
%clc
%clear all
%c=[2 0 2 3 2 5];
%x=[0 1 2 3];
%i=3;

len=length(x);

moth=zeros(len,len+1);

a1=det_(c(3),x);
a2=det_(c(4),x);

moth(i,a1)=moth(i,a1)+c(6);
moth(i,a2)=moth(i,a2)-c(6);

ret=moth;