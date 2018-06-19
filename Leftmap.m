function B=Leftmap(A,N)

checkcell=iscell(A);
if checkcell==0
    L=zeros(1,N^2);
    d=diag(A);
else
    L=cell(1,N^2);
    d=cell(1,N);
    t=1;
    for ii=1:N
        for jj=1:N
            if ii==jj
                d(t)=A(ii,jj);
                t=t+1;
            end
        end
    end
end 

t=1;
for ii=1:2:N^2
    L(ii)=d(t);
    t=t+1;
    if t>length(d)
        break
    end
end

for ii=1:N
    for jj=1:N
        if ii<jj
            if mod(jj-ii,2)==0
                L((2*ii+(jj-ii)*N-(jj-ii)*(jj-ii-1)/2)-1)=A(ii,jj);
            elseif mod(jj-ii,2)==1
                L((((2*ii)+1)+((jj-ii-1)*N)-((jj-ii-1)*(jj-ii-2)/2))-1)=A(ii,jj);
            end
        elseif ii>jj
            if ((mod(ii-jj,2)==0) && (ii-jj==4))
                L((((N^2+N)/2)+((2*jj)+1)+((ii-jj-2)*N)-(((jj-ii-1)*(jj-ii-2))/2))+11)=A(ii,jj);
            elseif ((mod(ii-jj,2)==0) && (ii-jj==6))
                 L((((N^2+N)/2)+((2*jj)+1)+((ii-jj-2)*N)-(((jj-ii-1)*(jj-ii-2))/2))+17)=A(ii,jj);             

            elseif  ((mod(ii-jj,2)~=0) && (ii-jj==3))
                L((((N^2+N)/2)+(2*jj)+((ii-jj-1)*N)-(((jj-ii)*(jj-ii-1))/2))+2)=A(ii,jj);  
            elseif  ((mod(ii-jj,2)~=0) && (ii-jj==5))
                L((((N^2+N)/2)+(2*jj)+((ii-jj-1)*N)-(((jj-ii)*(jj-ii-1))/2))+4)=A(ii,jj); 
            elseif   ((mod(ii-jj,2)~=0) && (ii-jj==7))
                L((((N^2+N)/2)+(2*jj)+((ii-jj-1)*N)-(((jj-ii)*(jj-ii-1))/2))+6)=A(ii,jj); 
            elseif (mod(ii-jj,2)==0)
                L((((N^2+N)/2)+((2*jj)+1)+((ii-jj-2)*N)-(((jj-ii-1)*(jj-ii-2))/2))+5)=A(ii,jj);
            else
                L((((N^2+N)/2)+(2*jj)+((ii-jj-1)*N)-(((jj-ii)*(jj-ii-1))/2)))=A(ii,jj);
            end
        end
    end
end


B=reshape(L,N,N)';

end