function f=mosaic(f)
f1=f;
[height,width]=size(f1(:,:,1));%读出图像大小
%如果图像的高度不是10的倍数，则扩充到10的倍数
if(mod(height,10)~=0)
    m=height+10-mod(height,10);
else
    m=height;
end
%如果图像的宽度不是10的倍数。则扩充到10的倍数
if(mod(width,10)~=0)
    n=width+10-mod(width,10);
else 
    n=width;
end
%创建用于储存结果的三维数组
f=zeros(m,n,3);
f(1:height,1:width,:)=f1(:,:,:);
f=rgb2ycbcr(f);
%马赛克算法
%对图像的三层分别进行操作
for b=1:3
    I=f(:,:,b)
    %图像每一个10*10小块进行平均值计算，并把结果作为10*10的YCbCr的值
    for i=1:10:m
        for j=1:10:n
            B=I(i:i+9,j:j+9);
            average=mean(mean(B));%求方块平均值
            for k=0:1:9
                for g=0:1:9
                    I(i+k,j+g)=average;%给方块中每一个像素赋值
                end
            end
            
        end
    end
 f(:,:,b)=I;
end
f=ycbcr2rgb(f);
end
