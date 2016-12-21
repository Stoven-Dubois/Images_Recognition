close all
clear all
name=['boite'; 'manga'; 'souri';];

nb_images_ref = 4;
nb_images_test = 1;
nb_objets = size(name,1);
seuil = 0.6;

pixels = 300;
seuil = 0.6;
tab=[nb_objets*nb_images_ref,pixels, pixels,1];
for lettre=1:nb_objets
    for i=1:nb_images_ref
        name1=['' name(lettre,:) num2str(i) '.png'];
        I=imread(name1);
        Ib=im2bw(I,seuil); % binarisation
        Ib  = double(Ib);
        Ib = 1-Ib;
        param=barymax(Ib);
        Im = I(param(1):param(2), param(3):param(4));
        If=double(imresize(Im,[pixels,pixels]));
        figure;
        imagesc(If);
        If=If(:)';
        if lettre == 1 && i ==1
            tab = [If, lettre];
        else
            tab = [tab; If,lettre];
        end
    end
end
save tab tab;

tab_test=[nb_objets*nb_images_test,pixels, pixels,1];
for lettre=1:nb_objets
    for i=1:nb_images_test
        name1=['' name(lettre,:) 'test' num2str(i) '.png'];
        I=imread(name1);
        Ib=im2bw(I,seuil); % binarisation
        Ib  = double(Ib);
        Ib = 1-Ib;
        param=barymax(Ib);
        Im = I(param(1):param(2), param(3):param(4));
        If=double(imresize(Im,[pixels,pixels]));
        figure;
        imagesc(If);
        If=If(:)';
        if lettre == 1 && i ==1
            tab_test = [If, lettre];
        else
            tab_test = [tab_test; If,lettre];
        end
    end
end
save tab_test tab_test;

% close all
% clear all
% name=['boite'; 'manga'; 'souri';];
% 
% nb_images_ref = 4;
% nb_images_test = 1;
% nb_objets = size(name,1);
% 
% pixels = 300;
% seuil = 0.6;
% tab=[nb_objets*nb_images_ref,pixels, pixels,1];
% for lettre=1:nb_objets
%     for i=1:nb_images_ref
%         name1=['' name(lettre,:) num2str(i) '.png'];
%         I=imread(name1);
%         Ib=im2bw(I,seuil); % binarisation
%         Ib = 1-Ib;
% 
%         
%         Ib  = double(Ib);
%         %%%%%%
%         %It=barymax(Ib);
%         %It=baryxy(Ib);
%         It = margeFixe(Ib,5);
%         %%%%%%
%         If=imresize(Ib,[pixels,pixels]);
%         If=If(:)';
%         if lettre == 1 && i ==1
%             tab = [If, lettre];
%         else
%             tab = [tab; If,lettre];
%         end
%     end
% end
% save tab tab;
% 
% tab_test=[nb_objets*nb_images_test,pixels, pixels,1];
% for lettre=1:nb_objets
%     for i=1:nb_images_test
%         name1=['' name(lettre,:) 'test' num2str(i) '.png'];
%         I=imread(name1);
%         Ib=im2bw(I,seuil); % binarisation
%         Ib = 1-Ib;
% 
%         
%         Ib  = double(Ib);
%         %%%%%%
%         %It=barymax(Ib);
%         %It=baryxy(Ib);
%         It = margeFixe(Ib,5);
%         %%%%%%
%         If=imresize(Ib,[pixels,pixels]);
%         If=If(:)';
%         if lettre == 1 && i ==1
%             tab_test = [If, lettre];
%         else
%             tab_test = [tab_test; If,lettre];
%         end
%     end
% end
% save tab_test tab_test;
% 
