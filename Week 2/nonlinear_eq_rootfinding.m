clc; clear all;

%Non linear function (x - e^x) root finding using fzero()
a = 1/2;
fx = @(x, a) x - exp(-a.*x);
x0 = 0; %initial guess for our root

%using our built-in func to find a single root of the non-linear function fx
r = fzero(@(x) fx(x, a), x0)    %@(x) means that fx is a function of x





