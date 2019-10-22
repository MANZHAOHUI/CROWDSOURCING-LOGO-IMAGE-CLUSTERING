function bwMax = c_getMaxRegion(bw)
%有可能会有多个并列第一的区域
bwLabel =bwlabeln(bw);
stats = regionprops(bwLabel,'Area');    %求各连通域的大小  
area = cat(1,stats.Area);
index = find(area == max(area));        %求最大连通域的索引  
bwMax = ismember(bwLabel,index);          %获取最大连通域图像，为什么label.idx刚好和stats.index相同？