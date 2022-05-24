function space
%SPACE
%Simulates space-time voyage to distant galaxy.
%Uses Minkowski geometry.
%Enter speed, distance and name of astronaut.
%Calling format: space   

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

format compact

delay=1000;%1000 for SE,8000 for MacII
disp(' ')
v=input('Give the speed: ');
d=input('     the distance: ');
name=input('     name of astronaut: ','s');
disp(' ');
disp('Give nationality of astronaut')
disp(' ');
disp('English(E),French(F),German(G)')
nationality=input('Spanish(S),Turkish(T),Welsh(W): ','s'); 

disp(' ')
t1=(1/5)*(d/v);t2=(1/5)*sqrt((d/v)^2-d^2);
times=[0 0];

hold off %default graphics window mode
clf; 
axis(axis);axis('off');
hold on %clear screen and hold graphics window  

figure(gcf)
title('Space-Time Voyage')
V=[-3,12,0,13];
axis(V);
axis('off'); 
text(-.4,0,'o')
text(.2,0,'>')
text(11,0,'*')
text(-2.3,5,'earth')
text(-2.3,4,'path')
text(4.7,1,'space-ship')
text(4.7,0,'      path')
text(11,5.6,'star')
text(11,4.6,'path')

pause(2)

disp('    E-time    S-time')
for k = 1:delay;end
for k = 1:delay;end

for i=1:5
 text(-.4,i,'o','erasemode','xor')
 text(2*i,i+.1,'>','erasemode','xor')
 text(11-(.12*i),i,'*','erasemode','xor')
 times=i*[t1 t2];
 disp(times)
 pause(2)  %could use drawnow
 for k = 1:delay;end
 for k = 1:delay;end
end

for i=6:10
 text(-.4,i,'o','erasemode','xor')
 text(20-2*i,i,'<','erasemode','xor')
 text(9.7+(.12*i),i,'*','erasemode','xor')
 %text(10.40,i,'*')
 times=i*[t1 t2];
 disp(times)
 pause(2)
 for k = 1:delay;end
 for k = 1:delay;end
end

i=10;

if nationality=='E'
 M=['Welcome home ' name '!'];
end
if nationality=='e'
 M=['Welcome home ' name '!'];
end

if nationality=='F'
 M=['Bien venu ' name '!'];
end
if nationality=='f'
 M=['Bien venu ' name '!'];
end

if nationality=='G'
 M=['Wilkommen Heimat ' name '!'];
end
if nationality=='g'
 M=['Wilkommen Heimat ' name '!'];
end

if nationality=='S'
 M=['Bienvenido ' name '!'];
end
if nationality=='s'
 M=['Bienvenido ' name '!'];
end

if nationality=='T'
 M=['Hosh geldiniz ' name '!'];
end
if nationality=='t'
 M=['Hosh geldiniz ' name '!'];
end

if nationality=='W'
 M=['Croeso adref ' name '!'];
end
if nationality=='w'
 M=['Croeso adref ' name '!'];
end

text(-2,11,M,'erasemode','xor')
disp(' ')
times=i*[t1 t2]
disp(' ')
hold off
format loose
