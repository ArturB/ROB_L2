function pdf = pdf_parzen(pts, para)
% Aproksymuje warto�� g�sto�ci prawdopodobie�stwa z wykorzystaniem okna Parzena
% pts zawiera punkty, dla kt�rych liczy si� f-cj� g�sto�ci (punkt = wiersz)
% para - struktura zawieraj�ca parametry:
%	para.samples - tablica kom�rek zawieraj�ca pr�bki z poszczeg�lnych klas
%	para.parzenw - szeroko�� okna Parzena
% pdf - macierz g�sto�ci prawdopodobie�stwa
%	liczba wierszy = liczba pr�bek w pts
%	liczba kolumn = liczba klas
  
  pdf = zeros(rows(pts),rows(para.labels));
  for k = 1:rows(para.labels)
    hk = para.parzenw / sqrt(rows(para.samples{k}));
    for i = 1:rows(pts)
      comps = normpdf(pts(i,:) .- para.samples{k}, 0, hk);
      pdf(i,k) = mean(prod(comps'));
    endfor
  endfor

end
