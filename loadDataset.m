function T = loadDataset()
    faces = [];
    TrainingDatasetPath = '\cropped_yale';
    image_names = {'yaleB01_P00A+000E+00', 'yaleB02_P00A+000E+00', 'yaleB03_P00A+000E+00', 'yaleB04_P00A+000E+00', 'yaleB05_P00A+000E+00', 'yaleB06_P00A+000E+00', 'yaleB07_P00A+000E+00', 'yaleB08_P00A+000E+00', 'yaleB09_P00A+000E+00', 'yaleB10_P00A+000E+00', 'yaleB11_P00A+000E+00', 'yaleB12_P00A+000E+00', 'yaleB13_P00A+000E+00', 'yaleB14_P00A+000E+00', 'yaleB15_P00A+000E+00', 'yaleB16_P00A+000E+00', 'yaleB17_P00A+000E+00', 'yaleB18_P00A+000E+00', 'yaleB19_P00A+000E+00', 'yaleB20_P00A+000E+00'};
    for image_num = 1:length(image_names) 
        image_name = image_names{image_num};
        jpgFilename = append(image_name,'.pgm');
        fullFileName = fullfile(TrainingDatasetPath, jpgFilename);
        if exist(fullFileName, 'file')
            imageData = imread(fullFileName);
            [irow, icol] = size(imageData);
            temp = reshape(imageData,irow*icol,1); % Reshaping 2D images into 1D image vectors
            faces = [faces temp];
        else
            warningMessage = sprintf('Warning: image file does not exist:\n%s', fullFileName);
            uiwait(warndlg(warningMessage));
        end
        imshow(imageData);
    end
    T = faces;
end

