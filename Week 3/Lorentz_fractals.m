clc; clear all;

% Parameters
r = 28; sigma = 10; beta = 8/3; 

% The analytical solutions from lorentz eq
x1 = 0; y1 = 0; z1 = 0;
x2 = sqrt(beta*(r - 1)); y2 = sqrt(beta*(r - 1)); z2 = r - 1;
x3 = -sqrt(beta*(r - 1)); y3 = -sqrt(beta*(r - 1)); z3 = r - 1;

RelTol = 1.e-06; AbsTol = 1.e-08;

% Number of points in x and z direction of GRID
nx = 500; 
nz = 500;

% create grid
xmin = -40; xmax = 40; zmin = -40; zmax = 40;
x_grid = linspace(xmin, xmax, nx); 
z_grid = linspace(zmin, zmax, nz);
[X, Z] = meshgrid(x_grid, z_grid);

% THE ALGORITHM
% Write Newton's method using EVERY grid point as the initial condition
% Perform enough iterations that EVERY initial condition converges to a root 
% Save the x-values of the converged roots in the matrix X
% To pass the assessment, every pixel in the figure must be correctly colored

%!!!!!!!!! Set initial value y = 3*sqrt(2) for all values (x,z) on the grid !!!!!!!!!!


for i = 1:nx
    for j = 1:nz
        
        x = X(i, j); 
        z = Z(i, j);
        y = 3*sqrt(2); 
        error = inf;
        
        while error > max(RelTol*max(abs([x,y,z])),AbsTol)
            
            J = [-sigma, sigma, 0;
                r-z, -1, -x;
                y, x, -beta];
            
            rhs = -[sigma*(y - x);
                x*(r - z) - y;
                x*y - beta*z];
            
            delta_xyz = J\rhs;
            x = x + delta_xyz(1);
            y = y + delta_xyz(2);
            z = z + delta_xyz(3);
            
            error = max(abs( delta_xyz ));
        end
        
        X(i, j) = x; 
        Z(i, j) = z;
    end
 end
    
% epsilon for approximation
eps = 1.e-03;

% at root convergence matrix will contain 1 else will contain a 0
X1 = abs(X - x1) < eps; 
X2 = abs(X - x2) < eps; 
X3 = abs(X - x3) < eps;
X4 = ~(X1 + X2 + X3);

% our figure
figure; 
map = [1 0 0; 0 1 0; 0 0 1; 0 0 0]; colormap(map); %[red; green; blue; black]
% color coding pixels
X = (X1 + 2*X2 + 3*X3 + 4*X4);

image([xmin xmax], [zmin zmax], X); set(gca, 'YDir', 'normal');
xlabel('$x$', 'Interpreter', 'latex', 'FontSize',14);
ylabel('$z$', 'Interpreter', 'latex', 'FontSize',14);
title('Fractal from the Lorenz Equations', 'Interpreter', 'latex','FontSize', 16)  