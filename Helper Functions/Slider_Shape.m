function SliderShape(breadth, height, centerX, centerY, theta)

pointLT = [-0.5*breadth;  0.5*height; 1]; pointRT = [0.5*breadth;  0.5*height; 1]; 
pointLB = [-0.5*breadth; -0.5*height; 1]; pointRB = [0.5*breadth; -0.5*height; 1];

dVector = [centerX; centerY];
dX = dVector(1); dY = dVector(2);

T = [cos(theta)  -sin(theta)    dX; 
     sin(theta)   cos(theta)    dY;
     0            0              1];

uPointInFrame2 = [1; 0; 1]; vPointInFrame2 = [0; 1; 1];
uPointInFrame1 = T*uPointInFrame2;
vPointInFrame1 = T*vPointInFrame2;

pointLTInFrame1 = T*pointLT; pointRTInFrame1 = T*pointRT;
pointLBInFrame1 = T*pointLB; pointRBInFrame1 = T*pointRB;

plot([dVector(1) uPointInFrame1(1)], [dVector(2) uPointInFrame1(2)], 'r')
plot([dVector(1) vPointInFrame1(1)], [dVector(2) vPointInFrame1(2)], 'g')
plot([pointLBInFrame1(1) pointLTInFrame1(1) pointRTInFrame1(1) pointRBInFrame1(1) pointLBInFrame1(1)],...
     [pointLBInFrame1(2) pointLTInFrame1(2) pointRTInFrame1(2) pointRBInFrame1(2) pointLBInFrame1(2)], 'y','Linewidth',2);

end








