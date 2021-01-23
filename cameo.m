function f=cameo(f)%提取灰度层边缘并稍作处理
f=rgb2ycbcr(f);
log=[-2 -4 -4 -4 -2;
    -4 0 8 0 -4;
    -4 8 24 8 -4;
    -4 0 8 0 -4;
    -2 -4 -4 -4 -2];
Y=f(:,:,1);
g=imfilter(Y,log,'replicate');
f=f(:,:,1)-0.55*g;
end