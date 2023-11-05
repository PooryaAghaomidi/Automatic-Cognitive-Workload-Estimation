%% get ready!
clear all
close all
clc

%% load data
for i = 1:9
    
    temp = load(['00' num2str(i) '.mat']) ;
    temp_data(1,:) = temp.val ;
    reshaped_data(i,:) = my_reshape(temp_data) ;
    clear temp_data
    
end

for i = 10:99
    
    temp = load(['0' num2str(i) '.mat']) ;
    temp_data(1,:) = temp.val ;
    reshaped_data(i,:) = my_reshape(temp_data) ;
    clear temp_data
    
end

for i = 100:840
    
    temp = load([num2str(i) '.mat']) ;
    temp_data(1,:) = temp.val ;
    reshaped_data(i,:) = my_reshape(temp_data) ;
    clear temp_data
    
end

%% image generation
counter = 1 ;
for i = 1:840
    
    for j = 1:20
        
        img = spectrogram(reshaped_data(i,1+2500*(j-1):2500*j),500);
        save(['images/a_' num2str(counter) '.mat'],'img')
        counter = counter + 1 ;
        
    end
    
end


%% reshape function
function reshaped_data = my_reshape(data)

target = 50000 ;
    if (target - length(data)) < 0
        reshaped_data(1,1:target+1) = data(1,1:target+1) ;
    else
        tmp = data(1,5000:((target - length(data))+5000)) ;
        reshaped_data = horzcat(data, tmp) ;
    end

end

