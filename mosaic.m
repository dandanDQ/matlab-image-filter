function f=mosaic(f)
f1=f;
[height,width]=size(f1(:,:,1));%����ͼ���С
%���ͼ��ĸ߶Ȳ���10�ı����������䵽10�ı���
if(mod(height,10)~=0)
    m=height+10-mod(height,10);
else
    m=height;
end
%���ͼ��Ŀ�Ȳ���10�ı����������䵽10�ı���
if(mod(width,10)~=0)
    n=width+10-mod(width,10);
else 
    n=width;
end
%�������ڴ���������ά����
f=zeros(m,n,3);
f(1:height,1:width,:)=f1(:,:,:);
f=rgb2ycbcr(f);
%�������㷨
%��ͼ�������ֱ���в���
for b=1:3
    I=f(:,:,b)
    %ͼ��ÿһ��10*10С�����ƽ��ֵ���㣬���ѽ����Ϊ10*10��YCbCr��ֵ
    for i=1:10:m
        for j=1:10:n
            B=I(i:i+9,j:j+9);
            average=mean(mean(B));%�󷽿�ƽ��ֵ
            for k=0:1:9
                for g=0:1:9
                    I(i+k,j+g)=average;%��������ÿһ�����ظ�ֵ
                end
            end
            
        end
    end
 f(:,:,b)=I;
end
f=ycbcr2rgb(f);
end
