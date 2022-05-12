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
Rollstep = 20;
Rollmax = 50;
Rolllength= length([Rollmin:Rollstep:Rollmax]);



x =[xmin:xstep:xmax]'*ones(1,ylength*zlength); %[3x9]
y =repmat([ymin:ystep:ymax],xlength,zlength);%[3x9]
z =ones(xlength*ylength,1)*[zmin:zstep:zmax];%[9x3]
x=x(:);
y=y(:);
z=z(:);

Yaw = [Yawmin:Yawstep:Yawmax]'*ones(1,Pitchlength*Rolllength); %[7x49]
Pitch = repmat([Pitchmin:Pitchstep:Pitchmax],Yawlength,Rolllength);%[7x49]
Roll = ones(Yawlength*Pitchlength,1)*[Rollmin:Rollstep:Rollmax];%[49x7]
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

%%errors actuators
l1 =10;
l2= 10; 
l3= 10;
l4= 0;
l5= 0;
l6= 0; %error per actuator in mm
Error = [l1,l2,l3,l4,l5,l6]';    %Define lenght error legs. (small)


%coordinates of the legs
legs = [147.90199458,    -52.30036219,     -95.60163238,    -95.60163238,        -52.30036219,       147.9019946;
        25,               140.5868846,     115.5868846,     -115.5868845,      -140.5868846,        -25;
        0,                0,                  0,                  0,                0,               0;
        87.9831309,      44.68186071,      -132.6649916,   -132.6649916,        44.68186071,          87.9831309;
        102.3912529,      127.3912529,           25,             -25,           -127.3912529,         -102.3912529;
        0,                     0,                 0,              0,                  0,              0];%Results matrix