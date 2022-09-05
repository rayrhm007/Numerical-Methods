%our linear polynomial function and it's derivative
f = @(z) z.^4 - 1;  
fp = @(z) 4.*z.^3;

%finding the four fourth roots of unity, using matlab built-in func
p = [1 0 0 0 -1];   %Usage: p contains polynnomial eq coefficients starting from highest degree of Z to lowest (Z^0)
r = roots(p);

%Creating our grid space
nx = 1000; 
ny = 1000;
xmin = -2; 
xmax = 2; 
ymin = -2; 
ymax = 2;

x = linspace(xmin,xmax,nx); 
y = linspace(ymin,ymax,ny);
[X,Y] = meshgrid(x,y);
Z = X + 1i*Y;   %all Z points in Z-plane

%number of iterations to find roots in newton's method
nit = 50;

for n = 1:nit
    Z = Z - f(Z)./fp(Z);
end

eps = 0.001;
Z1 = abs(Z - r(1)) < eps; 
Z2 = abs(Z - r(2)) < eps;
Z3 = abs(Z - r(3)) < eps; 
Z4 = abs(Z - r(4)) < eps;
Z5 = ~(Z1+Z2+Z3+Z4);

figure;
map = [1 0 0; 0 1 0; 0 0 1; 1 1 0; 0 0 0]; 
colormap(map); %to color the mp using [red;blue;green;yellow;black]
Z = (Z1 +2*Z2 + 3*Z3 + 4*Z4 + 5*Z5); %empty spaces where no convergence occurs (Z5) is colored black
image([xmin xmax], [ymin ymax], Z); 
set(gca,'YDir','normal');
xlabel('$x$', 'Interpreter', 'latex', 'FontSize',14);
ylabel('$y$', 'Interpreter', 'latex', 'FontSize',14);
title('Fractal from $f(z)= z^4 - 1$', 'Interpreter', 'latex','FontSize', 16)
