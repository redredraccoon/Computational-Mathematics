%N琌?誹だぶ?
%data琌?ぃ?だ????誹
%u琌–?いみ
%re琌?だ????誹
function [u re]=KMeans(data,N)   
    [m n]=size(data);   %m琌?誹??n琌?誹??
    ma=zeros(n);        %–?程?
    mi=zeros(n);        %–?程?
    u=zeros(N,n);       %?审﹍て程?–?いみ竚
    for i=1:n
       ma(i)=max(data(:,i));    %–?程?
       mi(i)=min(data(:,i));    %–?程?
       for j=1:N
            u(j,i)=ma(i)+(mi(i)-ma(i))*rand();  %?审﹍てぃ??琌–?[min max]い﹍てㄇ
       end      
    end
   
    while 1
        pre_u=u;            %Ω―眔いみ竚
        for i=1:N
            tmp{i}=[];      % そΑいx(i)-uj,?そΑ??暗?
            for j=1:m
                tmp{i}=[tmp{i};data(j,:)-u(i,:)];
            end
        end
        
        quan=zeros(m,N);
        for i=1:m        %そΑ??
            c=[];
            for j=1:N
                c=[c norm(tmp{j}(i,:))];
            end
            [junk index]=min(c);
            quan(i,index)=norm(tmp{index}(i,:));           
        end
        
        for i=1:N            %そΑ??
           for j=1:n
                u(i,j)=sum(quan(:,i).*data(:,j))/sum(quan(:,i));
           end           
        end
        
        if norm(pre_u-u)<0.1  %ぃ?竚ぃ?て
            break;
        end
    end
    
    re=[];
    for i=1:m
        tmp=[];
        for j=1:N
            tmp=[tmp norm(data(i,:)-u(j,:))];
        end
        [junk index]=min(tmp);
        re=[re;data(i,:) index];
    end
    
end