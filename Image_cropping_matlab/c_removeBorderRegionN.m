function bw2 = c_removeBorderRegionN(bw,n,conn)
%��ȡ��߿�������������һ�������
L = bwlabel(bw,conn);%4��ʾֱ���������ӣ�8��ʾб��Ҳ����ͨ

for i=1:n
u = unique([L(i,1:end) L(end-i,1:end) L(1:end,i)' L(1:end,end-i)']);%��ȡ��߿�ճ����������
L(ismember(L,u))=0;%������߿�ճ����������һ����Ϊ��Ч��������������������͵õ�����Ч��������
end

bw2 = L>0;