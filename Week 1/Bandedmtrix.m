%banded matrix function

function  [A, B, C] = banded_matrices(n)
% Assign A, B and C below.
A = diag((1:n).*ones(1, n))     %Matrix A is a diagonal matrix with 1,2...n along the diagonal

B = diag(ones(1, n-1), 1) + diag(ones(1, n-1), -1)  %Matrix B has ones along the superdiagonal 
                                                    %(one above the diagonal),
                                                    %ones along the subdiagonal 
                                                    %(one below the diagonal) 
                                                    %and zeros everywhere else

C = diag(3*ones(1, n)) + diag(4*ones(1, n-1), 1) + diag(ones(1, n-2), 2)
                                                    %Matrix C has  threes on the diagonal, 
                                                    %fours on the superdiagonal, 
                                                    %ones on two above the diagonal 
                                                    %and zeros everywhere else
end
