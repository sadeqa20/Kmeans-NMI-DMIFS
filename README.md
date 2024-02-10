# Kmeans-NMI-DMIFS
Automatic hybrid feature selection by converting continuous to discrete data using combination of Kmeans and NMI along with DMIFS

The proposed hybrid method has two sections. First, a two-stage filter method proposed is called (Kmeans-NMI) so that the features with continuous values are converted to the respective features with discrete values using the concept of Kmeans clustering algorithm. Second the most informative features are selected using the concept of Maximum Relevance Minimum Redundancy (MRMR) with Normalized Mutual Information (NMI). Then, the existing filter Dynamic Mutual Information Feature Selection (DMIFS) is automatically applied to generate the final feature subset. In fact, the hybrid Kmeans-NMI-DMIFS is the combination of a proposed filter method (Kmeans-NMI) and the existing automatic filter feature selection approach (DMIFS). Experiments on high- dimensional medical data sets validate that Kmeans-NMI-DMIFS could automatically determine the number of selected features and simultaneously achieve the best performance in comparison with state-of-the-art methods.

INSTRUCTION:

1) Run mainKmenas.m with matlab
2) line 4-19 Read Data Sets
3) line 20-23 division data & label
4) line 32-50 clustering feature with additive K-means
5) line 53-88 calculate Normalize Mutual Information
6) line 89-93 calculate Dynamic Mutual Information Feature Selection
7) line 97-99 calculate Performance with ACC-Precision-Recall & F1


Performance:
These studies use stratified 10-fold cross validation to randomly divide the original dataset into training and test sets in order to evaluate performance.
Decision Tree (DT): The decision tree classifier is used as the machine learning model to categorize the training data for the dataset. This classifier is employed in this study since the decision tree is also the fundamental tool for feature selection in the feature importance ranking methodology. Second, the suggested method produces a dataset that satisfies the criteria for the decision tree method. It considers the dataset's minimal amount of features and data, the heterogeneity of the data for each feature, and the absence of redundant or duplicate data in the newly created dataset.
Random Forest (RF): RF is a multi-decision tree ensemble technique that uses majority voting and has a several uses in high-dimensional and challenging scenarios for pattern identification. Decision trees have a lot of variance, therefore RF tries to reduce it.
 K-Nearest Neighbors (KNN): When data is not easily separable, KNN is one of the machine learning algorithms that has acceptable classification performance. KNN searches all previous experiences for the K closest experiences (data points), which are referred to as the K nearest neighbors.

