function f=sketch(f)
%rgbת��Ϊycbcr�ռ�
f=rgb2ycbcr(f);
%log����
log=[-2 -4 -4 -4 -2;
    -4 0 8 0 -4;
    -4 8 24 8 -4;
    -4 0 8 0 -4;
    -2 -4 -4 -4 -2];
%��ȡY��������
Y=f(:,:,1);
g=imfilter(Y,log,'replicate');
[m,n]=size(g);
%������ֵ��ʹͼ���ֵ��
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