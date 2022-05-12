%coordinates of the legs
legs = CoordinatesLegs;%Results matrix
    
A = [];   %Results matrix
Alljac = [];
minL = [200,200,200,200,200,200];    %min leg length
maxL = [300,300,300,300,300,300];    %max leg length
StHeightPl = StHeight; %standard height of the platform    


SizeX = size(xf); 


for i = 1:SizeX

    
    Pf = [Yawrad(i); Pitchrad(i); Rollrad(i); xf(i); yf(i); StHeightPl + zf(i)]; %position of end-effector
    
% Initializing leg lengths
    LegLengths = zeros(6,1);
%%
% Transformation matrix representing platform orientation wrt base
% Following the convention yaw pitch roll
thz = Pf(3);    thy = Pf(2);    thx = Pf(1);
Rz = [cos(thz)      -sin(thz)   0;
     sin(thz)       cos(thz)    0;
     0              0           1];

Ry = [cos(thy)      0   sin(thy);
     0              1          0;
     -sin(thy)      0   cos(thy)];

Rx = [1     0           0;
     0      cos(thx)    -sin(thx);
     0      sin(thx)    cos(thx)];
Rot = Rz*Ry*Rx;     %Rotation matrix for platform

PlatTran = [Rot, [Pf(4); Pf(5); Pf(6)]; %transformation matrix for platform
            zeros(1,3), 1];
        
      
    % Representing the platform attachement point of leg in coordinate of base
    % platform
 Ab = [];
 As = [];
 n = Rot*[0;0;1]; %Orientatie top platform
     for p = 1:6
    
         PlatPt = PlatTran*[legs(4:6,p);1]; %Baseplate Coordinates;  p represents leg 1 to 6
         r = PlatPt(1:3) - Pf(4:6);
         BasePt = legs(1:3,p); %Baseplate Coordinates;  p represents leg 1 to 6
    
          L = PlatPt(1) - BasePt(1);  M = PlatPt(2) - BasePt(2);  N = PlatPt(3) - BasePt(3) ;
          LegLengths(p) = sqrt(L^2+M^2+N^2);    %Calculating leg lengths for legs 1 to 6
          Ab(:,p) =  r; % [3x6] - The 6 position of the platform joints wrt the platform represented in base frame
          As (:,p) = [L;M;N]/LegLengths(p); %[3x6] - The 6 unit vectors for each strut expressed in base frame
          b = [L;M;N]; % vector of the leg p
          bsize = sqrt(b(1)^2+b(2)^2+b(3)^2);
          nsize = sqrt(n(1)^2+n(2)^2+n(3)^2);
          angle(p) = asind(abs(dot(b,n)/(bsize*nsize))); % angle between vector normal to platform and leg
        
     end  
    
     jac = [As',cross(Ab,As)'];% The  Jacobian Matrix 
     invjac = inv(jac);% The Inverted Jacobian Matrix
     sing = rank(jac) < 6;

  
     ConNr = cond(invjac);
     ConNrTrans = cond(invjac(1:3,1:6));
     ConNrAng = cond(invjac(4:6,1:6));
     %man = sqrt(det(jac*jac'));
     

     
      minT = all(minL(:)<LegLengths(:));   %minT = 6x6 logical for all legs  
      maxT = all(LegLengths(:)<maxL(:));    %maxT = 6x6 logical for all leggs

       if angle > 15 %if angle between legs and platform is smaller then 75 deg
        if (minT == 1 && maxT==1) && sing == 0 %if length legs is within limits        

             A(end+1,:)=[Pf(4),Pf(5),Pf(6),rad2deg(Pf(1)),rad2deg(Pf(2)),rad2deg(Pf(3)),ConNrTrans,ConNrAng,ConNr];
             disp(Pf);
             disp(LegLengths)
                
        end
       end
        if sing ==1
           quit
        end
end
B = [' avg value ',num2str(mean(A(:,7))),'    ', num2str(mean(A(:,8))),'    ', num2str(mean(A(:,9)))];
X = [' max value ',num2str(max(A(:,7))),'    ',num2str(max(A(:,8))),'    ',num2str(max(A(:,9)))];
Y = [' min value ',num2str(min(A(:,7))),'    ',num2str(min(A(:,8))),'    ',num2str(min(A(:,9)))];
disp(B);
disp(X);
disp(Y);