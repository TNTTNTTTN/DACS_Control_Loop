%clear all
%clc

% DACS parameters
% unit converters
r2d = 180/pi;
d2r = pi/180;

Controlgain;
Targetpara;

% Mass parameters
g = mu/(R+height)^2 * 1000; % Gravity [m/s^2]
M = 74; % Mass of missile [kg]
lx = 1.825; % Length of body in x axis [m]
ly = 0.09; % Length of body in y axis [m]

% Moment of inertia parameter:define missile as cylindrical shape
Ixx = M*(ly^2)/2; % Roll moment of inertia [kg*m^2]
Iyy = M*(3*ly^2+4*lx^2)/12; % Pitch moment of inertia [kg*m^2]
Izz = M*(3*ly^2+4*lx^2)/12; % Yaw moment of inertia [kg*m^2]
I = [Ixx 0 0;0 Iyy 0; 0 0 Izz]; % Moment of inertia matrix [3X3]

% Thrust parameters
%Dmax = 1451.88 * 5; % Max divert thrust [N]
Dmax = M*9.81*10; % Max divert thrust [N]
Amax = 362.97; % Max attitude thrust [N]

% Initial condition
phi = 0; % degree
theta = 0; % degree
psi = 0; % degree
% UVWinit = [sqrt(mu/(R+height))*1000; 0; 0]; % Initial velocity of Missile [m/s;m/s;m/s]
UVWinit = [2000;0;0];
PQRinit = [0; 0; 0]; % Initial anglar rate of Missile [rad/s;rad/s;rad/s]
POSinit = [0; 0; 0]; % Initial Position of Missile [m;m;m];
Quatinit= Euler2Quat([phi;theta;psi].*d2r); % Initial Attitude of Missile
