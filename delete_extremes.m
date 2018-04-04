function data = delete_extremes(ts, sig_thr)
% Znajduje i usuwa w zbiorze danych obserwacje odstające.
% Obliczenia wykonywane są w każdej klasie z osobna. 
% ts - macierz ze zbiorem danych; po wierszu na punkt
% sig_thr - próg gęstości prawdopodobieństwa, poniżej której punkt uznajemy za odstający
% Za obserwację odstającą uznaje się punkt, którego estymowana metodą 
%   wielowymiarowego rozkładu normalnego gęstość prawdopodobieństwa wynosi mniej niż sig_thr
% data - dane z usuniętymi obserwacjami odstającymi
% informacje o usuniętych punktach są wypisywane na standardowe wyjście. 

  printf("Searching for outliers in data...\n");
  
  data = ts;
  para = para_multi(ts);
  pdf = pdf_multi(ts(:,2:end),para);
  wyb = zeros(rows(pdf),1);
  for i = 1:rows(wyb)
    wyb(i) = pdf(i,ts(i,1));
  end
  
  printf("   - deleted point: %i, with pdf = %i \n", [find(wyb < sig_thr) wyb(wyb < sig_thr)]' );
  printf("All outliers deleted!\n\n");
  
  data = ts(wyb >= sig_thr,:);
  
end
