% ładowanie danych
load train.txt;
load test.txt;

% etykiety
train8 = rename_classes(train);
test8  = rename_classes(test);

% eksperyment 1a
rob2_ercf(train8, test8, 0.00025:0.00025:0.002, [3 4]);

% eksperyment 1b
rob2_ercf(train, test, 0.00025:0.00025:0.002, [3 4]);

% eksperyment 2a
for i = 1:5
  rob2_ercf(reduce(train8, [0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1]), test8, 0.00025:0.00025:0.002, [3 4]);
end

% eksperyment 2b
for i = 1:5
  rob2_ercf(reduce(train8, [0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.25]), test8, 0.00025:0.00025:0.002, [3 4]);
end

% eksperyment 2c
for i = 1:5
  rob2_ercf(reduce(train8, [0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5]), test8, 0.00025:0.00025:0.002, [3 4]);
end

% eksperyment 3a
rob2_ercf(train8, reduce(test8, [0.5 1 1 0.5 0.5 1 1 0.5]), 0.00025:0.00025:0.002, [3 4]);

% eksperyment 4
% bez normalizacji
rob2_cls1nn(train, test, [3 4])
% z normalizacją
rob2_cls1nn(normalize_data(train), normalize_data(test), [3 4])



