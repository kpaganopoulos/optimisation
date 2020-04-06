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

# define the objective function
minimize error: sum {i in NUM} x[i];

# define the constraints
subject to constr1 {i in NUM}: x[i] >= Chance[i] - (b0 + b1*GRE[i] + b2*TOEFL[i] + b3*Univ[i] + b4*SOP[i] + b5*LOR[i] + b6*CGPA[i] + b7*Res[i]);
subject to constr2 {i in NUM}: x[i] >= (b0 + b1*GRE[i] + b2*TOEFL[i] + b3*Univ[i] + b4*SOP[i] + b5*LOR[i] + b6*CGPA[i] + b7*Res[i]) - Chance[i];