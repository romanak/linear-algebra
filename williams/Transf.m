function P=transf(P)
%TRANSF
%Elementary row transformations for row reduction.
%Add multiples of rows, multiply, divide, swap.
%Gives choice of format - rational numbers or decimal numbers.
%Calling format:transf(A)

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

disp(' ')
form=input('Format: (r)ational numbers or (d)ecimal numbers? ','s'); 
disp(' ')

flag='T';

while flag=='T'
 ans=input('Operation: (a)dd (m)multiply (d)ivide (s)swap (e)exit ','s');
 if ans=='e';
  flag='F';
 end
 if ans=='a';
  x=input('add the multiple: ');
  y=input('          of row: ');
  z=input('          to row: ');
  P(z,:) = P(z,:) + x*P(y,:);
  disp(' ')
  if form=='r';
    disp(rats(P))
    disp(' ')
   else
    disp(P)
  end
 end

 if ans=='m';
  x=input('       give row: ');
  y=input('give multiplier: ');
  P(x,:) = y*P(x,:);
  disp(' ')
  if form=='r';
    disp(rats(P))
    disp(' ')
   else
    disp(P)
  end
 end

 if ans=='d';
  x=input('    give row: ');
  y=input('give divisor: ');
  P(x,:) = (1/y)*P(x,:);
  disp(' ')
  if form=='r';
    disp(rats(P))
    disp(' ')
   else
    disp(P)
  end
 end

 if ans=='s';
  x=input('swap row: ');
  y=input(' and row: ');
  Q=P;
  P(x,:) = Q(y,:);
  P(y,:) = Q(x,:);
  disp(' ')
  if form=='r';
    disp(rats(P))
    disp(' ')
   else
    disp(P)
  end
 end

end
