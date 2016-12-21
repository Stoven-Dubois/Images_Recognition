function [ resultat ] = ppv( coord_ref,etiq_ref, coord, k)
[Y, X] = size(coord);
[Ih, Il, Ic] = size(coord_ref);
voisins = ones(Y,2) * 99999999;


for a=1:Ih
    dist = 0;
    for i=1:Y
        x = coord(i,1);
        y = coord(i,2);
        dist_tab = ones(Il,1)*999999999;
        for b=1:Il
                 x_ref = coord_ref(a,b,1);
                 y_ref = coord_ref(a,b,2);
                 dist_tab(b) = sqrt((x-x_ref)^2 + (y-y_ref)^2);
        end
        dist = dist+min(dist_tab);
        dist
    end
    a;
    comp(a) = dist;
end

comp

[comp I]= sort(comp);
I
for i=1:k
    resultat(i) = etiq_ref(I(i))
end
end


    
    
        
    
        
% for i=1:Y
%     x = coord(i,1);
%     y = coord(i,2);
%     
%     for a=1:Ih
%         dist = 0;
%         for b=1:Il
%                 x_ref = coord_ref(a,b,1);
%                 y_ref = coord_ref(a,b,2);
%                 dist = dist + sqrt((x-x_ref)^2 + (y-y_ref)^2);
%         end
%          for nbVoisin=1:k
%                     if voisins(i,1) > dist
%                         voisins(i,1) = dist; 
%                         voisins(i,2) = etiq_ref(a);
%                         break;
%                     end
%                 end
%     end
% end
%               
%  resultat = voisins(:,2);
% 
% end
% 
