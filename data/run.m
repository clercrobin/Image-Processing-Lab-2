%% Exercise 4

clear all;
close all;
clc;

load("./mat/content_lut.mat");
load("./mat/configuration_lut.mat");
load("./mat/subj_scores_DSIS.mat");
load("./mat/obj_metrics.mat");
[rows,N] = size(subj_scores_DSIS);

% Compute the MOS

mos = mean(subj_scores_DSIS, 2);


% Compute the CI
alpha = 0.05;
stds = std(subj_scores_DSIS,0,2);
cis = icdf('T',1-alpha/2, N)*stds/sqrt(N);

figure('name', 'Question 3')
hold on
for i = 1:5
    x = configuration_lut((i-1)*5+1: (i-1)*5+5);
    
    y = mos((i-1)*5+1: (i-1)*5+5);
    err = cis((i-1)*5+1: (i-1)*5+5);
    errorbar(x,y,err)
end
legend('Bunny', 'Cube', 'Dragon', 'Sphere', 'Vase','Location','northwest')
ylabel('MOS') % x-axis label
xlabel('Configuration') % y-axis label
hold off

%% Question 4 Plot the objective scores

objective_plot(p2planeHausdorff_values,configuration_lut,'p2planeHausdorff')
objective_plot(p2planeRMSE_values,configuration_lut,'p2planeRMSE_values')
objective_plot(p2pointHausdorff_values,configuration_lut,'p2pointHausdorff_values')
objective_plot(p2pointRMSE_values,configuration_lut,'p2pointRMSE_values')

%% Exercise 5 Benchmarking

benchmarking(p2planeHausdorff_values,mos, cis,'p2planeHausdorff')
benchmarking(p2planeRMSE_values,mos, cis,'p2planeRMSE_values')
benchmarking(p2pointHausdorff_values,mos, cis,'p2pointHausdorff_values')
benchmarking(p2pointRMSE_values,mos, cis,'p2pointRMSE_values')

%% Exercise 5 fitting

[poly1p2planeHausdorff_values, poly3p2planeHausdorff_values] = multiple_fit(p2planeHausdorff_values,mos);
[poly1p2planeRMSE_values, poly3p2planeRMSE_values] = multiple_fit(p2planeRMSE_values,mos);
[poly1p2pointHausdorff_values, poly3p2pointHausdorff_values] = multiple_fit(p2pointHausdorff_values,mos);
[poly1p2pointRMSE_values, poly3p2pointRMSE_values] = multiple_fit(p2pointRMSE_values,mos);

%% Exrcise 5 comparing 

benchmarking_extended(p2planeHausdorff_values,mos, cis,poly1p2planeHausdorff_values,poly3p2planeHausdorff_values,'p2planeHausdorff')
benchmarking_extended(p2planeRMSE_values,mos, cis,poly1p2planeRMSE_values,poly3p2planeRMSE_values,'p2planeRMSE')
benchmarking_extended(p2pointHausdorff_values,mos, cis,poly1p2pointHausdorff_values,poly3p2pointHausdorff_values,'p2pointHausdorff')
benchmarking_extended(p2pointRMSE_values,mos, cis,poly1p2pointRMSE_values,poly3p2pointRMSE_values,'p2pointRMSE')