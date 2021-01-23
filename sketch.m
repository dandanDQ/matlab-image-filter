function f=sketch(f)
%rgb转化为ycbcr空间
f=rgb2ycbcr(f);
%log算子
log=[-2 -4 -4 -4 -2;
    -4 0 8 0 -4;
    -4 8 24 8 -4;
    -4 0 8 0 -4;
    -2 -4 -4 -4 -2];
%提取Y层做处理
Y=f(:,:,1);
g=imfilter(Y,log,'replicate');
[m,n]=size(g);
%设置阈值，使图像二值化
for i=1:m
    for j=1:n
        if(g(i,j)<-0.8)
            g(i,j)=0;
        else
            g(i,j)=1;
        end
    end
end
f=g;
end