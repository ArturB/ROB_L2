function rnm = rename_classes(ts)
% Zamienia etykiety kart na 8 etykiet zbiorów uczących
% ts - zbiór do edycji: train.txt lub test.txt
% rnm - zbiór ts ze zmienionymi etykietami

  for i=77:152:1824
	    ts(i:i+75,1) += 4;
  end
  rnm = ts;

end 