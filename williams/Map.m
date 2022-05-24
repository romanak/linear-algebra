function map(P)
%MAP 
%Illustrates matrix transformation AX for unit square.
%Gives image of unit square and coordinates of vertices.
%Calling format: map(A)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

hold off %default graphics window mode
clf;
axis(axis);axis('off');
hold on  %clear screen and hold graphics window

subplot(111); %full graphics window
title('matrix transformation')
A1=[0 1 1 0 0]; %x values
A2=[0 0 1 1 0];   %y values
M=[A1;A2];

N=P*M;

Q=[0;0]; %special case of affine(P,Q)
for i=1:5,
 S(:,i)=N(:,i)+Q;
end

B1=S(1,:);B2=S(2,:);

C1=[A1 B1 A2 B2];
X1=min(C1); X2=max(C1);
scale=abs(X2-X1)/5;
V=([X1-scale X2+scale X1-scale X2+scale]);
axis('square');
axis(V); 
xaxisx=[X1-scale X2+scale]; xaxisy=[0 0];
yaxisx=[0 0]; yaxisy=[X1-scale X2+scale];
plot(xaxisx,xaxisy,':');
hold on;
shg
plot(yaxisx,yaxisy,':');
plot(A1,A2); 
text(A1(1)-scale/4,A2(1)-scale/3,'0');
text(A1(2)+scale/20,A2(2)-scale/3,'P');
text(A1(3)+scale/20,A2(3),'Q'); 
text(A1(4)-scale/4,A2(4),'R');
plot(B1,B2); 
text(B1(2),B2(2),'P*');
text(B1(3),B2(3),'Q*'); 
text(B1(4),B2(4),'R*');
hold off;
imageP=[B1(2) B2(2)];
imageQ=[B1(3) B2(3)];
imageR=[B1(4) B2(4)];
disp('0*=');
disp('    0.0000    0.0000');
disp('P*=');
disp(imageP);
disp('Q*=');
disp(imageQ);
disp('R*=');
disp(imageR);





