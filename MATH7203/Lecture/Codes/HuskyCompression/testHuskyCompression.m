function testHuskyCompression()

  im = imread('SiberianHusky.jpg');
  figure(1)
  image(im)

  ks = [50, 10];

  for idx = 1:length(ks)
    k = ks(idx);
    fprintf('Hit <return> to do SVD for k = %d  ', k)
    input('-->')

    % Close old figures if they exist.  Try/catch used to catch
    % exception thrown if figures doesn't exist.
    try
      close(2)
    catch
    end
    try
      close(3)
    catch
    end

    % Now do SVD and plot results.
    [im1, Sin, Sout] = HuskyCompression(im, k);
    figure(2)
    image(im1)

    figure(3)
    semilogy(Sin)
    hold on
    semilogy(Sout, 'ro')


  end

end
