function [ centersMoy ] = kmeans( base, k)
% fonction pour generer des prototypes selon la methode des k-means

% base : base de reference sur laquelle on va 
% appliquer l'algorithme k-meeans (matrice 2D)
% k : nombre de prototypes à créer (scalaire)
%
% centersMoy : k-means (matrice 2D)



[Il,Ic] = size(base);

% Initialisation
centersOld = zeros(k,2);
for i=1:k
    init = round((Il-1)*rand(1,1)+1);
    centersMoy(i,:) = base(init,:);
end
    
% Algorithme des k-means
baseClassee = zeros(Il,1);

while centersOld ~= centersMoy
    for i=1:Il
        delta = zeros(k,1);
        for j=1:k
            delta(j) = delta(j) + sum((base(i, :)- centersMoy(j, :)).^2).^.5;
        end
        [minDelta, ind] = min(delta);
        baseClassee(i) = ind;
    end
    centersOld = centersMoy;
    for i = 1 : k
		centersMoy(i, :) = mean(base(find(baseClassee == i), :));
    end
    
    
end

end

