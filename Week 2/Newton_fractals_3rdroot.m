%Newton's fractal for cube roots of unity
clc; clear all;

% number of iterations
nit = 40;

% our linear function
f = @(Z) Z.^3 - 1;  %@(z) is a function handle. The variable Z 
fp = @(Z) 3*Z.^2;   %is now associated with these functions

% our roots
r1 = 1;
r2 = -1/2 + 1i*sqrt(3)/2;
r3 = -1/2 - 1i*sqrt(3)/2;

% setting grid parameters the x-i plane
nx = 1000;  %number of points in x-axis
ny = 1000;  %number of points in imaginary-axis
xmin = -2; xmax = 2;    %setting the axis limits to display
ymin = -2; ymax = 2;

% making the actual grid and the x-i points
X = linspace(xmin, xmax, nx);
Y = linspace(ymin, ymax, ny);
[X, Y] = meshgrid(X, Y);    %meshgrid(X, Y) creates a 2D grid of same number of points as X and Y
Z = X + 1i*Y;   %our complex gridpoints used for creating the plane

% Coding the algorithm of newton's fractals
for i = 1:nit
    Z = Z - (f(Z)./fp(Z));
end

% setting the convergence and approximation parameters
eps = 0.001;
Z1 = abs(Z - r1) < eps;   %Z1 is an nx by ny matrix and will have 1 for root convergence. 
                        %0 otherwise (greater than eps) 
Z2 = abs(Z - r2) < eps;   %same for Z2 and Z3
Z3 = abs(Z - r3) < eps; 
Z4 = ~(Z1 + Z2 + Z3);   %Z4 will have a value of 1 at any point where there is no root convergence
                    %(Z1, Z2, Z3 have 0's at no root convergence) and Z4
                    %will have 0's at root convergence (Z1, Z2, Z3 have 1's at root convergence)

  
%setting out plot
figure; %this opens a figure
map = [1 0 0; 0 1 0; 0 0 1; 0 0 0]; %color map for RGB
colormap(map); %[red (100); blue (010); green (001); black (000)]

Z = (Z1 + 2*Z2 + 3*Z3 + 4*Z4);  %Z is a matrix of image points and need to be color coded.  
                                %Points Z1(coded as 1) is colored as red pixel
                                %Points Z2(coded as 2) is colored as green pixel
                                %points Z3(coded as 3) is colored as blue pixel
                                %points Z4(coded as 4) is colored as black pixel
                                
image([xmin xmax], [ymin ymax], Z); %image file function. Takes the Z points to make an image
set(gca,'YDir','normal');   %reverses y axis direction. By default y axis starts -VE 
                            %and becomes +VE going down. This command
                            %reverses that

axis equal; axis tight;
xlabel('$x$', 'Interpreter', 'latex', 'FontSize',14);
ylabel('$y$', 'Interpreter', 'latex', 'FontSize',14);
title('Fractal from $f(z)= z^4 - 1$', 'Interpreter', 'latex','FontSize', 16)


