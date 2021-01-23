function f=snow(f)
%ɫ�ʱ��Ͷȵ���
f=rgb2hsi(f);%ת����HSIɫ�ʿռ�
f(:,:,2)=f(:,:,2)*0.65;
f(:,:,1)=f(:,:,1)*0.85;
f=hsi2rgb(f);

[m,n]=size(f(:,:,1));%��ȡͼ��ĸ߶ȺͿ��
heavesnow=rand(m,n);%����һ��m*n��С����ֵλ��0~1֮��ľ���
%�������е�ֵС��0.99998��ֵ��Ϊ��
for i=1:m
    for j=1:n
        if heavesnow(i,j)<0.99998;
        heavesnow(i,j)=0;
        end
    end
end

%�Է������ֵ�������Ͳ���,��ô�ѩЧ��
B=[0 1 0;1 1 1;0 1 0];
heavesnow=imdilate(heavesnow,B);
heavesnow=imdilate(heavesnow,B);

%����Сѩ���㷨��ͬ��ѩ��ֻ�ǲ��������Ͳ���
lightsnow=rand(m,n);
for i=1:m
    for j=1:n
        if lightsnow(i,j)<0.999684;
        lightsnow(i,j)=0;
        end
    end
end

%����С��ͬ��ѩ������һ��
snow=heavesnow(:,:)+lightsnow(:,:);
%�ٶ�ѩ���пռ��˲��������õ�����ε�ѩ����״
window = [1,0,1,0,1;0,1,1,1,0;1,1,1,1,1;0,1,1,1,0;1,0,1,0,1]; 
snow = imdilate(snow,window); 
%�ڸ����ϵ���ѩ��Ч��
f(:,:,1)=f(:,:,1)+snow(:,:);
f(:,:,2)=f(:,:,2)+snow(:,:);
f(:,:,3)=f(:,:,3)+snow(:,:);
end