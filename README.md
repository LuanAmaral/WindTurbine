# MPTT ALGORITHM FOR WIND TURBINE

This directory is the project of the Pôle Projet of Centrale Supelec. The objective of this project is to compare differents MPPT algorithms for wind turbines. 

The following algorithm were tested:

- TSR algorithm
- HCS algorithm
- Adaptative HCS algorithm
- Fuzzy algorithm

## Directory organization
The branch "main" contains all the files of all the algorithms, the wind turbine model and one file comparing all of them. Each algorithm has his own branch where it's possible to make changes or new tests. 

## Run the simulations
Before run the simulations you must execute the **wind_turbine_parameters.m** to load all the turbine constants and the wind data.  