clc; clear all;

%% Physical parameters from the system

% Constant values

r = 1.77 / 2;    % Radio of the tank -> https://www.distribuidornacional.com/medidas-y-capacidades-de-tanques-industriales/ 
A = pi*(r.^2);   % Area of the tank
rho = 997;       % Density from water
g = 9.80665;     % Gravity
R = 65360.93438; % Resistance from the valve
h_d = 1.8;       % Desired height

% Proportional gain
K = 1;           % Only positive values

%% Simulation
sim('system.slx');

%% Graphics

% Input flow
figure()
plot(input_flow, 'r', 'LineWidth', 1)
title("Input flow rate $Q_{in}$", 'Interpreter', 'latex')
xlabel("Time $\left[ sec \right]$", 'Interpreter', 'latex')
ylabel("Flow  $\frac{m^{3}}{s}$", 'Interpreter', 'latex')
grid on;

% Error evolution in time
figure()
plot(error, 'r', 'LineWidth', 1)
title("Evolution of error $e_{h}(t)$", 'Interpreter', 'latex')
xlabel("Time $\left[ sec \right]$", 'Interpreter', 'latex')
ylabel("Error  $(m)$", 'Interpreter', 'latex')
grid on;

% Height evolution in time
figure()
plot(height, 'r', 'LineWidth', 1)
title("Height of the tank", 'Interpreter', 'latex')
xlabel("Time $\left[ sec \right]$", 'Interpreter', 'latex')
ylabel("Height  $[m]$", 'Interpreter', 'latex')
grid on;
