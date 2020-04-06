set NUM ordered; # candidate number

param GRE {NUM}; # GRE Score
param TOEFL {NUM}; # TOEFL Score
param Univ {NUM}; # University Rating
param SOP {NUM}; # Statement of Purpose Strength
param LOR {NUM}; # Letter of Recommend. Strength
param CGPA {NUM}; # Undergraduate GPA
param Res {NUM}; # Research Experience
param Chance {NUM}; # Chance of Admission

# import the data set
data Graduate_Admissions.dat;

# define the rest variables
var x {NUM};

var b0;
var b1;
var b2;
var b3;
var b4;
var b5;
var b6;
var b7;

var k1 binary;
var k2 binary;
var k3 binary;
var k4 binary;
var k5 binary;
var k6 binary;
var k7 binary;

param k = 0;
param M = 100;

# define the objective function
minimize error: sum {i in NUM} x[i];

# define the constraints
subject to constr1 {i in NUM}: x[i] >= Chance[i] - (b0 + b1*GRE[i] + b2*TOEFL[i] + b3*Univ[i] + b4*SOP[i] + b5*LOR[i] + b6*CGPA[i] + b7*Res[i]);
subject to constr2 {i in NUM}: x[i] >= (b0 + b1*GRE[i] + b2*TOEFL[i] + b3*Univ[i] + b4*SOP[i] + b5*LOR[i] + b6*CGPA[i] + b7*Res[i]) - Chance[i];

subject to b1g: b1 >= -k1*M;
subject to b2g: b2 >= -k2*M;
subject to b3g: b3 >= -k3*M;
subject to b4g: b4 >= -k4*M;
subject to b5g: b5 >= -k5*M;
subject to b6g: b6 >= -k6*M;
subject to b7g: b7 >= -k7*M;

subject to b1l: b1 <= k1*M;
subject to b2l: b2 <= k2*M;
subject to b3l: b3 <= k3*M;
subject to b4l: b4 <= k4*M;
subject to b5l: b5 <= k5*M;
subject to b6l: b6 <= k6*M;
subject to b7l: b7 <= k7*M;

subject to nonzerosk: k1 + k2 + k3 + k4 + k5 + k6 + k7 <= k;