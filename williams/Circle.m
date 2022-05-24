function circle(A)
%CIRCLE		
%Graphs circles of radii 1,2,3 in R2. 
%R2 is "inner product" space defined by a 2x2 symm matrix A.
%Calling format: circle(A), for any 2x2 symm matrix A.

%Copyright Gareth Williams, Stetson University 
%gwilliam@stetson.edu, http://www.stetson.edu/~gwilliam
%Accompanies "Linear Algebra with Applications" by Gareth Williams

clf;hold on;
subplot(111) %full graphics window

x=0;X=[0];Y=[0];V=[0];%Initial values
[C,B]=eig(A);

%A is symmetric matrix, 
%C is orthogonal matrix of eigenvectors for coord transf,
%B is diagonal matrix of eigenvalues.   

%circles for [B(1,1)<0, B(2,2)>0] case and [B(1,1)>0, B(2,2)<0] case
%are the same. We plot the second case, changing the first case to
%this one if it arises.
if B(1,1)*B(2,2) < 0
  if B(1,1) < 0
    temp = B(1,1);
    B(1,1) = B(2,2);
    B(2,2) = temp;
  end
end

%compute intervals for graphing
if B(1,1)==0   %If an eigenvalue is zero, MATLAB makes it B(1,1).
   interval = sqrt(4/abs(B(2,2)));
  elseif B(2,2)==0
   interval = sqrt(4/abs(B(1,1)));
  else
   interval=max([sqrt(16/abs(B(1,1))) sqrt(16/abs(B(2,2)))]);
end 

V=[-interval interval -interval interval];
axis('square');  
axis(V);

%step size for graphing
if B(1,1)*B(2,2)>0
   step=interval/64;  %takes less time and needs more points
  else             
   step=interval/16; 
end

%compute points for plotting the graph,
if B(1,1)*B(2,2) ~= 0
  disp(' ')
  disp('**computing pts for circle radius 1**')
  intercept=1/sqrt(abs(B(1,1)));
end

%start of positive definite case
if B(1,1)*B(2,2)>0
  X=[ ];
  Y=[ ];  
  m=1;
  for x = -intercept:step:intercept;
    X(m)=x;
    Y(m)=sqrt((1-B(1,1)*x^2)/B(2,2));      %top half circle
    m=m+1;
  end
  for x = intercept:-step:-intercept;
    X(m)=x;
    Y(m)=-sqrt((1-B(1,1)*x^2)/B(2,2));     %bottom half circle
    m=m+1;
  end
  X(m)=X(1);Y(m)=Y(1);  %to close the graph
  D=C*[X;Y];
end

%end of positive definite case
%start of none positive definite case
if B(1,1)*B(2,2)<0						
  %start of hyperbola with x axis
  if B(2,2)<0
    XA=[ ];
    YA=[ ];           
    m=1;
    for x = interval:-step:intercept;
      XA(m)=x;
      YA(m)=sqrt(abs((1-B(1,1)*x^2)/B(2,2)));
      m=m+1;
    end
    for x = intercept:step:interval;
      XA(m)=x;
      YA(m)=-sqrt(abs((1-B(1,1)*x^2)/B(2,2)));;
      m=m+1;
    end
    DA=C*[XA;YA];
    XB=[ ];
    YB=[ ];
    m=1;
    for x = -interval:step:-intercept;
     XB(m)=x;
     YB(m)=sqrt(abs((1-B(1,1)*x^2)/B(2,2)));
     m=m+1;
    end
    for x = -intercept:-step:-interval;
     XB(m)=x;
     YB(m)=-sqrt(abs((1-B(1,1)*x^2)/B(2,2)));
     m=m+1;
    end
    DB=C*[XB;YB];
 end 
 
 %end of hyperbola with x axis
 %start of hyperbola with y axis
 endx=sqrt(abs((1-B(2,2)*interval^2)/B(1,1)));
 B(1,1)=-B(1,1);
 XE=[ ];
 YE=[ ];
 m=1;
    for x = -endx:step:endx;
      XE(m)=x;
      YE(m)=sqrt(abs((1-B(1,1)*x^2)/B(2,2)));
      m=m+1;
    end
    DE=C*[XE;YE];
    XF=[ ];
    YF=[ ];
    m=1;
    for x = -endx:step:endx;
      XF(m)=x;
      YF(m)=-sqrt(abs((1-B(1,1)*x^2)/B(2,2)));
      m=m+1;
    end
    DF=C*[XF;YF];
    B(1,1)=-B(1,1);
    %end hyperbola with y axis
