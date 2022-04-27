function ret=v_v_dep(a,b,c,x,i)
%clc
%clear all

%a=[1 2 1 1
%   2 3 5 1
%   4 5 2 1 
%  ];
%b=[1 0 10 0 0 1
%   2 0 6 0 0 0
%   3 4 2 0 0 1
%   4 6 3 0 0 1
%   6 5 4 0 0 1
%   6 0 10 0 0 0
%    ];
%c=[4 0 6 0 1 3];

%i=4;
%x=nodes(a,b,c);
len=length(x);
siza=size(a);
sizb=size(b);
sizc=size(c);

moth=zeros(len,len+1);

mem=noeqn(x(i),b,c);
moth=writeqn(mem,b,c,moth,x);
%remember=[remember mem(2:length(mem))]
%len_=length(remember);
%moth=zeros(len,len+1);
moth=supernode(moth,a,b,c,x,mem,i);