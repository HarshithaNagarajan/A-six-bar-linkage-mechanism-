clc; clear all; clf;

% Defining the lengths of links
lengthA0B0 = 168; lengthA0A = 20; lengthAB = 100; lengthBB0 = 100; lengthA0A1 = -20;

pointA0 = [0 0];
pointB0 = [lengthA0B0 -20];

%DOF = theta
thetaDegreesArray = 0:10:10*360; %in degrees, accordingly to be used
thetaRadiansArray = thetaDegreesArray*(pi/180.0);

thetaInitial = thetaRadiansArray(1);

pointA = pointA0 + lengthA0A*[cos(thetaInitial) sin(thetaInitial)];
pointA1 = pointA0 + lengthA0A1*[cos(thetaInitial) sin(thetaInitial)];

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


%pointMTrace = zeros(1,2);
%pointMTraceXArray = zeros([1,360]);
%pointMTraceYArray = zeros([1,360]);
%Animation
figure(1)
set(gcf,'Position',[100 100 500 500]) % to have square shaped inner canvas
grid on
for index = 1:length(thetaRadiansArray)
    theta = thetaRadiansArray(index);    
    
    pointA = pointA0 + lengthA0A*[cos(theta) sin(theta)];
    pointA1 = pointA0 + lengthA0A1*[cos(theta) sin(theta)];
    
    % to obtain point B
    [pointB1, pointB2] = CircleCircleIntersection(pointA, lengthAB, pointB0, lengthBB0);
    distBetweenPrevCandB1 = norm(pointB-pointB1);
    distBetweenPrevCandB2 = norm(pointB-pointB2);
    %Choose the solution that is nearest to the previous point B
    if(distBetweenPrevCandB1 < distBetweenPrevCandB2)
        pointB = pointB1;
    else
        pointB = pointB2;
    end  
    % to obtain point C
    lineAB = pointB - pointA;
    pointC = pointA + 70*(lineAB/norm(lineAB));
    
    % to obtain point M
    lineA1C = pointC - pointA1;
    dirA1M = lineA1C/norm(lineA1C);
    pointM = pointA1 + 140*dirA1M;
    
    thetaSliderC = atan2(dirA1M(2), dirA1M(1));
    
    % trace of M
    pointMTraceXArray(index) = pointM(1);
    pointMTraceYArray(index) = pointM(2);
    
    plot([pointA0(1) pointA(1)], [pointA0(2) pointA(2)], 'r','Linewidth',4); %A0A
    hold on;
    plot([pointA0(1) pointA1(1)], [pointA0(2) pointA1(2)], 'r','Linewidth',4); % A0A'
    plot([pointA(1) pointB(1)], [pointA(2) pointB(2)], 'b','Linewidth',4); %AB
    plot([pointB(1) pointB0(1)], [pointB(2) pointB0(2)], 'm','Linewidth',4); %BB0
    plot([pointA1(1) pointM(1)],[pointA1(2) pointM(2)],'g','Linewidth',4); %A'M
    plot(pointMTraceXArray, pointMTraceYArray, 'g-.');
    plot([pointA0(1) pointB0(1)], [pointA0(2) 0], 'k-.'); %A0B0 dotted
    plot([pointB0(1) pointB0(1)-30], [pointB0(2) pointB0(2)], 'k-.'); %A0B0 dotted
    
    SliderShape(20,10,pointC(1),pointC(2),thetaSliderC);
    
    title('Animation of the 6-bar Linkage');
    
    axis([-150 300 -200 200]);
    hold off;
    drawnow();    
    
end