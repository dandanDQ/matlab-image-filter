function f=hsi2rgb(f)
H=f(:,:,1)*pi*2;
S=f(:,:,2);
I=f(:,:,3);
[m,n]=size(f(:,:,1));
R=zeros(m,n);
G=zeros(m,n);
B=zeros(m,n);

idx=find((0<=H)&(H<2*pi/3));
B(idx)=I(idx).*(1-S(idx));
R(idx)=I(idx).*(1+S(idx).*cos(H(idx))./cos(pi/3-H(idx)));
G(idx)=3*I(idx)-(R(idx)+B(idx));

idx=find((2*pi/3<=H)&(H<4*pi/3));
R(idx)=I(idx).*(1-S(idx));
G(idx)=I(idx).*(1+S(idx).*cos(H(idx)-2*pi/3)./cos(pi-H(idx)));
B(idx)=3*I(idx)-(R(idx)+G(idx));

idx=find((4*pi/3<=H)&(H<=2*pi));
G(idx)=I(idx).*(1-S(idx));
B(idx)=I(idx).*(1+S(idx).*cos(H(idx)-4*pi/3)./cos(5*pi/3-H(idx)));
R(idx)=3*I(idx)-(G(idx)+B(idx));

rgb=cat(3,R,G,B);
f=max(min(rgb,1),0);
end