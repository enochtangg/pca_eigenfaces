%{
   Enoch Tang - 20720705
   SYDE 312
   
   Instructions to run:
   You will need to change the testImageNameStart to your local path for 
   yaleB_07_TEST_IMAGE.pgm. Additionally, TrainingDatasetPath and 
   datasetPath needs to be set in loadDataset.m and classify.m respectively.
%}

clc;
clear all;

T = loadDataset();
[psi , A, eigenfaces, V, D] = pca(T);

all_classification_faces = '';
testImage = '';
[classificationFace, euc_dist_min, euc_dist, outputFullPath] = classify(testImage, psi, A, eigenfaces);