end
%end of none positve definite case, and circle radius 1

if B(1,1)*B(2,2) ~= 0
  disp(' ')
  disp('**computing pts for circle radius 2**')
  intercept=2/sqrt(abs(B(1,1)));
end

%start of positive definite case
if B(1,1)*B(2,2)>0
  X=[ ];
  Y=[ ];  
  m=1;
  for x = -intercept:step:intercept;
    X(m)=x;
    Y(m)=sqrt((4-B(1,1)*x^2)/B(2,2));      %top half circle
    m=m+1;
  end
  for x = intercept:-step:-intercept;
    X(m)=x;
    Y(m)=-sqrt((4-B(1,1)*x^2)/B(2,2));     %bottom half circle
    m=m+1;
  end
  X(m)=X(1);Y(m)=Y(1);  %to close the graph
  DD=C*[X;Y];
end
%end of positive definite case
%start of none positive definite case
if B(1,1)*B(2,2)<0						
  %start of hyperbola with x axis
  if B(2,2)<0
    XA=[ ];
    YA=[ ];           
    m=1;
    for x = interval:-step:intercept;
      XA(m)=x;
      YA(m)=sqrt(abs((4-B(1,1)*x^2)/B(2,2)));
      m=m+1;
    end
    for x = intercept:step:interval;
      XA(m)=x;
      YA(m)=-sqrt(abs((4-B(1,1)*x^2)/B(2,2)));;
      m=m+1;
    end
    DDA=C*[XA;YA];
    XB=[ ];
    YB=[ ];
    m=1;
    for x = -interval:step:-intercept;
     XB(m)=x;
     YB(m)=sqrt(abs((4-B(1,1)*x^2)/B(2,2)));
     m=m+1;
    end
    for x = -intercept:-step:-interval;
     XB(m)=x;
     YB(m)=-sqrt(abs((4-B(1,1)*x^2)/B(2,2)));
     m=m+1;
    end
    DDB=C*[XB;YB];
  end 
%end of hyperbola with x axis
  
%start of hyperbola with y axis
  endx=sqrt(abs((4-B(2,2)*interval^2)/B(1,1)));
  B(1,1)=-B(1,1);
  XE=[ ];
  YE=[ ];
  m=1;
    for x = -endx:step:endx;
      XE(m)=x;
      YE(m)=sqrt(abs((4-B(1,1)*x^2)/B(2,2)));
      m=m+1;
    end
    DDE=C*[XE;YE];
    XF=[ ];
    YF=[ ];
    m=1;
    for x = -endx:step:endx;
      XF(m)=x;
      YF(m)=-sqrt(abs((4-B(1,1)*x^2)/B(2,2)));
      m=m+1;
    end
    DDF=C*[XF;YF];
    B(1,1)=-B(1,1);
  %end hyperbola with y axis
end
%end of none positve definite case, and circle radius 2

if B(1,1)*B(2,2) ~= 0
  disp(' ')
  disp('**computing pts for circle radius 3**')
  intercept=3/sqrt(abs(B(1,1)));
end
%start of positive definite case
if B(1,1)*B(2,2)>0
  X=[ ];
  Y=[ ];  
  m=1;
  for x = -intercept:step:intercept;
    X(m)=x;
    Y(m)=sqrt((9-B(1,1)*x^2)/B(2,2));      %top half circle
    m=m+1;
  end
  for x = intercept:-step:-intercept;
    X(m)=x;
    Y(m)=-sqrt((9-B(1,1)*x^2)/B(2,2));     %bottom half circle
    m=m+1;
  end
  X(m)=X(1);Y(m)=Y(1);  %to close the graph
  DDD=C*[X;Y];
end
%end of positive definite case

