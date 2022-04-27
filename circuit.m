function void=circuit()
clc
clear all

%%      phase 1: netlist: A for impidence, B for source, C for dependent source.

A=[1 2 500 0
   2 3 1000 0
   2 0 10^-6 1
   3 4 100 0
   4 5 100 0
   5 0 .1e-6 1
   ];
B=[1 0 20 50 pi/3 1
    2 0 10 65 0 1
    4 2 5 100 0 1
  ];

C=[3 0 2 1 4 5];

D=[];    %For helping purpose. Currently turned off

%%             phase 2: ploting informations



start=0;         %milisecond

terminate=200;


nodes=[4];        %node point as array





%%          phase 3: inner consideration
sprintf('.............Choose option...........\n\nPress:\n\n\t1. Transient analisis\n\n\t2. Ac sweep\n\n\t3. Impedance sweep (Currently off)\n\n\t4. Notations')

x=input('Press: ');
nd=smart_node(A,B,C,nodes);
if nd==0
    x=0;
end

switch x
    case 1
        moderator(A,B,C,start,terminate,nodes);
    case 2
        acsweep(A,B,C);
    case 3
        det=impsweep(A,B,C);
        if det==0
            sprintf('\tinput error\n\tprogramme aborted')
        end
    case 4
        notation();
    otherwise
        sprintf('\tinput error\n\tprogramme aborted')
end
