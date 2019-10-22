function [ bw ] = c_imclose(bw,diskSize )
se = strel('disk',diskSize);        
bw = imclose(bw,se);
end