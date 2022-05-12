XA = A(:,1);
YA = A(:,2);
ZA = A(:,3);
YawA = A(:,4);
PitchA = A(:,5);
RollA = A(:,6);
SizeA=size(A);

    
%% 
figure
title('Workspace')
xlabel('x-range') 
ylabel('y- range') 
zlabel('z- range')
for i = 1:1:SizeA(1)
     
        Qf = [0; 0; 0+10]';
        thz = deg2rad(RollA(i)); 
        thy = deg2rad(PitchA(i)); 
        thx = deg2rad(YawA(i));
  
Rz = [cos(thz)      -sin(thz)   0;
     sin(thz)       cos(thz)    0;
     0              0           1];

Ry = [cos(thy)      0   sin(thy);
     0              1          0;
     -sin(thy)      0   cos(thy)];

Rx = [1     0           0;
     0      cos(thx)    -sin(thx);
     0      sin(thx)    cos(thx)];

        Rot = Rz*Ry*Rx;
        Qfn = Rot*Qf';
 
    hold on
    if Isneg(RollA(i)) == 0 || RollA(i)==0 %positive Roll
    q = quiver3(XA(i),YA(i),ZA(i),Qfn(1),Qfn(2),Qfn(3),(RollA(i)+10)/50,'r');
    elseif Isneg(RollA(i)) == 1                    %negative Roll
    q = quiver3(XA(i),YA(i),ZA(i),-Qfn(1),-Qfn(2),-Qfn(3),(abs(RollA(i))+10)/50,'b');  %if roll is neg. Arrow points down.  
    end
    
    hold off
end   

zlim([100 350])
xlim([-160 160])
ylim([-160 160])
set(gca,'FontSize',20)
axis equal