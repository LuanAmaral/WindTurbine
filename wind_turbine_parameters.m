k = load("coefficients.mat");

kj = 0.212;

l1 = 56; %m
m1 = 4000; %Kg
J1 = kj * m1 * l1^2; 

air_den = 1.225 %air density
mu = 50; %friction

l2 = 47; %m
m2 = 12474; %Kg
J2 = kj * m2 * l1^2; 

Ges = 1; %rad/s 

% MPPT params
lambda_op = 5.68;
beta = 0;
lambda_i_op =  1/(1/(lambda_op + 0.08*beta) - 0.035/(1+beta*beta*beta));
Cp_max = k.k1 *(k.k2/lambda_i_op - k.k3*beta - k.k4*power(beta, k.k5) -k.k6)*exp(-k.k7/lambda_i_op);

K_op = 0.5*air_den*pi*power(l1,5)*Cp_max/power(lambda_op,3);

% review values
J = 100; % kg/m² combined inertia
B = 10; % N*m*s/rad viscous friction


%Data plot params
T = readtable("wind_data_AnNinhDong.xlsx"); 

n_sample = 499;
t_sample = 10*60;

time = 1:t_sample:t_sample*n_sample;

data_series = timeseries(T.Vavg80_m_s_(1:n_sample), time);
