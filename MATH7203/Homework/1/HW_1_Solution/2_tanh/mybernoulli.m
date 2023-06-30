function bn = mybernoulli(n)
  % This returns the nth Bernoulli number.  I only return the
  % first 34 numbers.
    
  % Since most simple algos for computing the Bernoullis have bad
  % time complexity, I will just use a dumb look-up method to return the
  % desired value.  Values above 34 will error out.

  %fprintf('mybernoulli, input = %d\n', n)
    
  if (n > 34)
    error('mybernoulli only supports inputs in range 0 ... 34')
  end
    
  if (n == 0)
    bn = 1;
  elseif (n == 1)
    bn = -1/2;
  elseif (n == 2)
    bn = 1/6;
  elseif (n == 4)
    bn = -1/30;
  elseif (n == 6)
    bn = 1/42;
  elseif (n == 8)
    bn = -1/30;
  elseif (n == 10)
    bn = 5/66;
  elseif (n == 12)
    bn = -691/2730;
  elseif (n == 14)
    bn = 7/6;
  elseif (n == 16)
    bn = -3617/510;
  elseif (n == 18)
    bn = 43867/798;
  elseif (n == 20)
    bn = -174611/330;
  elseif (n == 22)
    bn = 854513/138;
  elseif (n == 24)
    bn = -236364091/2730;
  elseif (n == 26)
    bn = 8553103/6;
  elseif (n == 28)
    bn = -23749461029/870;
  elseif (n == 30)
    bn = 8615841276005/14322;
  elseif (n == 32)
    bn = -7709321041217/510;
  elseif (n == 34)
    bn = 2577687858367/6;
  else
    bn = 0;
  end


end
