# define the parameters
param max_acc_risk;
param n > 0;
param r {1 .. n};
param covariance {1 .. n, 1 .. n};

# define the variables
var x {1 .. n} >= 0;

# define the objective function
maximize Portfolio_return: sum {i in 1 .. n} r[i]*x[i];

# define the constraints 
subject to maximum_acceptable_risk: sum {i in 1 .. n, j in 1 .. n} covariance[i,j]*x[i]*x[j] <= max_acc_risk;
subject to percentage: sum {i in 1 .. n} x[i] = 1;