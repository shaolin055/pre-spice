function ret=det_tot(a,b,c)

tot=[];
siza=size(a);
sizb=size(b);
sizc=size(c);

if siza(1)~=0
    tot=[a(:,1:2)
        ];
elseif siza(1)==0
        sprintf('Warning: No impedance identified')
end
if sizb(1)~=0
    tot=[tot
        b(:,1:2)
        ];
elseif sizb(1)==0
        sprintf('Warning: No dependent source identified,\ncausing all node to zero volt')
end
if sizc(1)~=0
    tot=[tot
        c(:,1:2)
        ];
end
ret=tot;
