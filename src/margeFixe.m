function [ Itr ] = margeFixe( I, marge )
% Fonction pour obtenir l'imagette avec la plus petite boîte englobante
%
% I : image d'entrée (matrice 2D)
% marge : marge ajoutée (scalaire)
%
% Itr : imagette retournée (matrice 2D)

[Il Ic] = size(I);

[X, Y] = find(I);
nb = size(X);
minx = Il+1;
miny = Ic+1;
maxx = 0;
maxy = 0;
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
end

if minx < marge || miny < marge
    marge = min(minx,miny);
end
if Il-maxx < marge || Ic - maxy < marge
    marge = min(Il-maxx, Ic - maxy);
end
    
Itr = I(minx-marge+1:maxx+marge,miny-marge+1:maxy+marge);

end

