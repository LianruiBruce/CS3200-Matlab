%random_poly.m
function f = random_poly
%RANDOM_POLY Creates a random polynomial and returns that polynomial as a
syms f x
% Define some random coefficients
r = rand(10);
% Create a random polynomial function
f = r(1)*x^r(2) *sin(20*r(3) *x^r(4)) + r(5)*x^r(6) *cos(12*r(7) *x^r(8));
end