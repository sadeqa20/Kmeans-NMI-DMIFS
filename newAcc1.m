function Kol=newAcc1(data);

% for i=1:10
    [acc_rf,acc_dt,acc_knn]=Classify1(data);
% end

% a_acc_dt=mean(acc_dt);a_acc_knn=mean(acc_knn);a_acc_rf=mean(acc_rf);
Kol=cat(1,acc_dt,acc_knn,acc_rf);
% a_Precision_dt=mean(Precision_dt);a_Precision_knn=mean(Precision_knn);a_Precision_rf=mean(Precision_rf);
% a_Recall_dt=mean(Recall_dt);a_Recall_knn=mean(Recall_knn);a_Recall_rf=mean(Recall_rf);
% a_fmeasure_dt=mean(fmeasure_dt);a_fmeasure_knn=mean(fmeasure_knn);a_fmeasure_rf=mean(fmeasure_rf);
% 
% a_kol={[(length(data(1,:))-1)],[a_acc_dt],[a_acc_knn],[a_acc_rf];[(length(data(1,:))-1)],[a_Precision_dt],[a_Precision_knn],[a_Precision_dt];...
%       [(length(data(1,:))-1)],[a_Recall_dt],[a_Recall_knn],[a_Recall_rf];[(length(data(1,:))-1)],[a_fmeasure_dt],[a_fmeasure_knn],[a_fmeasure_rf]};
%    Kol=cell2mat(a_kol);
%    
%    disp(KOL_a4);
