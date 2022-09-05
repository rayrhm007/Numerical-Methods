% Compute the Feigenbaum delta
% Store approximate values in the row vector delta for assessment, where length(delta)= num_doublings and 
% delta(2:num_doublings) are computed from the algorithm described in Lectures 21-23.

num_doublings = 11; 
delta = zeros(1, num_doublings); 
delta(1) = 5;
m = [2, 1 + sqrt(5), 0];

% Computation engine, n is orbit number. Each orbit has a stage where
% x = 0.5 at some mu.
for i = 2:num_doublings
    n = 2^i;
    mu = m(2) + (m(2) - m(1))/delta(i - 1);
    
    % Loop to find value of mu through Newton method convergence 
    for j = 1:10
        x0 = 0.5;
        x_p = 0;
        
        % loop computes x(i+1) and x'(i+1) used for guessing next value of mu
        for k = 1:n
            x_p = x0*(1 - x0) + mu*x_p*(1 - 2*x0);
            x0 = mu*x0*(1 - x0);
        end
        
        mu = mu - (x0 - 0.5)/x_p;
    end
    
    m(3) = mu;
    delta(i) = (m(2) - m(1))/(m(3) - m(2));
    m(1) = m(2);
    m(2) = m(3);
end

% Output of results
fprintf(' n\tdelta(n)\n');
for n = 1:num_doublings
    fprintf('%2g %18.15f\n', n, delta(n));
end