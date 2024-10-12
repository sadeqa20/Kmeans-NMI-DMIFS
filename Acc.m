function final=Acc(data);

for i=1:10
    [acc_rf(i),Recall_rf(i),Precision_rf(i),fmeasure_rf(i),acc_dt(i),Recall_dt(i),Precision_dt(i),fmeasure_dt(i),acc_knn(i),Recall_knn(i),Precision_knn(i),fmeasure_knn(i)]=Classify(data);
end

a_acc_dt=mean(acc_dt);a_acc_knn=mean(acc_knn);a_acc_rf=mean(acc_rf);
a_Precision_dt=mean(Precision_dt);a_Precision_knn=mean(Precision_knn);a_Precision_rf=mean(Precision_rf);
a_Recall_dt=mean(Recall_dt);a_Recall_knn=mean(Recall_knn);a_Recall_rf=mean(Recall_rf);
a_fmeasure_dt=mean(fmeasure_dt);a_fmeasure_knn=mean(fmeasure_knn);a_fmeasure_rf=mean(fmeasure_rf);
a_final={[(length(data(1,:))-1)],[a_acc_dt],[a_acc_knn],[a_acc_rf];[(length(data(1,:))-1)],[a_Precision_dt],[a_Precision_knn],[a_Precision_rf];...
      [(length(data(1,:))-1)],[a_Recall_dt],[a_Recall_knn],[a_Recall_rf];[(length(data(1,:))-1)],[a_fmeasure_dt],[a_fmeasure_knn],[a_fmeasure_rf]};
   final=cell2mat(a_final);   
%    disp(KOL_a4);
