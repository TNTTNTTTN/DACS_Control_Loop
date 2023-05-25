% DACS parameters
% unit converters
r2d = 180/pi;
d2r = pi/180;

% Mass parameters
g = 9.52; % Gravity @100km high [m/s^2]
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
Dmax = 5415.1; % Max divert thrust [N]
Amax = 362.97; % Max attitude thrust [N]

% Initial condition
phi = 0; % degree
theta = 30; % degree
psi = 25; % degree
UVWinit = [1000; 0; 0]; % Initial velocity of Missile [m/s;m/s;m/s]
PQRinit = [0; 0; 0]; % Initial anglar rate of Missile [rad/s;rad/s;rad/s]
POSinit = [0; 0; 0]; % Initial Position of Missile [m;m;m];
Quatinit= Euler2Quat([phi;theta;psi].*d2r); % Initial Attitude of Missile

% Gain for Quaternion PD controller
Kp = 600;
Kd = 400;

% Gain for Quaternion & angular velocity P2 controller
Kp1 = 600;
Kp2 = 150;

% Gain for SMC
K1 = -6;
K2 = 200;

% Gain for PPNG
N = 5;

% Gain for TPNG
Nt = 5;
% Gain for PG
Kr = 5;

% Target Initial parameter
LoS = Euler2Quat([0;30;10]*d2r);
Tpos = Quatmul(Quatmul(LoS,[1;0;0]),Quatinv(LoS));
Tdist = 15000;
TPosition = Tdist*[Tpos(2);Tpos(3);-Tpos(4)]; % Initial Position of Target [m;m;m]
Theading = Euler2Quat([0;-30;180].*d2r); % Heading angle of Target
Tspeed = 2500;
