%force on end effector
mass = 1; %mass on platform
fext = [0,(9.81+7.1)*mass,4*mass]'; %externe forces on top platform
Next = [0,0,0]'; % Moments on top platform
fact = zeros(1,6)';
MaxActF = 800; %max Force actuator





%coordinate creation
xmin = -150;
xmax = 150;
xstep = 25;
xlength= length([xmin:xstep:xmax]);

ymin = -150;
ymax = 150;
ystep = 25;
ylength= length([ymin:ystep:ymax]);

zmin = -100;
zmax =100;
zstep = 25;
zlength= length([zmin:zstep:zmax]);

Yawmin = -50;
Yawstep = 10;
Yawmax = 50;
Yawlength= length([Yawmin:Yawstep:Yawmax]);

Pitchmin = -50;
Pitchstep = 10;
Pitchmax = 50;
Pitchlength= length([Pitchmin:Pitchstep:Pitchmax]);

Rollmin = -50;
Rollstep = 10;
Rollmax = 50;
Rolllength= length([Rollmin:Rollstep:Rollmax]);



x =[xmin:xstep:xmax]'*ones(1,ylength*zlength);
y =repmat([ymin:ystep:ymax],xlength,zlength);
z =ones(xlength*ylength,1)*[zmin:zstep:zmax];
x=x(:);
y=y(:);
z=z(:);

Yaw = [Yawmin:Yawstep:Yawmax]'*ones(1,Pitchlength*Rolllength);
Pitch = repmat([Pitchmin:Pitchstep:Pitchmax],Yawlength,Rolllength);
Roll = ones(Yawlength*Pitchlength,1)*[Rollmin:Rollstep:Rollmax];
Yaw=Yaw(:);
Pitch=Pitch(:);
Roll=Roll(:);

cartLength = length(x);
angleLength = length(Yaw);

xf = x*ones(1,angleLength);
xf = xf(:);
yf = y*ones(1,angleLength);
yf = yf(:);
zf = z*ones(1,angleLength);
zf = zf(:);
Yawf = ones(cartLength,1)*Yaw';
Yawf=Yawf(:);
Pitchf = ones(cartLength,1)*Pitch';
Pitchf=Pitchf(:);
Rollf = ones(cartLength,1)*Roll';
Rollf=Rollf(:);

Yawrad = deg2rad(Yawf);
Pitchrad = deg2rad(Pitchf);
Rollrad = deg2rad(Rollf);