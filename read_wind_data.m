T = readtable("wind_data_AnNinhDong.xlsx"); 

n_sample = 499;
t_sample = 10*60;

time = 1:t_sample:t_sample*n_sample;

data_series = timeseries(T.Vavg80_m_s_(1:n_sample), time);
