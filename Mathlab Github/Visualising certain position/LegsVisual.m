X1 = A(:,1);
Y1 = A(:,2);
Z1 = A(:,3);
X2 = A(:,4);
Y2 = A(:,5);
Z2 = A(:,6);
SizeA=size(A);
%  visualising Platform/legs
figure

hold on

plot3([X1, X2]', [Y1, Y2]', [Z1, Z2]','b','LineWidth',2.0);


plot3([X1, X2], [Y1, Y2], [Z1, Z2],'b');
fill3([X1], [Y1], [Z1],'r');
fill3([X2], [Y2], [Z2],'g');
alpha(0.3);
axis equal;
hold off

    %axis equal;
    title('Platform orientation')
    xlabel('x-range') 
    ylabel('y- range') 
    zlabel('z- range')

% visualing coordinate systems
        Qf1 = [0+50; 0; 0]';
        Qf2 = [0; 0+50; 0]';
        Qf3 = [0; 0; 0+50]';
        Qf4 = [0+50; 0; 0]';
        Qf5 = [0; 0+50; 0]';
        Qf6 = [0; 0; 0+50]';

        Qfn1 = Rot*Qf1';
        Qfn2 = Rot*Qf2';
        Qfn3 = Rot*Qf3';
 
hold on
q1 = quiver3(0+ xTrans,0+ yTrans,230+ zTrans,Qfn1(1),Qfn1(2),Qfn1(3),'g','linewidth',1);
q2 = quiver3(0+ xTrans,0+ yTrans,230+ zTrans,Qfn2(1),Qfn2(2),Qfn2(3),'b','linewidth',1);
q3 = quiver3(0+ xTrans,0+ yTrans,230+ zTrans,Qfn3(1),Qfn3(2),Qfn3(3),'r','linewidth',1);
q4 = quiver3(0,0,0,Qf4(1),Qf4(2),Qf4(3),'g','linewidth',1);
q5 = quiver3(0,0,0,Qf5(1),Qf5(2),Qf5(3),'b','linewidth',1);
q6 = quiver3(0,0,0,Qf6(1),Qf6(2),Qf6(3),'r','linewidth',1);
set(gca,'FontSize',20)
view(45,30)
hold off
