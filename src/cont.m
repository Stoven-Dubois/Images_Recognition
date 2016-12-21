function [ It ] = cont( Im )
% Fonction qui extrait les contours d'une image et effectue la rotation
% selon l'orientation de gradient maximale
    [Il, Ic] = size(Im);
    It = zeros(Il, Ic);
    seuil = 100;
    
    [Gmag,Gdir] = imgradient(Im);
    It = Gmag>seuil;

    maxAngle = max(max(Gdir));
    It = imrotate(It,-maxAngle);
    
    It=imresize(It,[Il,Ic]);
end

