function new_data = feature_clustering( X_data, clus )
% Summary: 
%    This function discretizes each feature of a given dataset in an
%    equal-width manner
% Inputs:
%    X_data: n x d matrix X, with categorical values for n examples and d features
%    bins: the number of categories
for fnum = 1:size(X_data,2)
    if length(unique(X_data(:,fnum)))<=clus
        [~,~,new_data(:,fnum)] = unique(X_data(:,fnum)); % To have as many categories as the alphabet
    else
        feat = X_data(:,fnum);
        minval = min(feat);
        width = abs(max(feat)-min(feat))/clus;
        
        %create boundaries for equal width
        boundaryend=0;
        for n=1:clus
            boundaryend(n) = minval + n*width;
        end
        boundaryend(clus) = boundaryend(clus) + 1; 
        
        
        
        lastboundaryend = minval;
        newfeature=0;
        for n=1:clus
            indices = find( feat>=lastboundaryend & feat<boundaryend(n) );
            newfeature(indices) = n;
            lastboundaryend = boundaryend(n);
        end
        
         [~,~,new_data(:,fnum)] = unique(newfeature); % To have as many categories as the alphabet
        
    end
end
