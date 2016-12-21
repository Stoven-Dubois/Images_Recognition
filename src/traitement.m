clear all;
close all;
load('tab.mat');
tab = tab;


nb_objets = max(tab(:,length(tab)));
taille = length(tab) - 1;
nb_ref = size(tab,1)/nb_objets;
nb_ex = nb_objets*nb_ref;

taille_masque_l = 300;
taille_masque_c = 300;

base_ref=zeros(nb_ex,taille);
etiq_ref=zeros(nb_ex,1);

for lettre =1:nb_objets
    Pix=find(tab(:,end)==lettre);
    %base de reference
    base_ref(nb_ref*(lettre-1)+1 : nb_ref*lettre, 1 : taille) = tab(Pix(1:nb_ref), 1 : taille) ;
    etiq_ref(nb_ref*(lettre-1)+1 : nb_ref*lettre) = tab(Pix(1:nb_ref),end);
    
end;

image = zeros(nb_ex,taille_masque_l,taille_masque_c);
k = 50;
baseNew = zeros(2,1);
kMoyennes = zeros(nb_ex, k, 2);
etiqMoyennes = zeros(k,1);

for i=1:nb_ex
   image(i,:,:) = reBuild(base_ref,i,taille_masque_l, taille_masque_c); 
   image(i,:,:) = cont(squeeze(image(i,:,:))); 
   [X,Y] = find(squeeze(image(i,:,:)));
   baseNew = [X Y];
   [Il, Ic] = size(baseNew);
   kMoyennes(i,:,:) = kmeans(baseNew, k);  
   etiqMoyennes(i) = etiq_ref(i);
end

tabMoyenne=[nb_ex,taille_masque_l, taille_masque_c,1];

imageFinale = zeros(nb_ex, taille_masque_l, taille_masque_c);

for i=1:nb_ex
   for j=1:k
       a = round(kMoyennes(i,j,1));
       b = round(kMoyennes(i,j,2));
       if a == 0 || isnan(a)
           a = 1;
       end
       if b == 0 || isnan(b)
           b = 1;
       end
       imageFinale(i,a,b) = 1;
   end
   figure();
   imagesc(squeeze(image(i,:,:)));
   If=squeeze(imageFinale(i,:,:));
   figure();
   imagesc(squeeze(imageFinale(i,:,:)));
   If = If(:)';
   if i ==1
      tabMoyenne = [If, etiq_ref(i)];
   else
      tabMoyenne = [tabMoyenne; If, etiq_ref(i)];
   end
end

save tabMoyenne tabMoyenne

        




