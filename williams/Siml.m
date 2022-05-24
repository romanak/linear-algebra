function R=siml(P,Q)
%SIM
%Performs similarity transf inv(B)*A*B.
%Calling format: siml(A,B)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

R=inv(Q)*P*Q;
