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
