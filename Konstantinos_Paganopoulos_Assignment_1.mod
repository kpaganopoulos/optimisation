# define the variables
var PW1 >= 0;
var PW2 >= 0;
var PW3 >= 0;
var PW4 >= 0;

var PP1 >= 0;
var PP2 >= 0;
var PP3 >= 0;
var PP4 >= 0;

param IW1 = 0;
var IW2 >= 0;
var IW3 >= 0;
var IW4 >= 0;
var IW5 >= 0;

param IP1 = 0;
var IP2 >= 0;
var IP3 >= 0;
var IP4 >= 0;
var IP5 >= 0;

var SW1 = PW1 - IW2;
var SW2 = PW2 + IW2 - IW3;
var SW3 = PW3 + IW3 - IW4;
var SW4 = PW4 + IW4 - IW5;

var SP1 = PP1 - IP2;
var SP2 = PP2 + IP2 - IP3;
var SP3 = PP3 + IP3 - IP4;
var SP4 = PP4 + IP4 - IP5;

# define the objective function
maximize earnings: 0.13 * (SW1 + SW2 + SW3 + SW4) + 0.10 * (SP1 + SP2 + SP3 + SP4);

# define the constraints
subject to steel1: 1.5 * PW1 + 1.0 * PP1 <= 27000;
subject to steel2: 1.5 * PW2 + 1.0 * PP2 <= 27000;
subject to steel3: 1.5 * PW3 + 1.0 * PP3 <= 27000;
subject to steel4: 1.5 * PW4 + 1.0 * PP4 <= 27000;

subject to molding1: 1.0 * PW1 + 1.0 * PP1 <= 21000;
subject to molding2: 1.0 * PW2 + 1.0 * PP2 <= 21000;
subject to molding3: 1.0 * PW3 + 1.0 * PP3 <= 21000;
subject to molding4: 1.0 * PW4 + 1.0 * PP4 <= 21000;

subject to assembly1: 0.3 * PW1 + 0.5 * PP1 <= 9000;
subject to assembly2: 0.3 * PW2 + 0.5 * PP2 <= 9000;
subject to assembly3: 0.3 * PW3 + 0.5 * PP3 <= 9000;
subject to assembly4: 0.3 * PW4 + 0.5 * PP4 <= 9000;

subject to demandW1: SW1 <= 6000;
subject to demandW2: SW2 <= 10000;
subject to demandW3: SW3 <= 12000;
subject to demandW4: SW4 <= 15000;

subject to demandP1: SP1 <= 5000;
subject to demandP2: SP2 <= 8000;
subject to demandP3: SP3 <= 10000;
subject to demandP4: SP4 <= 16000;