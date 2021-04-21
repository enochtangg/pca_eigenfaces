function [psi , A, eigenfaces, V, D] = pca(T)
    % Calculate mean face image
    psi = mean(T,2);

    % Calulcate the deviation of each image from mean
    A = [];  
    for i = 1 : size(T,2)
        temp = double(T(:,i)) - psi; 
        A = [A temp];
    end

    % Find covariance matrix, eigenvalues, and eigenvectors
    Cov = A'*A;
    [vv, dd] = eig(Cov);

    % Remove eigenvalues and their eigenvectors that are 0.
    V=[];
    D=[];
    for i = 1 : size(vv,2)
         if( dd(i,i) > 1e-4 )
             V = [V vv(:,i)];
             D = [D dd(i,i)];
         end
    end

    % Sort eigenvectors and eigenvalues in ascending order
    V = fliplr(V);
    D = fliplr(D);

    % Normalization of eigenvectors
    eigenfaces = A * V; % Transform vectors back to face space

    % show eigenfaces;
    eigenfacesGrid = reshape(eigenfaces,[192,size(eigenfaces, 2)*168]);
    imshow(eigenfacesGrid);
    
    % Show eigenvalue plot
    icol = size(D,2);
    x = [1:icol];
    plot(x, D, '-ok');
    title('Ordered Eigenvalues');
    xlabel('Index Number') ;
    ylabel('Value of Eigenvalue') ;
end

