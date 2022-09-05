clc; clear all;
k = 0.05;

% Log Spiral
% theta = linspace(-10*pi, 10*pi, 2000);
% 
% x = exp(k.*theta).*cos(theta);
% y = exp(k.*theta).*sin(theta);
% 
% plot(x, y, 'linewidth', 2)
% axis equal
% xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14)
% ylabel('$y$', 'Interpreter', 'latex', 'FontSize', 14)
% title('Logarithmic Spiral','FontSize', 16)

%Leminscate
theta = linspace(-pi/4, pi/4, 1000);
x = cos(theta).*sqrt(2*cos(2*theta));
y = sin(theta).*sqrt(2*cos(2*theta));

plot(x, y, -x, y, 'linewidth', 2)
axis equal
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14)
ylabel('$y$', 'Interpreter', 'latex', 'FontSize', 14)
title('Leminscate','FontSize', 16)