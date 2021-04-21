function [classificationFace, euc_dist_min, euc_dist, outputFullPath] = classify(testImage, psi, A, eigenfaces)
    datasetPath = '\cropped_yale\';
    image_names = {'yaleB01_P00A+000E+00', 'yaleB02_P00A+000E+00', 'yaleB03_P00A+000E+00', 'yaleB04_P00A+000E+00', 'yaleB05_P00A+000E+00', 'yaleB06_P00A+000E+00', 'yaleB07_P00A+000E+00', 'yaleB08_P00A+000E+00', 'yaleB09_P00A+000E+00', 'yaleB10_P00A+000E+00', 'yaleB11_P00A+000E+00', 'yaleB12_P00A+000E+00', 'yaleB13_P00A+000E+00', 'yaleB14_P00A+000E+00-Buller_0001', 'yaleB15_P00A+000E+00', 'yaleB16_P00A+000E+00', 'yaleB17_P00A+000E+00', 'yaleB18_P00A+000E+00', 'yaleB19_P00A+000E+00', 'yaleB20_P00A+000E+00'};
    imageData = imread(testImage);
    imshow(imageData)

    weightingsOfFaces = [];
    for i = 1 : size(eigenfaces,2)
        temp = eigenfaces'*A(:,i); % Projection of centered images into facespace
        weightingsOfFaces = [weightingsOfFaces temp]; 
    end
    
    % Extracting the PCA features from test image
    inputImage = imread(testImage);
    temp = inputImage(:,:,1);
    [irow, icol] = size(temp);
    InImage = reshape(temp,irow*icol,1);
    difference = double(InImage) - psi;
    weightingOfTestImage = eigenfaces'*difference;

    euc_dist = [];
    for i = 1 : size(weightingsOfFaces,2)
        q = weightingsOfFaces(:,i);
        temp = norm(weightingOfTestImage-q);
        euc_dist = [euc_dist temp];
    end
    [euc_dist_min , Recognized_index] = min(euc_dist);
    outputFullPath = append(datasetPath, image_names{Recognized_index}, '.pgm');
    classificationFace = imread(outputFullPath);
    imshow([imageData classificationFace])
end

