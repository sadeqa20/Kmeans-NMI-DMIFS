clear all
close all
clc
%% Read Data Sets
% data=load ('./Datasets/SRBCT.mat');data=data.a;
% data=load('./Datasets/colon.mat');data=data.a;
% data=load('./Datasets/CNS.mat');data=data.a;
% data=load('./Datasets/Leukemia.mat');data=data.a;
% data=load('./Datasets/Leukemia_3c.mat');data=data.a;
% data=load('./Datasets/Leukemia_4c.mat');data=data.a;
% data=load('./Datasets/Lung.mat');data=data.a;
data=load('./Datasets/Lymphoma.mat');data=data.a;
% data=load('./Datasets/MLL.mat');data=data.a;
% data=load('./Datasets/ovarian.mat');data=data.data;
%%2clas Lung-Leukemia_2c-colon-CNS-ovarian
%%3class MLL - Lymphoma - Leukemia_3c
%%4class SRBCT - Leukemia_4c
 %%

Featurs = data(:,1:end-1);
Targets = data(:,end);
[p q]=size(Featurs);
M=max(Targets);



   
   %%
   disp('------------------calculate K-means----------------------------');
   

for i=1:q
    nn=0;
    d1=[];
    aa=[];
    aa=Featurs(:,i);

    for K=2:M+5
        c=kmean( aa,1,p,K ); 
        L1=c';
        ac1=mutualinfo(L1,Targets);
        if ac1>nn
            nn=ac1;
            d1=c;
        end
    end
    acc1(i)=nn;
    dd(:,i)=d1';
end
[qq ww]=sort(acc1,'descend');
  
%%
 disp('------------------calculate MI ----------------------------');
Thersould=20;
S=[];
 E=(1:q);
[qq ww]=max(acc1);
S=ww;
E=setdiff(E,S);
%%
for i=1:Thersould-1
    i
    n1=size(E,2);
    for j=1:n1
        n2=size(S,2);
        s=0;
        for l=1:n2
          ac2=mutualinfo(dd(:,E(j)),dd(:,S(l)));  
          s=s+ac2;
        end
        M1=(1/n2)*s;
        M2=mutualinfo(dd(:,E(j)),Targets);
        M3(j)=(0.5*M2-0.5*M1);
    end
    [qq ww]=max(M3);
    S=union(S,ww);
E=setdiff(E,S);
end
%%
datanew=data(:,S);
disp(S);
datacluster=dd(:,S);

%%
disp('------------------calculate Mutual Info----------------------------');
datamutual=miauto(datacluster,Targets);
% ACCdatamutual=newAcc1(datamutual);
%%
disp('------------------calculate DMIFS----------------------------');
CMDMIFS=DMIFS(datacluster,Targets,0.5);
dataDMIFS=datacluster(:,CMDMIFS);
idxDMIFS=S(:,CMDMIFS);
%%
disp('------------------calculate ACC-------------------')
datacluster(:,end+1)=Targets;
datamutual(:,end+1)=Targets;
dataDMIFS(:,end+1)=Targets;
ACCdataIAMB=newAcc1(dataDMIFS);
%%



