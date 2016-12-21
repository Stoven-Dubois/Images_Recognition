function [ It ] = reBuild( base_ref,indice,taille_masque_l, taille_masque_c )
% Fonction qui reconstruit une image 2 dimensions à partir de son encodage
% en 1 dimension
    It = zeros(taille_masque_l,taille_masque_c);
    for i=1:taille_masque_l
        for j=1:taille_masque_c
            It(j,i) = base_ref(indice,taille_masque_l*(i-1)+j);
        end
    end
end

