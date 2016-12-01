a = readtable('/Users/pranjal/Downloads/Vision/project/anspx1_5');
a = table2array(a);
a = abs(a);
ma = max(max(a));
a = a/ma;
b = readtable('/Users/pranjal/Downloads/Vision/project/anspx2_5');
b = table2array(b);
b = abs(b);
mb = max(max(b));
b = b/mb;
c = readtable('/Users/pranjal/Downloads/Vision/project/anspx3_5');
c = table2array(c);
c = abs(c);
mc = max(max(c));
c = c/mc;
z = max(max(a, b), c);
mz = max(max(z));
z = z/mz;
colormap('default')
imagesc(z, [0.2 1])
axis off;
iptsetpref('ImshowBorder', 'tight');
set(gca, 'position', [0 0 1 1], 'units', 'normalized')


%save the image here and rescale it to [170 170]
q = imread('/Users/pranjal/Downloads/Vision/project/finalimages/colormap_5.bmp');
q = imresize(q, [170 170]);
imwrite(q, '/Users/pranjal/Downloads/Vision/project/finalimages/colormap_5.jpg', 'jpg')



q = imread('/Users/pranjal/Downloads/Vision/project/finalimages/colormap_5.jpg');
p = imread('/Users/pranjal/Downloads/dataset_jpg/S010_002_00000014.jpg');
figure1 = figure;
ax1 = axes('Parent',figure1);
ax2 = axes('Parent',figure1);
set(ax1,'Visible','off');
set(ax2,'Visible','off');
alpha = 0.7
I = imshow(q,'Parent',ax2);
set(I,'AlphaData', alpha);
imshow(p,'Parent', ax1);
iptsetpref('ImshowBorder','tight')
f=getframe; imwrite(f.cdata,'AU5.png');
