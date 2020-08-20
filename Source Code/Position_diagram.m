clc; clear all; clf;

% Defining the lengths of links
lengthA0B0 = 168; lengthA0A = 20; lengthAB = 100; lengthBB0 = 100; lengthA0A1 = -40;

pointA0 = [0 0];
pointB0 = [lengthA0B0 -20];

theta = 30;
thetaRadians = theta*pi/180.0; 

pointA = pointA0 + lengthA0A*[cos(thetaRadians) sin(thetaRadians)];
pointA1 = pointA0 + lengthA0A1*[cos(thetaRadians) sin(thetaRadians)];

% to obtain point B
[pointB1, pointB2] = CircleCircleIntersection(pointA, lengthAB, pointB0, lengthBB0);

%choose one of the solutions as the branch/configuration (elbow up/elbow down)
pointB = pointB1;

% to obtain point C
lineAB = pointB - pointA;
pointC = pointA + 70*(lineAB/norm(lineAB));

% to obtain point M
lineA1C = pointC - pointA1;
dirA1M = lineA1C/norm(lineA1C);
pointM = pointA1 + 140*dirA1M;

% plot the figure - POSITION DIAGRAM
plot([pointA0(1) pointA(1)], [pointA0(2) pointA(2)], 'r-o'); %A0A
hold on;
plot([pointA0(1) pointA1(1)], [pointA0(2) pointA1(2)], 'r-o'); % A0A'
plot([pointA(1) pointB(1)], [pointA(2) pointB(2)], 'b-o'); %AB
plot([pointB(1) pointB0(1)], [pointB(2) pointB0(2)], 'm-o'); %BB0
plot([pointA1(1) pointM(1)],[pointA1(2) pointM(2)],'g-o'); %A'M
plot([pointA0(1) pointB0(1)], [pointA0(2) 0], 'k-.'); %A0B0 dotted
axis([-(lengthA0B0-50) (lengthA0B0+50) -(lengthA0B0-50) (lengthA0B0+50)]);
hold off;

