function bwMax = c_getMaxRegion(bw)
%�п��ܻ��ж�����е�һ������
bwLabel =bwlabeln(bw);
stats = regionprops(bwLabel,'Area');    %�����ͨ��Ĵ�С  
area = cat(1,stats.Area);
index = find(area == max(area));        %�������ͨ�������  
bwMax = ismember(bwLabel,index);          %��ȡ�����ͨ��ͼ��Ϊʲôlabel.idx�պú�stats.index��ͬ��