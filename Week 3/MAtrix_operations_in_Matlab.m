% Solution to a system of linear eq:

A = [-3, 2, -1;
     6, -6, 7;
     3, -4, 4];
B = [-1; -7; -6];
X = A\B     %Backslash operator

% Least squares problem using backslash
A = [1, 1; 1, 2; 1, 3];
B = [1; 3; 2];
X = A\B

% LU decomposition using builtin func (for changing right hand side problems)
A = [-3, 2, -1;
     6, -6, 7;
     3, -4, 4];
[L, U] = lu(A);
X = L\(U\A)

% Eigenvalues & eigenvectors AX = ΛX
A = [0, 1; 1, 0];
lambda = eig(A)
[V, D] = eig(A) %D contains eigenvalues on diagonals

% Define matrix A again (another problem)
A = [-5, 6; 5, -4];
[V, D] = eig(A)

% Find eigenvalues, lambda1 < lambda2
lambda1 = D(1, 1)
lambda2 = D(2, 2)

% Find eigenvectors associated with lambda1 and lambda2
V1 = V(:, 1)
V2 = V(:, 2)

% Normalize eigenvectors so that their second component is one
v1 = [V1(1,1)/V1(2,1); 1]
v2 = [V2(1,1)/V2(2,1); 1]


     