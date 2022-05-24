function a=Angle(X,Y)
%ANGLE	
%The angle between two vectors, X and Y,in degrees.
%Calling format: a = Angle(X,Y)

% Copyright 1991 Lisa Coulter. Stetson University.
% email: lcoulter@stetson.edu
% Accompanies "Linear Algebra with Applications" by Gareth Williams

temp = X*Y';
normX = sqrt(X*X');
normY = sqrt(Y*Y');
a = acos(temp/(normX*normY));
a = a*180/pi;

if (a < 1.0e-10) 
  a = 0;
end

