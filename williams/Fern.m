function fern(n)
%FERN
%Draws a fractal fern.
%Calling format: fern(n), where n is desired # iterations.
  
%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

disp(' ')
disp('   - To Stop At Any Time -') 
disp('    command period (Mac)')
disp('       Ctrl C (IBM)')
disp(' ')
disp('- press Enter to get picture - ')
disp(' ')
pause

clf;

A=[.86 .03;-.03 .86];E=[0 1.5];
B=[.2 -.25;.21 .23];F=[0 1.5];
C=[-.15 .27;.25 .26];G=[0 .45];
D=[0 0;0 .17];H=[0 0];

%accumulated probabilities
P=[.83 .91 .99 1];

%Plot the points generated by the affine transforms

X=[0 0];Y=[0 0];           % initialize variables
Y1 = zeros(1,n); Y2 = Y1;  % pre-allocate vectors
figure(gcf)

%Ranges of x & y axes
V=[-4 6 -1 12];
axis(V); axis(axis);
hold on

for i=1:n,
  pk=rand;
    if pk<=P(1)
      Y(1) = A(1,1)*X(1)+A(1,2)*X(2)+E(1);
      Y(2) = A(2,1)*X(1)+A(2,2)*X(2)+E(2);
    elseif pk<=P(2)
      Y(1) = B(1,1)*X(1)+B(1,2)*X(2)+F(1);
      Y(2) = B(2,1)*X(1)+B(2,2)*X(2)+F(2); 
    elseif pk<=P(3) 
      Y(1) = C(1,1)*X(1)+C(1,2)*X(2)+G(1);
      Y(2) = C(2,1)*X(1)+C(2,2)*X(2)+G(2);
    elseif pk<=P(4)
      Y(1) = D(1,1)*X(1)+D(1,2)*X(2)+H(1);
      Y(2) = D(2,1)*X(1)+D(2,2)*X(2)+H(2);
    end
  clear X;
  X=Y;
  %save coordinate values for plotting
  Y1(i) = Y(1);
  Y2(i) = Y(2);

  % If you wanted to plot one point at a time
  % and not have the screen flicker, use 'XOR' mode.
  plot(Y(1),Y(2),'.','erasemode','xor');
  drawnow

  clear Y;
end

%%% Doing all of the plotting at the end is much faster %%%
% plot(Y1,Y2,'.')
% Ranges of x & y axes
% V=[-4 6 -1 12];
% axis(V);

hold off
