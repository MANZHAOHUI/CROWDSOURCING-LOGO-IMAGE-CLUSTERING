maindir = 'e:\crowdsourcing\cropped_images\img_c';
subdir  = dir(maindir);
%20190405 0749
for i = 1 : length( subdir )
    if( isequal( subdir( i ).name, '.' )||isequal( subdir( i ).name, '..')...
            ||~subdir( i ).isdir)               % 如果不是目录则跳过
        continue;
    end
    subdirpath = fullfile( maindir, subdir(i).name, '*.*' );
    dat = dir( subdirpath );               % 子文件夹下找后缀为dat的文件
    for j = 1 : length(dat)
        if( isequal( dat( j ).name, '.' )||isequal( dat( j ).name, '..'))
            continue;
        end
        fn = fullfile( maindir, subdir(i).name, dat(j).name);
        try
            im = imread(fn);
            gray = im;
            if ~ismatrix(im)
                gray = rgb2gray(im);
            end
            gray = imresize(gray,[250 250]);
            bw = edge(gray,'Canny',0.1);
            % bw = imresize(bw,2);
            bw = c_removeBorderRegionN(bw,2,8);
            bw = c_imclose(bw,5);
            bw = c_getMaxRegion(bw);
            bw = bwconvhull(bw);
            %         imshow(bw);
            [f,c]=find(bw);%寻找出所有非零元素的位置,f是横坐标向量,c是纵坐标向量。
            im2 = gray.*uint8(bw);
            im2(~bw)=255;%将黑色背景改为白色
            
            img_out = im2(min(f):max(f),min(c):max(c));%将图像四周的白点去掉
            [w h] = size(img_out);
            if (w==0 || h==0)
                continue;
            end
            img_out = imresize(img_out,[250 250]);
            
            imwrite(img_out,fn);
        catch
            continue;
        end
    end
end