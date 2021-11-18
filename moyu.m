clear all
clc
dt = 1;
dx = 1;
n = 1;     %听课时间
m = 1;     %移动距离
X = m*dx;
T = n*dt;
student = 25;
time = 45;

num = 1000000;
x = [1:1:student];
xx = 13;
x0 = xx;
index = zeros(student,time/dt+1);
eff = zeros(student,num);


for i = 1:1:num
    for j = 1:1:time/dt
        ran = randsrc();
        %ran = 1;
        if x0+ran*X > 0 && x0+ran*X <student+1
            x1 = x0+ran*X;
            for k = 1:1:student
                if index(k,j)>0
                    index(k,j+1) = index(k,j)-1;
                end
            end
            if x1>x0
                index(x0:x1,j+1) = T;
            else
                index(x1:x0,j+1) = T;
            end
            x0 = x1;
        elseif x0+ran*X <= 0
            
            x1 = X-(x0-1)+1;
            for k = 1:1:student
                if index(k,j)>0
                    index(k,j+1) = index(k,j)-1;
                end
            end
            if x1>x0
                index(1:x1,j+1) = T;
            else
                index(1:x0,j+1) = T;
            end
            x0 = x1;
        elseif x0+ran*X >= student+1
            
            x1 = student-(X-(student-x0));
            for k = 1:1:student
                if index(k,j)>0
                    index(k,j+1) = index(k,j)-1;
                end
            end
            if x0>x1
                index(x1:student,j+1) = T;
            else
                index(x0:student,j+1) = T;
            end
            x0 = x1;
        else
            disp('还有这种情况？')
        end
    end
    index(index~=0) = 1;
    eff(:,i) = sum(index,2);
    index = zeros(student,time/dt+1);
    x0 = xx;
end
effect = sum(eff,2)/num;
plot(effect)
