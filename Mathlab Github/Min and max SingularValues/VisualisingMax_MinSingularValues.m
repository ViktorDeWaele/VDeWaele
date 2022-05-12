XA = A(:,1);
YA = A(:,2);
ZA = A(:,3);
RollA = A(:,6);
PitchA = A(:,5);
YawA = A(:,4);
MaxSingTrA = A(:,7);
MinSingTrA = A(:,8);
SizeA=size(A);

XB = B(:,1);
YB = B(:,2);
ZB = B(:,3);
RollB = B(:,6);
PitchB = B(:,5);
YawB = B(:,4);
MaxSingRotB = B(:,7);
MinSingRotB = B(:,8);
SizeB = size(B);


    
%% 
figure
title('Min and Max sing values Translation Jacobian')
xlabel('x-range') 
ylabel('y- range') 
zlabel('z- range')
axis equal;
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
    q = quiver3(XA(i),YA(i),ZA(i),Qfn(1),Qfn(2),Qfn(3),MaxSingTrA(i),'r'); %max values in red
    q = quiver3(XA(i),YA(i),ZA(i),-Qfn(1),-Qfn(2),-Qfn(3),MinSingTrA(i),'b'); %max values in blue
    hold off
end   

%% 
figure
title('Min and Max sing values Rotation Jacobian')
xlabel('x-range') 
ylabel('y- range') 
zlabel('z- range')
axis equal;
for k = 1:1:SizeB(1)
     
        Qf = [0; 0; 0+10]';
        thz = deg2rad(RollB(k)); 
        thy = deg2rad(PitchB(k)); 
        thx = deg2rad(YawB(k));
        MaxscaleRot = 100*MaxSingRotB(k);
        MinscaleRot = 100*MinSingRotB(k);
  
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
    q = quiver3(XB(k),YB(k),ZB(k),MaxscaleRot*Qfn(1),MaxscaleRot*Qfn(2),MaxscaleRot*Qfn(3),0,'r'); %max values in red
    q = quiver3(XB(k),YB(k),ZB(k),-MinscaleRot*Qfn(1),-MinscaleRot*Qfn(2),-(MinscaleRot*Qfn(3)),0,'b'); %max values in blue
    hold off
end