%%  dc_motor_viz.m - Visualize DC Motor RPM data for EE-374 FCS CEP
%%  Import data from Excel
raw_data = xlsread('DC motor data 14.4 V.xlsx');
time = (linspace(0,6.5,65))';
 
%% drop null cells
dc_data = raw_data(1:65, :);
 
%% extract RPM and RPS data into separate columns
rps = dc_data(1:65, 1);
rpm = dc_data(1:65, 2);
 
%% smoothen data with default exponential moving average
rps_avg = smooth(rps);
rpm_avg = smooth(rpm);
 
%% plot original vs smoothened data
figure();
 
% RPS
subplot(1, 2, 1); plot(time,rps); hold();plot(time,rps_avg); 
legend('Original', 'Moving Average'); grid(); 
ylim([0, 30]); title('DC Motor Step Response - RPS'); 
xlabel('Sample (\it{n/arbitrary units})');
ylabel('Disc Speed (\it{\omega/RPS})')
 
% RPM
subplot(1, 2, 2); plot(time,rpm); hold();plot(time,rpm_avg); 
legend('Original', 'Moving Average'); grid(); ylim([0, 17e3])
title('DC Motor Step Response - RPM'); 
xlabel('Sample (\it{n/arbitrary units})');
ylabel('Disc Speed (\it{\omega/RPM})');
