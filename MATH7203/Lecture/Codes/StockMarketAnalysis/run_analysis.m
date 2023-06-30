function run_analysis()
  
  [A, Ds, Vs] = analyze_stocks()
  squish_data_matrix(A, Ds, Vs)
  
end
