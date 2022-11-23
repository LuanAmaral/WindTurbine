k = load("coefficients.mat");

kj = 0.212;

%https://en.wind-turbine-models.com/turbines/2423-acowind-a-63
l1 = 56; %m
m1 = 4000; %Kg
J1 = kj * m1 * l1^2; 
mu = 50; %friction

l2 = 47; %m
m2 = 12474; %Kg
J2 = kj * m2 * l1^2; 


%Data plot params
T = readtable("wind_data_AnNinhDong.xlsx"); 

n_sample = 499;
t_sample = 10*60;

time = 1:t_sample:t_sample*n_sample;

data_series = timeseries(T.Vavg80_m_s_(1:n_sample), time);
