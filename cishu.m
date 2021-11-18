clear all
tic
num = 1000;
x0 = 500;
index = zeros(1001,46);
index(500,1) = 1;

eff = zeros(1001,num);
for i = 1:1:num
    for j = 1:1:45
        ran = randsrc();
        x1 = x0+ran;
        index(x1,j+1) = 1;
        x0 = x1;
        
    end
    eff(:,i) = sum(index,2);
    x0=500;
    index = zeros(1001,46);
    index(500,1) = 1;
end
effect = sum(eff,2)/num;
toc