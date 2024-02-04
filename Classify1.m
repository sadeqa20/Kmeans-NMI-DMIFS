function [acc_rf,acc_dt,acc_knn]=Classify1(data)
Featurs = data(:,1:end-1);
Targets = data(:,end);
                
%% Test and Train Data
TrPercent = 70;NSamples = numel(Targets);
TrNum = round(NSamples * TrPercent / 100);
TsNum = NSamples - TrNum;

R = randperm(NSamples);
trIndex = R(1 : TrNum);
tsIndex = R(1+TrNum : end);

TrainFeaturs = Featurs(trIndex,:);
TrainTargets = Targets(trIndex,:);

TestFeaturs = Featurs(tsIndex,:);
TestTargets = Targets(tsIndex,:);

%% Classify

%-------------Decision Tree---------------
DT=DTree(TestFeaturs,TrainFeaturs,TrainTargets);
accd=confusionmat(TestTargets,DT);
[acc_dt]  = peformance1( accd );
% acc_dt=sum(sum(diag(accd)))/test_count;
disp('==========================');
disp(acc_dt);

%-------------Random Forest----------------
rforest=randomforest(TestFeaturs,TrainFeaturs,TrainTargets);
accr=confusionmat(TestTargets,rforest);
[acc_rf]  = peformance1( accr );
% acc_rf=sum(sum(diag(accr)))/test_count;
disp('==========================');
disp(acc_rf);


%--------------KNN----------------
knnModel=fitcknn(TrainFeaturs,TrainTargets,'NumNeighbors',4);
      pred=knnModel.predict(TestFeaturs);
      sk=pred;
      acckn=confusionmat(TestTargets,sk);
      [acc_knn]  = peformance1( acckn );
%       acc_knn=sum(sum(diag(acckn)))/test_count;
      disp('==========================');
      disp(acc_knn);