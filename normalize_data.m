function dn = normalize_data(ts)
% normalizuje dane, wiersz po wierszu
% ts - dane do normalizacji
% dn - dane znormalizowane

  cts = ts;
  
  para = para_indep(ts);
  filters = ts(:,1) == transpose(para.labels);
  
  for i = 1:rows(para.labels)
    cts(filters(:,i),2:end) = (ts(filters(:,i),2:end) .- para.mu(i,:)) ./ para.sig(i,:); 
  end
  
  dn = cts;
  
end