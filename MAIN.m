clc;
clear all;
close all;
pkg load image
I=imread('V:\vit\SEM-6\NIS\project\lena.jpg');
I=rgb2gray(I);
k=randi(20,1,50);
[m,n]=size(I);
Q=cell(1,(m/8)*(n/8));
temp=1;
subplot(1,2,1)
imshow(I);
subplot(1,2,2)
imhist(I);
for ii=1:8:m
    for jj=1:8:n
        v=I(ii:ii+7,jj:jj+7);
        t=1;
        for ll=1:length(k)
            
            for kk=1:k(t)
                if mod(ll,2)==0
                    v=Rightmap(v,8);
                else
                    v=Leftmap(v,8);
                end
            end
            t=t+1;
        end
       Q(temp)={v};
       temp=temp+1;
    end
end

Q=reshape(Q,m/8,n/8)';

for ii=1:8:m/8
    for jj=1:8:n/8
        v=Q(ii:ii+7,jj:jj+7);
        t=1;
        for ll=1:length(k)
            for kk=1:k(t)
                if mod(ll,2)==0
                    v=Rightmap(v,8);
                    print("Hii");
                else
                    v=Leftmap(v,8);
                end
            end
            t=t+1;
        end
       R(ii:ii+7,jj:jj+7)=v;
    end
end
M=cell2mat(R);
M=uint8(M);
figure();
subplot (1,2,1)
imshow(M);
subplot(1,2,2)
imhist(M);

M=M(:);
for ii=2:length(M)
    M(ii)= bitxor(M(ii),M(ii-1));
end

M=reshape(M,m,n);
figure();
subplot(1,2,1)
imshow(M);
subplot(1,2,2)
imhist(M);
