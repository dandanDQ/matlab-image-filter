function main()
Img=imread('test2.jpg');
f=im2double(Img);
image=f;
Img2=imread('test1.jpg');
Img2=im2double(Img2);
Img3=imread('test3.jpg');
Img3=im2double(Img3);

%速写效果
f=image;
f=sketch(f);
imwrite(f,'sketch1.jpg');

%油画效果
f=Img3;
f=oilpainting(f,2);
imwrite(f,'oilpainting1.jpg');
f=image;
f=oilpainting(f,4);
imwrite(f,'oilpainting2.jpg');

%浮雕效果
f=image;
f=cameo(f);
imwrite(f,'cameo.jpg');

%马赛克效果
f=image;
f=mosaic(f);
imwrite(f,'mosaic.jpg');

%大雪滤镜
f=image;
f=snow(f);
imwrite(f,'snow.jpg');

%光斑滤镜
f=image;
f=facula(f);
imwrite(f,'facula.jpg');

%背景虚化滤镜
f=Img2;
f=asthenia(f,11);
imwrite(f,'asthenia.jpg');

%色调滤镜
f=image;
f=coloring(f);

end




