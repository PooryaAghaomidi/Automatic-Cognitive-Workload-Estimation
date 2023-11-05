clear all
close all
clc

last_lbl = load('wlbl.mat').wlbl ;

counter = 1 ;
for i = 1:840
   
    for j = 1:10
        workload_lbl(counter,1) = last_lbl(i,2) ;
        counter = counter + 1 ;
    end
    
end