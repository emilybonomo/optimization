%Steepest Descent Optimization of Rosenbrock function
clear all

%Initialize values 
alpha = 0.001;
x0 = [0.95;0.95];

gradf(1,1) = -2*(1-x0(1,1)) - 400*x0(1,1)*(x0(2,1)-x0(1,1)^2);
gradf(2,1) = 200*(x0(2,1)-x0(1,1)^2);

%One iteration of steepest descent
x1 = x0 - alpha*gradf;

iterations = 1;
err = norm(gradf);
error_plot(iterations) = err;

%Loop to iterate until required error is obtained
while err > 10^-5
	iterations = iterations + 1;
	x0 = x1;
	gradf(1,1) = -2*(1-x0(1,1)) - 400*x0(1,1)*(x0(2,1)-x0(1,1)^2);
    gradf(2,1) = 200*(x0(2,1)-x0(1,1)^2);
    x1 = x0 - alpha*gradf;
    err = norm(gradf);
    error_plot(iterations)=err;
end

%Plot figure
figure(1) 
semilogy(error_plot);
xlabel('Iterations');
ylabel('Gradient');
title('Convergence of Gradient');
legend('Steepest Descent');