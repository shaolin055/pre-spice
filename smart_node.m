function ret=smart_node(a,b,c,nod)
%clc
%clear all
%a=[1 2 5 0
%   3 4 10^-6 1
%   ];
%b=[1 0 10 60 0 1
%   1 0 3 65 0 1
%  ];
%c=[0 4 2 3 1 5
%   1 0 3 65 1 2
%   0 4 2 3 1 6
%   ];

 tot=det_tot(a,b,c);
 
 nds=nodes(a,b,c);
 leng=length(nds);
 siz=size(tot);
 nd=tot(1,1:2);
 tem1=0;
 tem2=0;
 lo=1;
 nd_s=[0 0];
 jud=1;
 
 len=length(nd);
 
 if isempty(nod)
     sprintf('Error Ocured: No nodes selected to show result. Specify node.')
     jud=0;
 end
 for k=1:siz(1)+1
     if lo==len+1
         break;
     end
     for i=1:siz(1)       
         if tot(i,1)==nd(lo)
             nd_s(lo)=nd_s(lo)+1;
         end
         if tot(i,2)==nd(lo)
             nd_s(lo)=nd_s(lo)+1;
         end
         for j=1:len
             if tot(i,1)==nd(j)
                 tem1=tem1+1;
             end
             if tot(i,2)==nd(j)
                 tem2=tem2+1;
             end
             if tot(i,1)==nd(j)&&tot(i,2)==nd(j)
                 sprintf('Error Ocured:\nTYPE: Same nodes used at component %d',i)
                 %%%%%%%%%%%%%%%%%%%%%%%%%%%programme hult
                 jud=0;
             end
         end
         if tem1==1&&tem2==1
             tem1=0;
             tem2=0;
             continue;
         else
             if tem1==1
                 nd=[nd tot(i,2)];
                 nd_s=[nd_s 0];
             end
             if tem2==1
                 nd=[nd tot(i,1)];
                 nd_s=[nd_s 0];
             end
         end
         
         len=length(nd);
         tem1=0;
         tem2=0;
     end
     lo=lo+1;
 end
 

 
 
 
 for i=1:len
     if nd_s(i)==1
         sprintf('Error Ocured:\nTYPE: Node \''%d\'' is isoleted',nd(i))
         jud=0;
     end
 end
 
 nd=arr(nd);
 if len~=leng
     k=0;
     sp2=[];
     sp1=[];
     sprintf('Error Ocured:\nTYPE: Fragmented circuit found.\n Fragmentations are at nodes:')
     for i=1:leng
         for j=1:len
             if nds(i)==nd(j)
                 sp1=[sp1 nds(i)];
                 k=1;
                 break;
             end
         end
         if k==0
             sp2=[sp2 nds(i)];
         end
         k=0;
     end
     sprintf('\t%d',sp1)
     sprintf('\t%d',sp2)
     %%%%%%%%%%%%%% programme hult 
     jud=0;
 end
 
 sizb=size(b);
 for i=1:sizb(1)
     set1=0;
     set2=0;
     set1=b(i,1)+10*b(i,2);
     for j=i:sizb(1)
         set2=b(j,1)+10*b(j,2);
         if set1==set2
             if b(i,6)==1&&b(j,6)==1
                 if b(i,3)~=b(j,3)||b(i,4)~=b(j,4)||b(i,5)~=b(j,5)
                     sprintf('Error Ocured:\nTYPE: Differnet voltage sources used\nbet\''n same nodes: %d,%d',b(i,1),b(i,2))
                     jud=0;
                     break;
                 end
             end
         end
     end     
 end
 sizc=size(c);
 for i=1:sizc(1)
    set1=0;
    set2=0;
    set1=c(i,1)+10*c(i,2);
    for j=i:sizc(1)
        set2=c(j,1)+10*c(j,2);
        if set1==set2
            if c(i,5)==1||c(i,5)==3&&c(j,5)==1||c(j,5)==3
                if c(i,3)~=c(j,3)||c(i,4)~=c(j,4)||c(i,6)~=c(j,6)
                    sprintf('Error Ocured:\nTYPE: Differnet voltage sources used\nbet\''n same nodes: %d,%d',c(i,1),c(i,2))
                    jud=0;
                    break;
                end
            end
        end
    end
 end
 
 for i=1:sizc(1)
    set1=0;
    set2=0;
    set1=c(i,1)+10*c(i,2);
    for j=i:sizb(1)
        set2=b(j,1)+10*b(j,2);
        if set1==set2&&c(i,5)==1||c(i,5)==3
            sprintf('Error Ocured:\nTYPE: Differnet type voltage sources used\nbet\''n same nodes: %d,%d',b(i,1),b(i,2))
            jud=0;
            break;
        end
    end
 end
 
 if jud==0
     ret=0;
 else
     ret=1;
 end