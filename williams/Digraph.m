function digraph(P)
%DIGRAPH 
%Draws a digraph from its adjacency matrix A.
%Gives shortest distance between any two vertices.
%Calling format: digraph(A)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

hold off %default graphics window mode
clf;
axis(axis);axis('off');
hold on  %clear screen and hold graphics window
subplot(111) %full graphics window

title('Digraph')

%set limits on x & y axes
axis([-1.25 1.25 -1.25 1.25]);
axis('off');

%determine # vertices and plot vertices on unit circle
[n,n]=size(P);
angle=2*pi/n;
%r & s will control scaling necc to put vertex labels in correct positions
for i=1:n,
  s=1;r=1;
   if sin(i*angle)>=0
     s=1.05;end
   if sin(i*angle)<0
     s=1.1;end
   if cos(i*angle)>=0,
     r=1.1;end
   if cos(i*angle)<0,
     r=1.3;end
     text(sin(i*angle),cos(i*angle),'o')
   if i==1,
     text(s*sin(i*angle),r*cos(i*angle),'1')
   end
   if i==2,
     text(s*sin(i*angle),r*cos(i*angle),'2')
   end
   if i==3,
     text(s*sin(i*angle),r*cos(i*angle),'3')
   end
   if i==4,
     text(s*sin(i*angle),r*cos(i*angle),'4')
   end
   if i==5,
     text(s*sin(i*angle),r*cos(i*angle),'5')
   end
   if i==6,
     text(s*sin(i*angle),r*cos(i*angle),'6')
   end
   if i==7,
      text(s*sin(i*angle),r*cos(i*angle),'7')
   end
   if i==8,
     text(s*sin(i*angle),r*cos(i*angle),'8')
   end
   if i==9,
     text(s*sin(i*angle),r*cos(i*angle),'9')
   end
end
hold on
%determine edges and draw them
%draw arrows on nonhoriz & horiz lines
%c & d are parameters for these arrows
%pts x3,y3 3/4 of way along edge are used & 
%pts x4,y4 & x5,y5 perp to edge at these pts 
%& x6,y6 used for arrows
c=1/40;d=1/20;
for j=1:n,
  for k=1:n,
    if P(j,k)>0,
      if j~=k,
         X=[sin(j*angle) sin(k*angle)];
         Y=[cos(j*angle) cos(k*angle)];
         plot(X,Y)
         x3=(1/4)*X(1) + (3/4)*X(2);
         y3=(1/4)*Y(1) + (3/4)*Y(2);
         if abs(Y(1)-Y(2))>.005;m=(X(2)-X(1))/(Y(1)-Y(2));
           x4=x3+c;y4=y3+m*(x4-x3);
           x5=x3-c;y5=y3+m*(x5-x3);
           x6=(3/16)*X(1) + (13/16)*X(2);
           y6=(3/16)*Y(1) + (13/16)*Y(2);
           X1=[x4 x6 x5];X2=[x4 x5];
           Y1=[y4 y6 y5];Y2=[y4 y5];
           plot(X1,Y1)
           plot(X2,Y2)
         end
         if abs(Y(1)-Y(2))<.005;m=.5;
           x4=x3;x5=x3;
           y4=y3+d;y5=y3-d;
           x6=(7/32)*X(1) + (25/32)*X(2);
           y6=(7/32)*Y(1) + (25/32)*Y(2);
           X1=[x4 x6 x5];X2=[x4 x5];
           Y1=[y4 y6 y5];Y2=[y4 y5];
           plot(X1,Y1)
           plot(X2,Y2)
         end
      end
    end
  end
end

hold on

disp(' ')
w = input('Want distances between vertices? y/n: ','s');
disp(' ')

if w~='y'
 figure(gcf)
end
if w=='y'
a='y';
while a == 'y'
   
v1=input('give 1st vertex: ');
v2=input('give 2nd vertex: ');
%Find # of paths
c=1;V=P;
while V(v1,v2)==0,
    V=V*P;
    c=c+1;
    if c==n+1;V(v1,v2)=100;end
end
  if c==n+1;
     V(v1,v2)=0;
     c='    infinity';
  end
  
disp(' ')
distance=c
numberpaths=V(v1,v2)
figure(gcf)
a = input('Again? y/n: ','s');
disp(' ')

end
end

hold off
format loose




