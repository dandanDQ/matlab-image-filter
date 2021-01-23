function f=asthenia(f,rad)
image=f;%拷贝图像，用于后续复原中心图像
%rad表示disk算子的大小
%色彩模糊处理
%disk算子
     crad  = ceil(rad-0.5);
     [x,y] = meshgrid(-crad:crad,-crad:crad);
     maxxy = max(abs(x),abs(y));
     minxy = min(abs(x),abs(y));
     m1 = (rad^2 <  (maxxy+0.5).^2 + (minxy-0.5).^2).*(minxy-0.5) + ...
          (rad^2 >= (maxxy+0.5).^2 + (minxy-0.5).^2).* ...
	        sqrt(rad^2 - (maxxy + 0.5).^2);
     m2 = (rad^2 >  (maxxy-0.5).^2 + (minxy+0.5).^2).*(minxy+0.5) + ...
          (rad^2 <= (maxxy-0.5).^2 + (minxy+0.5).^2).* ...
           sqrt(rad^2 - (maxxy - 0.5).^2);
     sgrid = (rad^2*(0.5*(asin(m2/rad) - asin(m1/rad)) + ...
             0.25*(sin(2*asin(m2/rad)) - sin(2*asin(m1/rad)))) - ...
             (maxxy-0.5).*(m2-m1) + (m1-minxy+0.5)) ... 
	          .*((((rad^2 < (maxxy+0.5).^2 + (minxy+0.5).^2) & ...
             (rad^2 > (maxxy-0.5).^2 + (minxy-0.5).^2)) | ...
	          ((minxy==0)&(maxxy-0.5 < rad)&(maxxy+0.5>=rad))));
     sgrid = sgrid + ((maxxy+0.5).^2 + (minxy+0.5).^2 < rad^2);
     sgrid(crad+1,crad+1) = min(pi*rad^2,pi/2);
     if ((crad>0) && (rad > crad-0.5) && (rad^2 < (crad-0.5)^2+0.25)) 
        m1  = sqrt(rad^2 - (crad - 0.5).^2);
	     m1n = m1/rad;
        sg0 = 2*(rad^2*(0.5*asin(m1n) + 0.25*sin(2*asin(m1n)))-m1*(crad-0.5));
        sgrid(2*crad+1,crad+1) = sg0;
        sgrid(crad+1,2*crad+1) = sg0;
        sgrid(crad+1,1)        = sg0;
        sgrid(1,crad+1)        = sg0;
        sgrid(2*crad,crad+1)   = sgrid(2*crad,crad+1) - sg0;
        sgrid(crad+1,2*crad)   = sgrid(crad+1,2*crad) - sg0;
        sgrid(crad+1,2)        = sgrid(crad+1,2)      - sg0;
        sgrid(2,crad+1)        = sgrid(2,crad+1)      - sg0;
     end
     sgrid(crad+1,crad+1) = min(sgrid(crad+1,crad+1),1);
     w = sgrid/sum(sgrid(:));
f=imfilter(f,w,'replicate');%用disk算子进行滤波操作

[m,n]=size(f(:,:,1));
if m>n %限定中心半径为R，R取高度和宽度中较小者的1/3，可取得照片的中心区域
    R=n/3;
else 
    R=m/3;
end
x0=m/2;%（x0，y0）表示图像的中心像素点
y0=n/2;

for i=1:m
    for j=1:n
    if (x0-i)*(x0-i)+(y0-j)*(y0-j)<R*R%对于处于半径内的图像，恢复原值
        f(i,j,:)=image(i,j,:);
    end
    end
end
end
