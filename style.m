function ret=style()
clc
clear all
a='searching nodes';
pa=.5;
for i=1:3
    sprintf('%s.',a)
    pause(pa);
    clc;
    sprintf('%s..',a)
    pause(pa);
    clc;
    sprintf('%s...',a)
    pause(pa)
    clc;
    sprintf('%s... .',a)
    pause(pa)
    clc;
    sprintf('%s... ..',a)
    pause(pa)
    clc;
    sprintf('%s... ...',a)
    pause(pa)
    clc;
end