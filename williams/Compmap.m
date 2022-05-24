function compmap(P,Q)
%COMPMAP 
%Illustrates composite mappings in R2.
%A and B are 2x2 matrices that define transformations. 
%compmap gives comp transf, images and vertices 
%of unit square for mappings def by A and A*B. 
%Calling format: compmap(A,B)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

hold off;
clf; 
axis(axis);axis('off');
hold on  %clear screen and hold graphics window
subplot(111); %full graphics window
title('composite mapping')
A1=[0 1 1 0 0]; %x values
A2=[0 0 1 1 0]; %y values
M=[A1;A2];

N1=P*M;
N2=Q*N1;

B1=N1(1,:);B2=N1(2,:);
C1=N2(1,:);C2=N2(2,:);

D1=[A1 B1 C1 A2 B2 C2];
X1=min(D1); X2=max(D1);Y1=min(D1);Y2=max(D1);
scale=abs(X2-X1)/10;
V=([X1-scale X2+scale Y1-scale Y2+scale]);
axis('square'); 
axis(V);
xaxisx=[X1-scale X2+scale]; xaxisy=[0 0];
yaxisx=[0 0]; yaxisy=[Y1-scale Y2+scale];
plot(xaxisx,xaxisy,':');
hold on;
plot(yaxisx,yaxisy,':');
plot(A1,A2);
text(A1(2)+scale/20,A2(2)-scale/3,'P');
text(A1(3)+scale/20,A2(3),'Q'); 
text(A1(4)-scale/4,A2(4),'R');
plot(B1,B2);
text(B1(2),B2(2),'P*');
text(B1(3),B2(3),'Q*'); 
text(B1(4),B2(4),'R*');
plot(C1,C2);
text(C1(2),C2(2),'P#');
text(C1(3),C2(3),'Q#'); 
text(C1(4),C2(4),'R#');
hold off;
imageP=[B1(2) B2(2)];
imageQ=[B1(3) B2(3)];
imageR=[B1(4) B2(4)];
imagePP=[C1(2) C2(2)];
imageQQ=[C1(3) C2(3)];
imageRR=[C1(4) C2(4)];

disp(' ')
disp('composite transformation =');
disp(Q*P);

disp('P*=');
disp(imageP);
disp('Q*=');
disp(imageQ);
disp('R*=');
disp(imageR);
disp('P#=');
disp(imagePP);
disp('Q#=');
disp(imageQQ);
disp('R#=');
disp(imageRR);

figure(gcf)






