function bw2 = c_removeBorderRegionN(bw,n,conn)
%获取与边框相连的区域，有一定的深度
L = bwlabel(bw,conn);%4表示直连才算连接，8表示斜线也算连通

for i=1:n
u = unique([L(i,1:end) L(end-i,1:end) L(1:end,i)' L(1:end,end-i)']);%获取与边框粘连的区域编号
L(ismember(L,u))=0;%保留与边框粘连的区域，这一部分为无效背景，其余清除，这样就得到了无效背景遮罩
end

bw2 = L>0;