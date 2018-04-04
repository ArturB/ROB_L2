function rds = reduce(ds, parts)
% Funkcja redukcji liczby pr�bek poszczeg�lnych klas w zbiorze ds
% ds - zbi�r danych do redukcji; pierwsza kolumna zawiera etykiet�
% parts - wierszowy wektor wsp��czynnik�w redukcji dla poszczeg�lnych klas

	labels = unique(ds(:,1));
	if rows(labels) ~= columns(parts)
		error("Liczba klas nie zgadza sie z liczba wsp. redukcji.");
	end

	if max(parts) > 1 || min(parts) < 0
		error("Niewlasciwe wspolczynniki redukcji.");
	end
  
  pds = ds(randperm(rows(ds)),:);
  
  rds = zeros(1,columns(ds));
  for i = 1:columns(parts)
    classRows = pds(pds(:,1) == labels(i),:);
    classNum = round(rows(classRows) * parts(i));
    rds = [rds; classRows(1:classNum,:) ];
  end
  
  rds(1,:) = [];
  
end
