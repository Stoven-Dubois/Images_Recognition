function [ param ] = barymax( I )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[Il Ic] = size(I);

[X, Y] = find(I);
nb = size(X);
minx = Il+1;
miny = Ic+1;
maxx = 0;
maxy = 0;
bary = [0 0];
marge = 5;
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
dist=max(distX,distY);

if minx < marge || miny < marge
    marge = min(minx,miny);
end
if Il-maxx < marge || Ic - maxy < marge
    marge = min(Il-maxx, Ic - maxy);
end
    
param = [minx-marge+1 maxx+marge miny-marge+1 maxy+marge];

end

