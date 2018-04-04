function pdf = pdf_indep(pts, para)
% Liczy funkcj� g�sto�ci prawdopodobie�stwa przy za�o�eniu, �e cechy s� niezale�ne
% pts zawiera punkty, dla kt�rych liczy si� f-cj� g�sto�ci (punkt = wiersz)
% para - struktura zawieraj�ca parametry:
%	para.mu - warto�ci �rednie cech (wiersz na klas�)
%	para.sig - odchylenia standardowe cech (wiersz na klas�)
% pdf - macierz g�sto�ci prawdopodobie�stwa
%	liczba wierszy = liczba pr�bek w pts
%	liczba kolumn = liczba klas

  pdf = zeros(rows(pts),rows(para.labels));
  for i = 1:rows(para.labels)
    vals = normpdf((pts .- para.mu(i,:)) ./ para.sig(i,:)) ./ para.sig(i,:);
    pdf(:,i) = prod(vals');
  endfor

end
