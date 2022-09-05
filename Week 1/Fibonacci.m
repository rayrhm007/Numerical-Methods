%Code to call function in command window:
%n = 9; Fibonacci(n)

function F = fibonacci(n)
%Computes Fibonacci numbers using Binet's formula
Phi = (sqrt(5) + 1)/2;
phi = (sqrt(5) - 1)/2;
F = round( (Phi^n - (-phi)^n)/sqrt(5) );    %round is a builtin function of matlab 
                                            %to round up numbers to nearest
                                            %integers
end

