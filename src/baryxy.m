function [ Itr ] = baryxy( I )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[Il Ic] = size(I);

[X, Y] = find(I);
nb = size(X);
minx = Il+1;
miny = Ic+1;
maxx = 0;
maxy = 0;
bary = [0 0];
marge = 0;
for i=1:nb;
    if X(i)<minx
        minx = X(i);
    end
    if Y(i)<miny
        miny = Y(i);
    end
    if X(i)>maxx
        maxx = X(i);
    end
    if Y(i)>maxy
        maxy = Y(i);
    end
    bary(1) = bary(1) + X(i);
    bary(2) = bary(2) + Y(i);
end

bary = bary./nb(1);
bary = round(bary);
distX = max(bary(1)-minx, maxx-bary(1));
distY = max(bary(2)-miny, maxy-bary(2));


if minx < marge || miny < marge
    marge = min(minx,miny);
end
if Ic-maxx < marge || Il - maxy < marge
    marge = min(Ic-maxx, Il - maxy);
end
bary
distX
distY
marge = 0;
  t1=  bary(2)-distX-marge
t2=bary(2)+distX+marge
t3=bary(1)-distY-marge
t4=bary(1)+distY+marge
Itr = I(bary(2)-distX-marge:bary(2)+distX+marge, bary(1)-distY-marge:bary(1)+distY+marge);
end

