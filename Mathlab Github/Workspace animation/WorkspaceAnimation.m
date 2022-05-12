
SizeB=size(B);
%  visualising Platform/legs

for i=1:(size(B,1)/6)-1
   %Figure settings
   
        X1 = B(1+i*6:6+6*i,1);
        Y1 = B(1+i*6:6+6*i,2);
        Z1 = B(1+i*6:6+6*i,3);
        X2 = B(1+i*6:6+6*i,4);
        Y2 = B(1+i*6:6+6*i,5);
        Z2 = B(1+i*6:6+6*i,6);
        
        
        
clf        
hold on 
    title('Workspace Alpha and Beta = 20, z = -100 ,YawPitch30')
    xlabel('x-range') 
    ylabel('y- range') 
    zlabel('z- range')
plot3([X1, X2]', [Y1, Y2]', [Z1, Z2]','b','LineWidth',2.0);
plot3([X1, X2], [Y1, Y2], [Z1, Z2],'b');
fill3([X1], [Y1], [Z1],'r');
fill3([X2], [Y2], [Z2],'g');
alpha(0.7);
axis equal;
view(45,30) 
hold off
xlim([-300 300]);
ylim([-300 300]);
zlim([0 450])
F(i) = getframe(gcf);
drawnow; pause(0.01);
end

video = VideoWriter('WorkspaceAlphaandBeta=20_z=-100_YawPitch30.avi','MPEG-4');
video.FrameRate = 60;
open(video)
writeVideo(video,F);
close(video)