%start of none positive definite case
if B(1,1)*B(2,2)<0						
  %start of hyperbola with x axis
  if B(2,2)<0
    XA=[ ];
    YA=[ ];           
    m=1;
    for x = interval:-step:intercept;
      XA(m)=x;
      YA(m)=sqrt(abs((9-B(1,1)*x^2)/B(2,2)));
      m=m+1;
    end
    for x = intercept:step:interval;
      XA(m)=x;
      YA(m)=-sqrt(abs((9-B(1,1)*x^2)/B(2,2)));;
      m=m+1;
    end
    DDDA=C*[XA;YA];
    XB=[ ];
    YB=[ ]; 
    m=1;
    for x = -interval:step:-intercept;
     XB(m)=x;
     YB(m)=sqrt(abs((9-B(1,1)*x^2)/B(2,2)));
     m=m+1;
    end
    for x = -intercept:-step:-interval;
     XB(m)=x;
     YB(m)=-sqrt(abs((9-B(1,1)*x^2)/B(2,2)));
     m=m+1;
    end
    DDDB=C*[XB;YB];
  end 
  %end of hyperbola with x axis
  
  %start of hyperbola with y axis
  endx=sqrt(abs((9-B(2,2)*interval^2)/B(1,1)));
  B(1,1)=-B(1,1);
  XE=[ ];
  YE=[ ]; 
  m=1;
    for x = -endx:step:endx;
      XE(m)=x;
      YE(m)=sqrt(abs((9-B(1,1)*x^2)/B(2,2)));
      m=m+1;
    end
    DDDE=C*[XE;YE];
    XF=[ ];
    YF=[ ]; 
    m=1;
    for x = -endx:step:endx;
      XF(m)=x;
      YF(m)=-sqrt(abs((9-B(1,1)*x^2)/B(2,2)));
      m=m+1;
    end
    DDDF=C*[XF;YF];
    B(1,1)=-B(1,1);
    %end hyperbola with y axis
end
%end of none positve definite case, and circle radius 3

%Special case of zero eigenvalue
if B(1,1) == 0
    disp('**computing pts for graphing**')
    y=sqrt(1/abs(B(2,2)));   %circle radius 1
    DA=C*[-interval interval;y y];
    DB=C*[-interval interval;-y -y];

    y=sqrt(2/abs(B(2,2)));   %circle radius 2
    DDA=C*[-interval interval;y y];
    DDB=C*[-interval interval;-y -y];

    y=sqrt(3/abs(B(2,2)));   %circle radius 3
    DDDA=C*[-interval interval;y y];
    DDDB=C*[-interval interval;-y -y];
end
 
if B(2,2) == 0
    disp('**computing pts for graphing**')
    x=sqrt(1/abs(B(1,1)));   %circle radius 1
    DA=C*[-x -x;-interval interval];
    DB=C*[x x;-interval interval];

    x=sqrt(2/abs(B(1,1)));   %circle radius 2
    DDA=C*[-x -x;-interval interval];
    DDB=C*[x x;-interval interval];

    x=sqrt(3/abs(B(1,1)));   %circle radius 3
    DDDA=C*[-x -x;-interval interval];
    DDDB=C*[x x;-interval interval];
end


title('Circles of radii 1, 2, 3')

hold on
%Plot X axis
P=[V(1,1) V(1,2)];
Q=[0 0];
plot(P,Q,':')

%Plot Y axis
P=[0 0];
Q=[V(1,3) V(1,4)];
plot(P,Q,':')

%Plot points and join them up
if B(1,1)*B(2,2)>0
  plot(D(1,:),D(2,:))
  plot(DD(1,:),DD(2,:))
  plot(DDD(1,:),DDD(2,:))
end

if B(1,1)*B(2,2)<0
  plot(DA(1,:),DA(2,:))
  plot(DB(1,:),DB(2,:))
  plot(DE(1,:),DE(2,:))
  plot(DF(1,:),DF(2,:))

  plot(DDA(1,:),DDA(2,:))
  plot(DDB(1,:),DDB(2,:))
  plot(DDE(1,:),DDE(2,:))
  plot(DDF(1,:),DDF(2,:))

  plot(DDDA(1,:),DDDA(2,:))
  plot(DDDB(1,:),DDDB(2,:))
  plot(DDDE(1,:),DDDE(2,:))
  plot(DDDF(1,:),DDDF(2,:))
end

%Special case of zero eigenvalue
if B(1,1)*B(2,2) == 0
  plot(DA(1,:),DA(2,:))
  plot(DB(1,:),DB(2,:))
  plot(DDA(1,:),DDA(2,:))
  plot(DDB(1,:),DDB(2,:))
  plot(DDDA(1,:),DDDA(2,:))
  plot(DDDB(1,:),DDDB(2,:))
end

disp(' ')

figure(gcf)
hold off;





