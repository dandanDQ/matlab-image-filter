function f=coloring(f)
image=f;
f=rgb2hsi(f);
f(:,:,2)=f(:,:,2)*2.35;
f=hsi2rgb(f);
imwrite(f,'brigtht.jpg');

[m,n]=size(f(:,:,1));
increase=ones(m,n);
f=image;
f=rgb2hsi(f);
f(:,:,2)=f(:,:,2)*0.8;
f(:,:,1)=f(:,:,1)*0.285+0.44*increase(:,:);
f=hsi2rgb(f);
imwrite(f,'blue_tune.jpg');
end
