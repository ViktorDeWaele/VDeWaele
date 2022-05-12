XA = A(:,1);
YA = A(:,2);
ZA = A(:,3);
YawA = A(:,4);
PitchA = A(:,5);
RollA = A(:,6);
ConNrATran = A(:,7);
ConNrAAng = A(:,8);
SizeA=size(A);

    
%% 
figure
title('Workspace Translational Condition nr  ')
xlabel('x-range') 
ylabel('y- range') 
zlabel('z- range')
axis equal;
for i = 1:1:SizeA(1)
        
        myscaleT = log(ConNrATran(i));
     
        Qf = [0; 0; 0+15]';
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
    q = quiver3(XA(i),YA(i),ZA(i),myscaleT*Qfn(1),myscaleT*Qfn(2),myscaleT*Qfn(3),0,'r');    
    hold off
end

figure
title('Workspace Rotational Condition nr ')
xlabel('x-range') 
ylabel('y- range') 
zlabel('z- range')
axis equal;

for i = 1:1:SizeA(1)
    
     myscaleR =log(ConNrAAng(i));
     
        Qf = [0; 0; 0+15]';
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
    q = quiver3(XA(i),YA(i),ZA(i),myscaleR*Qfn(1),myscaleR*Qfn(2),myscaleR*Qfn(3),0,'m');    
    hold off
end
