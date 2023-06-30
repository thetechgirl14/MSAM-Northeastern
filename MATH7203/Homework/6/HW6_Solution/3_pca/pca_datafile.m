function pca_datafile()
    close all

    data = readmatrix('Datafile.csv');
    
    data_mean = mean(data, 1);
    
    centered_data = data - data_mean;
    cov_matrix = cov(centered_data);
    
    [score] = pca(cov_matrix);
    
    object = score(:,1:3);
    figure,
    scatter3(object(:,1), object(:,2), object(:,3));
    title("Hidden Object");
    
    [~,usefulcol] = size(object);
    [totalcol,~] = size(data);

    fprintf("%d dimensions of the data hold useful information and", usefulcol);
    fprintf(" %d are noise \n", totalcol - usefulcol);
    disp("Hidden object is a tennis shoe");
end