function [ Confuse ] = peformance1(confusionMatrix)

[m n]=size(confusionMatrix);
c=confusionMatrix;
ss=sum(c,2);
for i=1:m
    qq(1,i)=c(i,i)/ss(i);
end
Confuse=qq;    
