function main()
Img=imread('test2.jpg');
f=im2double(Img);
image=f;
Img2=imread('test1.jpg');
Img2=im2double(Img2);
Img3=imread('test3.jpg');
Img3=im2double(Img3);

%��дЧ��
f=image;
f=sketch(f);
imwrite(f,'sketch1.jpg');

%�ͻ�Ч��
f=Img3;
f=oilpainting(f,2);
imwrite(f,'oilpainting1.jpg');
f=image;
f=oilpainting(f,4);
imwrite(f,'oilpainting2.jpg');

%����Ч��
f=image;
f=cameo(f);
imwrite(f,'cameo.jpg');

%������Ч��
f=image;
f=mosaic(f);
imwrite(f,'mosaic.jpg');

%��ѩ�˾�
f=image;
f=snow(f);
imwrite(f,'snow.jpg');

%����˾�
f=image;
f=facula(f);
imwrite(f,'facula.jpg');

%�����黯�˾�
f=Img2;
f=asthenia(f,11);
imwrite(f,'asthenia.jpg');

%ɫ���˾�
f=image;
f=coloring(f);

end




