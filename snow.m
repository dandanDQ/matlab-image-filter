function f=snow(f)
%色彩饱和度调低
f=rgb2hsi(f);%转换到HSI色彩空间
f(:,:,2)=f(:,:,2)*0.65;
f(:,:,1)=f(:,:,1)*0.85;
f=hsi2rgb(f);

[m,n]=size(f(:,:,1));%获取图像的高度和宽度
heavesnow=rand(m,n);%生成一个m*n大小的数值位于0~1之间的矩阵
%将矩阵中的值小于0.99998的值置为零
for i=1:m
    for j=1:n
        if heavesnow(i,j)<0.99998;
        heavesnow(i,j)=0;
        end
    end
end

%对非零的数值进行膨胀操作,获得大雪效果
B=[0 1 0;1 1 1;0 1 0];
heavesnow=imdilate(heavesnow,B);
heavesnow=imdilate(heavesnow,B);

%生成小雪的算法，同大雪，只是不进行膨胀操作
lightsnow=rand(m,n);
for i=1:m
    for j=1:n
        if lightsnow(i,j)<0.999684;
        lightsnow(i,j)=0;
        end
    end
end

%将大小不同的雪叠加在一起
snow=heavesnow(:,:)+lightsnow(:,:);
%再对雪进行空间滤波操作，得到多边形的雪花形状
window = [1,0,1,0,1;0,1,1,1,0;1,1,1,1,1;0,1,1,1,0;1,0,1,0,1]; 
snow = imdilate(snow,window); 
%在各层上叠加雪的效果
f(:,:,1)=f(:,:,1)+snow(:,:);
f(:,:,2)=f(:,:,2)+snow(:,:);
f(:,:,3)=f(:,:,3)+snow(:,:);
end