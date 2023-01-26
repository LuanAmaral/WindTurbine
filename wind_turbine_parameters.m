k = load("coefficients.mat");

kj = 0.212;


Ges = 1; %rad/s
air_den = 1.225; %air density
mu = 50; %friction

pitch_deg  = 0;
l1 = 56; %m
m1 = 4000; %git 
J1 = kj * m1 * l1^2; 

l2 = 47; %m
m2 = 12474; %Kg
J2 = kj * m2 * l1^2; 


%Data plot params
T = readtable("wind_data_AnNinhDong.xlsx"); 

n_sample = 499;
t_sample = 10*60;
t_sample2 = 10;

time = 1:t_sample:t_sample*n_sample;
time2 = 1:t_sample2:t_sample*n_sample; 

wind_data = T.Vavg80_m_s_(1:n_sample);

data_interp = interp1(time, wind_data, time2,'spline');
data_series = timeseries(data_interp, time2);


%Variables pour TSR
lambda_op = 5.65;
beta = 0;
lambda_i_op =  1/(1/(lambda_op + 0.08*beta) - 0.035/(1+beta*beta*beta));
Cp_max = k.k1 *(k.k2/lambda_i_op - k.k3*beta - k.k4*power(beta, k.k5) -k.k6)*exp(-k.k7/lambda_i_op);

K_op = 0.5*air_den*pi*power(l1,5)*Cp_max/power(lambda_op,3);

%Variables pour HCS
i = 0;
D = 0;
pt_1 = 0;