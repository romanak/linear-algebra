function ops
%OPS
%Number of multiplications in multiplying 3 or 4 matrices. 
%illustrates that the number depends on the grouping.  
%Calling format: ops

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

format compact

disp(' ')
disp('Count of # of scalar multiplications in multiplying matrices')
disp(' ')

n=0.5;b=1.5;c=2.5;d=3.5;e=4.5;f=5.5;g=6.5;

%check # matrices 3 or 4
while (n-3)*(n-4)~=0;
 n=input('Give # matrices (3 or 4): ');
end

disp(' ')   
a=input('rows in A: ');
%enter # cols in A & # rows in B; check same
while b~=c
 b=input('cols in A: ');
 disp(' ')
 c=input('rows in B: ');
 if b~=c; 
  error='rows in B must equal cols in A'
 end
end

while d~=e
 d=input('cols in B: ');
 disp(' ')
 e=input('rows in C: ');
 if d~=e;
  error='rows in C must equal cols in B'
 end
end

%if # matrices is 3
if n==3;
 f=input('cols in C: ');
 %compute # multiplications  
 ABxC=(a*b*d)+(a*d*f);
 AxBC=(a*b*f)+(c*d*f);
 disp(' ')
 ways=['   ABxC  ','AxBC']
 nos=[ABxC,AxBC]
 format loose
end

%if # matrices is 4
if n==4;
 while f~=g
  f=input('cols in C: ');
  disp(' ')
  g=input('rows in D: ');
  if f~=g; 
   error='rows in D must equal cols in C'
  end
 end
 h=input('cols in D: ');
 IABxCIxD=(a*b*d)+(a*d*f)+(a*f*h);
 IAxBCIxD=(c*d*f)+(a*b*f)+(a*f*h);
 ABxCD=(a*b*d)+(e*f*h)+(a*d*h);
 AxIBCxDI=(c*d*f)+(c*f*h)+(a*b*h);
 AIBxCDI=(e*f*h)+(c*d*h)+(a*b*h);
 disp(' ')
 ways='(ABxC)D  (AxBC)D  ABxCD  A(BCxD)  A(BxCD)'
 nos=[IABxCIxD,IAxBCIxD,ABxCD,AxIBCxDI,AIBxCDI]
 format loose
 disp(' ')
end

disp(' ')





