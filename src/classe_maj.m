function [ resultat ] = classe_maj( label, nbEtiq )
% Fonction qui retourne la classe majoritaire
%
% label : tableau en entrée (vecteur)
% nbEtiq : nombre d'étiquettes (scalaire)
%
% resultat : classe majoritaire (scalaire)

k = size(label);
k = k(2);

equal = 0;
result = zeros(1,nbEtiq);
for cpt=1:k
    lettre = label(1,cpt);
    result(lettre) = result(lettre)+1;
end

valmax = 0;
idmax = 0;
notEqual = 2;
for cpt=1:nbEtiq
   if result(cpt)>valmax
       idmax = cpt;
       valmax = result(cpt);
   end
end

for cpt=1:nbEtiq
   if result(cpt)== valmax
       idmax = cpt;
       valmax = result(cpt);
       notEqual = notEqual-1;
    end
end


if notEqual == 1
    resultat = idmax;
else
    resultat = -1; 
end

end

