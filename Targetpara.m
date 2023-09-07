% Target Parameter
% Maximum height 400km from ground
mu = 3.986004418*10^(5); % Geocentric gravitational constant [km^3/s^2]
R = 6378.1; % Spherical earth radius [km]
height = 1000; % Maximum height of trajectory [km]
d = 1000; % Target flight distance from ground [km]
etheta = d/R; % Angle between Two point [km]

e = height/(R*cos(pi-etheta/2)+R+height); % Eccentricity
Va = sqrt(mu*(1-e)/(R+height)) * 1000; % Velocity @ maximum height [m/s]

LoS = Euler2Quat([0;0;0]*d2r);
Tpos = Quatmul(Quatmul(LoS,[1;0;0]),Quatinv(LoS));
Tdist = 100000;
TPosition = Tdist*[Tpos(2);Tpos(3);-Tpos(4)]; % Initial Position of Target [m;m;m]