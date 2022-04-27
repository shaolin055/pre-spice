function ret=soo()
clc
clear all
load gong.mat
for i=980:2000:8000
    i
    sound(y,i);
end