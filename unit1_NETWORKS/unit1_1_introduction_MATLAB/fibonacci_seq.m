%% Calculate the first 10 numbers in the Fibonacci sequence

result = zeros(1,10);
result(1) = 1;
result(2) = 1;

for i=3:10;
  result(i) = result(i-1) + result(i-2);
end

result
