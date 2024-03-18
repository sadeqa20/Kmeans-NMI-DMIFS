function [acc_rf,Recall_rf,Precision_rf,fmeasure_rf,acc_dt,Recall_dt,Precision_dt,fmeasure_dt,acc_knn,Recall_knn,Precision_knn,fmeasure_knn]=Classify(data)
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
[acc_dt,Recall_dt,Precision_dt,fmeasure_dt]  = peformance1( accd ,1 );
% acc_dt=sum(sum(diag(accd)))/test_count;
disp('==========================');
disp(acc_dt);

%-------------Random Forest----------------
rforest=randomforest(TestFeaturs,TrainFeaturs,TrainTargets);
accr=confusionmat(TestTargets,rforest);
[acc_rf,Recall_rf,Precision_rf,fmeasure_rf]  = peformance1( accr ,1 );
% acc_rf=sum(sum(diag(accr)))/test_count;
disp('==========================');
disp(acc_rf);


%--------------KNN----------------
knnModel=fitcknn(TrainFeaturs,TrainTargets,'NumNeighbors',4);
      pred=knnModel.predict(TestFeaturs);
      sk=pred;
      acckn=confusionmat(TestTargets,sk);
      [acc_knn,Recall_knn,Precision_knn,fmeasure_knn]  = peformance1( acckn ,1 );
%       acc_knn=sum(sum(diag(acckn)))/test_count;
      disp('==========================');
      disp(acc_knn);
