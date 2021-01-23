function f=oilpainting(f,radius)
%把灰度级划分为100个
intensity_level=100; 
[m,n]=size(f(:,:,1));    
r=zeros(m,n);
g=zeros(m,n);
b=zeros(m,n);
R=f(:,:,1);
G=f(:,:,2);
B=f(:,:,3);
%x，y取遍全部像素点
for x=1:m
    for y=1:n
        %对每一个像素点，遍历其邻域，并计算邻域范围内各个灰度等级出现的次数
        intensity_counter=zeros(intensity_level,1);
        sum_r=zeros(intensity_level,1);
        sum_g=zeros(intensity_level,1);
        sum_b=zeros(intensity_level,1);
        for i=(x-radius):(x+radius)   
            for j=(y-radius): (y+radius)
                    if i>0&&i<=m&&j>0&&j<=n 
                       intensity=round(( R(i,j)+ G(i,j)+ B(i,j))/3*intensity_level); 
   
                      %强度不能为零，避免数组下标出现零，若为零，则设置其强度为1
                      if intensity==0
                            intensity=1;
                      end
                       %统计强度出现的次数
                       intensity_counter(intensity,1)= intensity_counter(intensity,1)+1;
                       %统计强度的R\G\B分量的和
                       sum_r(intensity,1)=sum_r(intensity,1)+R(i,j);
                       sum_g(intensity,1)=sum_g(intensity,1)+G(i,j);
                       sum_b(intensity,1)=sum_b(intensity,1)+B(i,j);
                    end
            end
        end  
    %像素点（x，y）的邻域遍历完毕，找出出现次数最多的强度
    intensity_counter_max=max(intensity_counter);
             for i=1:intensity_level
                 if intensity_counter(i)==intensity_counter_max
                  index=i;
                 end
             end
   %出现最多次的强度值对应像素的r\g\b分量取平均值，作为当前像素输出的r\g\b分量
        r(x,y)=sum_r(index,1)/intensity_counter(index,1);
        g(x,y)=sum_g(index,1)/intensity_counter(index,1);
        b(x,y)=sum_b(index,1)/intensity_counter(index,1);
    end
end
%将三个通道的值合并成新的图像
f=cat(3,r,g,b);
end
