function svd_image_test()

    close all

    figure(1)
    file = "C:\Users\abhil\OneDrive\Desktop\git clone\MSAM-Northeastern\MATH7203\Homework\4\HW4_Solution\1_svd\side_husky.csv";
    sidehusky = readmatrix(file)/255;
    imshow(sidehusky);
    
    figure(2)
    file2 = "C:\Users\abhil\OneDrive\Desktop\git clone\MSAM-Northeastern\MATH7203\Homework\4\HW4_Solution\1_svd\mondrian_1934.csv";
    mondrian = readmatrix(file2)/255;
    imshow(mondrian);

    figure(3)
    disp("Singular Value Decomposition of Husky Matrix");
    svd_image(sidehusky);
    hold on
    disp("Singular Value Decomposition of Mondrian Matrix");
    svd_image(mondrian);
    legend("Husky", "Mondrian")
    
end

