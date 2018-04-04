function ercf = rob2_cls1nn(train, test, fs = [3 4])
% oblicza wsp. błędu dla klasyfikatora 1-NN na zadanym zbiorze testowym
% train - zbiór treningowy
% test - zbiór testowy
% fs - wektor cech używanych do klasyfikacji
% ercf - wsp. błędu klasyfikacji

  res = zeros(rows(test),1);
  for i = 1:rows(test)
    res(i) = test(i,1) != cls1nn(train, test(i,:), fs);
  end
  
  ercf = mean(res);
  
end