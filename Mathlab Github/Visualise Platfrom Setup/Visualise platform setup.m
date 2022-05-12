
StandardHeight =230*ones(1,7);
CoordinatesLegs = [Leg1,Leg2,Leg3,Leg4,Leg5,Leg6,Leg1];

X1 = CoordinatesLegs(1,:);
Y1 = CoordinatesLegs(2,:);
Z1 = CoordinatesLegs(3,:);
X2 = CoordinatesLegs(4,:);
Y2 = CoordinatesLegs(5,:);
Z2 = StandardHeight;
SizeA=size(CoordinatesLegs);
%  visualising Platform/legs


figure

hold on
axis equal

plot3(X1,Y1,Z1,X2,Y2,Z2);

%plot3(Leg1(1),Leg1(2),Leg1(3),Leg1(4),Leg1(5),Leg1(6));
%for i =1:7
%plot3([X1(i), X2(i)]', [Y1(i), Y2(i)]', [Z1(i), Z2(i)]','m');
view(45,30) 
%end
hold off
axis equal;


    %axis equal;
    title('Platform orientation')
    xlabel('x-range') 
    ylabel('y- range') 
    zlabel('z- range')

