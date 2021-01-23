function f=oilpainting(f,radius)
%�ѻҶȼ�����Ϊ100��
intensity_level=100; 
[m,n]=size(f(:,:,1));    
r=zeros(m,n);
g=zeros(m,n);
b=zeros(m,n);
R=f(:,:,1);
G=f(:,:,2);
B=f(:,:,3);
%x��yȡ��ȫ�����ص�
for x=1:m
    for y=1:n
        %��ÿһ�����ص㣬���������򣬲���������Χ�ڸ����Ҷȵȼ����ֵĴ���
        intensity_counter=zeros(intensity_level,1);
        sum_r=zeros(intensity_level,1);
        sum_g=zeros(intensity_level,1);
        sum_b=zeros(intensity_level,1);
        for i=(x-radius):(x+radius)   
            for j=(y-radius): (y+radius)
                    if i>0&&i<=m&&j>0&&j<=n 
                       intensity=round(( R(i,j)+ G(i,j)+ B(i,j))/3*intensity_level); 
   
                      %ǿ�Ȳ���Ϊ�㣬���������±�����㣬��Ϊ�㣬��������ǿ��Ϊ1
                      if intensity==0
                            intensity=1;
                      end
                       %ͳ��ǿ�ȳ��ֵĴ���
                       intensity_counter(intensity,1)= intensity_counter(intensity,1)+1;
                       %ͳ��ǿ�ȵ�R\G\B�����ĺ�
                       sum_r(intensity,1)=sum_r(intensity,1)+R(i,j);
                       sum_g(intensity,1)=sum_g(intensity,1)+G(i,j);
                       sum_b(intensity,1)=sum_b(intensity,1)+B(i,j);
                    end
            end
        end  
    %���ص㣨x��y�������������ϣ��ҳ����ִ�������ǿ��
    intensity_counter_max=max(intensity_counter);
             for i=1:intensity_level
                 if intensity_counter(i)==intensity_counter_max
                  index=i;
                 end
             end
   %�������ε�ǿ��ֵ��Ӧ���ص�r\g\b����ȡƽ��ֵ����Ϊ��ǰ���������r\g\b����
        r(x,y)=sum_r(index,1)/intensity_counter(index,1);
        g(x,y)=sum_g(index,1)/intensity_counter(index,1);
        b(x,y)=sum_b(index,1)/intensity_counter(index,1);
    end
end
%������ͨ����ֵ�ϲ����µ�ͼ��
f=cat(3,r,g,b);
end
