%Stewart platform design
R = 150; %Radius bottom platform
r = 135; %radius top platform
Alpha = deg2rad(20); %Degrees distance between bottom legs
Beta = deg2rad(20); %Degrees distance between top legs
StHeight = 230;
StandardHeight =StHeight*ones(1,6);
%Design help
k = [1,-1];


%Bottom platform coordinates
Px = [];
Py = [];
Pz = [];
for i = 1:2
    for l = 0:1:2
    Px(end+1) = R*cos(k(i)*Alpha+l*deg2rad(120));
    Py(end+1) = R*sin(k(i)*Alpha+l*deg2rad(120));
    Pz(end+1) = 0;
    end
end
Pco = [Px;Py;Pz];


%top platform coordinates
px = [];
py = [];
pz = [];
for i = 1:2
    for l = 0:1:2
    px(end+1) = r*cos((l)*deg2rad(120)+deg2rad(60)-(k(i)*Beta));
    py(end+1) = r*sin((l)*deg2rad(120)+deg2rad(60)-(k(i)*Beta));
    pz(end+1) = 0;
    end
end

Pco = [Px;Py;Pz];
pco = [px;py;pz];
CoordinatesLegs1 = [Pco;pco];

Leg1 = [Pco(:,1);pco(:,1)];
Leg2 = [Pco(:,5);pco(:,4)];
Leg3 = [Pco(:,2);pco(:,2)];
Leg4 = [Pco(:,6);pco(:,5)];
Leg5 = [Pco(:,3);pco(:,3)];
Leg6 = [Pco(:,4);pco(:,6)];
CoordinatesLegs = [Leg1,Leg2,Leg3,Leg4,Leg5,Leg6];