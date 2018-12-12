function [ output_args ] = SampleMap( J )
%This is was going to make the map that we talked about making that one
%night, It never got finished because I was unsure what the data were were
%going to use was and where on the map it was going to fit
sy=size(J,2);
sz=size(J,1);
M=zeros(sy,sz);

for m=1:sy
    for n=1:sz
        M(m,n)=findInflectiondquiet(J(m,n));
    end
end
imagesc(M)
xlabel('y')
ylabel('z')

end

