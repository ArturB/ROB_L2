function res = cls1nn(train, x, fs = [3 4])
% prosty klasyfikator najbliższego sąsiedztwa
% train - zbiór treningowy
% x - klasyfikowany wektor
% fs - wektor cech używanych do klasyfikacji
% res - wyznaczona klasa decyzyjna

  dis = train(:,fs) .- x(:,fs);
  dis = dis .* dis;
  dis = sum(dis')';
  
  res = train(find(dis == min(dis)),1);
  
end