% homework18 Solutions

% Given values in homework
timeVector = 140:149;
co2Rate = [15.72 15.53 15.19 16.56 16.21 17.39 17.36 17.42 17.60 17.75];
o2Rate = [15.49 16.16 15.35 15.13 14.20 14.23 14.29 12.74 14.74 13.68];

% Using Simpson_Bechara
co2tot_bechara = Simpson_Bechara(timeVector,co2Rate);
o2tot_bechara = Simpson_Bechara(timeVector,o2Rate);

% Try Azzan
co2tot_azzan = Simpson(timeVector,co2Rate)
o2tot_azzan = Simpson(timeVector,o2Rate)

% Using MATLAB trapz()
co2tot_trapz = trapz(timeVector, co2Rate);
o2tot_trapz = trapz(timeVector, o2Rate);

% Output
fprintf('\n ------------------------- TOTAL CO2 EVOLUTION ---------------------------');
fprintf('\n Total carbon dioxide evolution = %9.7f (evaluated by the trapezoidal rule)',co2tot_trapz);
fprintf('\n Total carbon dioxide evolution = %9.4f (evaluated by the simpson 1/3 rule)\n',co2tot_bechara);
fprintf('\n -------------------------- TOTAL O2 UPTAKE --------------------------');
fprintf('\n Total oxygen uptake = %9.4f (evaluated by the trapezoidal rule)',o2tot_trapz);
fprintf('\n Total oxygen uptake = %9.4f (evaluated by the simpson 1/3 rule)\n\n',o2tot_bechara);