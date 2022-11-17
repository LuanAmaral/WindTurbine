T = readtable("wind_data_AnNinhDong.xlsx", "Range","A1:B500");  % skips the first three rows of date

data_series1 = timeseries(T.Vavg80_m_s_);

data_series2= timeseries(T.Vavg80_m_s_, T.Date_Time);

% Convert to timetable
T.Date_Time = datetime(T.Date_Time, 'InputFormat', 'dd/MM/yyyy HH:mm');
T = table2timetable(T);

% Create time vector (15 min duration)
t = T.Date_Time(1);
startTime = datetime(t.Year,t.Month,t.Day,t.Hour,t.Minute,t.Second);
time = (startTime:minutes(10):T.Date_Time(end));

% Resampling%T = retime(T,time,'linear');

timest = datestr(time);
%data_series2= timeseries(T.Vavg80_m_s_, timest);



% t0=T.Date_Time(1);
% tf=T.Date_Time(end);
% 
% dt=diff(t0)
% t = t0:dt:tf;



