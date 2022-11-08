f = 'C:\Users\HP\Desktop\Thesis\Dataset\no';
d = ls(f);
d(1,:)=[]
d(1,:)=[]
mkdir('New')
for i=1:size(d)
   I=imread(fullfile(f,d(i,:)));
   I=imresize(I,[227 227]);
   imshow(I)
   imwrite(I,fullfile('New',strcat(num2str(i),'.jpeg')));
end