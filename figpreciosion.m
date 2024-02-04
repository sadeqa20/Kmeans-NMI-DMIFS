data=xlsread('precision.xlsx');
y=data;
c = categorical({'Full Data','Kmeans-NMI-DMIFS'});
figure;
subplot(1,3,1); bar(c,data(:,1),'r');
title('DT');
subplot(1,3,2); bar(c,data(:,2));
title('KNN');
subplot(1,3,3); bar(c,data(:,3),'g');
title('RF');

% bar(c,data,'red');
saveas(gcf,'Barchart.png')

