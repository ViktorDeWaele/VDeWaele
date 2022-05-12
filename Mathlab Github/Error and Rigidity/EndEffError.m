      
XA = A(:,1);
YA = A(:,2);
ZA = A(:,3);
RollA = A(:,6);
PitchA = A(:,5);
YawA = A(:,4);
SizeA=size(A);

XB = B(:,1);
YB = B(:,2);
ZB = B(:,3);
RollB = B(:,6);
PitchB = B(:,5);
YawB = B(:,4);
SizeB = size(B);

    
%% 
figure
title('Translational error')
xlabel('x-range') 
ylabel('y- range') 
zlabel('z- range')
axis equal;
for i = 1:1:SizeA(1)
     
        Qf = [0; 0; 0+10]';
        thz = deg2rad(RollA(i)); 
        thy = deg2rad(PitchA(i)); 
        thx = deg2rad(YawA(i));
        TransError = sqrt(B(i,1)^2+B(i,2)^2+B(i,3)^2);
        AngError = sqrt(B(i,4)^2+B(i,5)^2+B(i,6)^2);
        
        
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
    q = quiver3(XA(i),YA(i),ZA(i),Qfn(1),Qfn(2),Qfn(3),TransError/5,'r'); %translational error size represented by red blue arrow
    hold off
 
end    
   
figure
title('Angle Error')
xlabel('x-range') 
ylabel('y- range') 
zlabel('z- range')
axis equal;
for i = 1:1:SizeA(1)
     
        Qf = [0; 0; 0+10]';
        thz = deg2rad(RollA(i)); 
        thy = deg2rad(PitchA(i)); 
        thx = deg2rad(YawA(i));
        TransError = sqrt(B(i,1)^2+B(i,2)^2+B(i,3)^2);
        AngError = sqrt(B(i,4)^2+B(i,5)^2+B(i,6)^2);
        
        
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
    q2 = quiver3(XA(i),YA(i),ZA(i),Qfn(1),Qfn(2),Qfn(3),AngError*20,'b'); %angle error size represented by size blue arrow
    hold off
end    