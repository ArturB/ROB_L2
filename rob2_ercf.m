function base_ercf = rob2_ercf(train, test, parzenw = [0.001], fs = 2:8 )
% Wykonuje eksperymenty wymagane w lab. 2. 
% Wyznacza błąd klasyfikatora, dla estymacji pdf wszystkimi trzema metodami
% train - zbiór uczący
% test - zbiór testowy
% parzenw - wektor wierszowy z listą wartości szerokości okna Parzena. Wykonywany jest osobny eksperyment dla każdej podanej szerokości. 
% fs - wektor z numerami cech używanych przez klasyfikator
% Prawdopodobieństwa apriori klasyfikatora Bayesa wyznaczane są na podstawie zliczenia częstości występowania klas w zbiorze testowym

  train = delete_extremes(train,0.0001);

  pdfindep_para = para_indep(train(:,[1 fs]));
  pdfmulti_para = para_multi(train(:,[1 fs]));
  labels = pdfindep_para.labels;

  cfs = zeros(rows(test),rows(labels));
    for j = 1:rows(labels)
      cfs(:,j) = test(:,1) == labels(j);
    end
  apriori = mean(cfs);
  
  base_ercf = zeros(2,2 + columns(parzenw));
  base_ercf(1,1) = mean(bayescls(test(:,fs), @pdf_indep, pdfindep_para, apriori) != test(:,1));
  base_ercf(1,2) = mean(bayescls(test(:,fs), @pdf_multi, pdfmulti_para, apriori) != test(:,1));
  for i = 1:columns(parzenw)
    pdfparzen_para = para_parzen(train(:,[1 fs]), parzenw(i)); 
    base_ercf(1,2+i) = mean(bayescls(test(:,fs), @pdf_parzen, pdfparzen_para, apriori) != test(:,1));
  end
  
  base_ercf(2,:) = base_ercf(1,:) .* rows(test);
  base_ercf(1,:) = 100 * base_ercf(1,:);
  
  printf("Card traits chosen to use in classifier: ");
  printf("%i ", fs); printf("\n");
  printf("Apriori probabilities vector: ");
  printf("%i ", apriori); printf("\n");
  printf("Calculating Bayes classifier error rates...\n");
  printf("   - with pdf_indep: ercf = %i%%, %i incorrectly classifed points.\n", base_ercf(:,1) );
  printf("   - with pdf_multi: ercf = %i%%, %i incorrectly classifed points.\n", base_ercf(:,2) );
  for i = 1:columns(parzenw)
    printf("   - with pdf_parzen, parzenw = %i: ercf = %i%%, %i incorrectly classifed points.\n", parzenw(i), base_ercf(:,2+i) );
  end
  
  printf("All done!\n");
  
end