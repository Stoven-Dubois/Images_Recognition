clear all;
close all;
load('tabMoyenne.mat');
tab = tabMoyenne;
load('tab_test.mat');
tab_test = tab_test;


nb_objets = max(tab(:,length(tab)));
taille = length(tab) - 1;
taille_test = length(tab_test) - 1;
nb_ref = size(tab,1)/nb_objets;
nb_test = size(tab_test,1)/nb_objets;
nb_ex = nb_objets*nb_ref;
nb_ex_test = nb_objets*nb_test;

taille_masque_l = 300;
taille_masque_c = 300;

base_ref=zeros(nb_ex,taille);
etiq_ref=zeros(nb_ex,1);
base_test=zeros(nb_ex_test,taille);
etiq_test=zeros(nb_ex_test,1);

for lettre =1:nb_objets
    Pix=find(tab(:,end)==lettre);
    Pit=find(tab_test(:,end)==lettre);
    %base de reference
    base_ref(nb_ref*(lettre-1)+1 : nb_ref*lettre, 1 : taille) = tab(Pix(1:nb_ref), 1 : taille) ;
    etiq_ref(nb_ref*(lettre-1)+1 : nb_ref*lettre) = tab(Pix(1:nb_ref),end);
    %base de test
    base_test(nb_test*(lettre-1)+1 : nb_test*lettre, 1 : taille_test) = tab_test(Pit(1:nb_test), 1 : taille_test) ;
    etiq_test(nb_test*(lettre-1)+1 : nb_test*lettre) = tab_test(Pit(1:nb_test),end);
    
end;

image_ref = zeros(nb_ex,taille_masque_l,taille_masque_c);
image = zeros(nb_ex_test,taille_masque_l,taille_masque_c);
k = 50;
baseNew = zeros(2,1);
kMoyennes = zeros(nb_ex_test, k, 2);
etiqMoyennes = zeros(k,1);

for i=1:nb_ex
    image_ref(i,:,:) = reBuild(base_ref,i,taille_masque_l, taille_masque_c); 
end

for i=1:nb_ex_test
   image(i,:,:) = reBuild(base_test,i,taille_masque_l, taille_masque_c); 
   image(i,:,:) = cont(squeeze(image(i,:,:))); 
   [X,Y] = find(squeeze(image(i,:,:)));
   baseNew = [X Y];
   [Il, Ic] = size(baseNew);
   kMoyennes(i,:,:) = kmeans(baseNew, k);  
   etiqMoyennes(i) = etiq_test(i);
end

imageFinale = zeros(nb_ex_test, taille_masque_l, taille_masque_c);

for i=1:nb_ex_test
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
   imagesc(squeeze(imageFinale(i,:,:)));
end

compar_ref = zeros(nb_ex,k);
for i=1:nb_ex
    [X Y] = find(squeeze(image_ref(i,:,:)));
    X = X';
    Y = Y';
    [Il Ic] = size(X);
    for j=1:Il
        compar_ref(i,j,1) = X(1,j);
        compar_ref(i,j,2) = Y(1,j);
    end
end

compar_test = zeros(nb_ex_test,k);
for i=1:nb_ex_test
    [X Y] = find(squeeze(imageFinale(i,:,:)));
    X = X';
    Y = Y';
    [Il Ic] = size(X);
    for j=1:Il
        compar_test(i,j,1) = X(1,j);
        compar_test(i,j,2) = Y(1,j);
    end
end

%for i=1:nb_ex_test
    [label_classe] = ppv(compar_ref, etiq_ref, squeeze(compar_test(2,:,:)), 5)
    etiq = classe_maj(label_classe,3)
%end
    
