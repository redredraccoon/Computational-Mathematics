%N�O?�u�@�@���h��?
%data�O?�J����?��???��?�u
%u�O�C�@?������
%re�O��^��?��???��?�u
function [u re]=KMeans(data,N)   
    [m n]=size(data);   %m�O?�u??�An�O?�u??
    ma=zeros(n);        %�C�@?�̤j��?
    mi=zeros(n);        %�C�@?�̤p��?
    u=zeros(N,n);       %?���l�ơA��?���N��C�@?�����ߦ�m
    for i=1:n
       ma(i)=max(data(:,i));    %�C�@?�̤j��?
       mi(i)=min(data(:,i));    %�C�@?�̤p��?
       for j=1:N
            u(j,i)=ma(i)+(mi(i)-ma(i))*rand();  %?���l�ơA��??�O�b�C�@?[min max]����l�Ʀn��
       end      
    end
   
    while 1
        pre_u=u;            %�W�@���D�o�����ߦ�m
        for i=1:N
            tmp{i}=[];      % �����@����x(i)-uj,?�����@??����?
            for j=1:m
                tmp{i}=[tmp{i};data(j,:)-u(i,:)];
            end
        end
        
        quan=zeros(m,N);
        for i=1:m        %�����@��??
            c=[];
            for j=1:N
                c=[c norm(tmp{j}(i,:))];
            end
            [junk index]=min(c);
            quan(i,index)=norm(tmp{index}(i,:));           
        end
        
        for i=1:N            %�����G��??
           for j=1:n
                u(i,j)=sum(quan(:,i).*data(:,j))/sum(quan(:,i));
           end           
        end
        
        if norm(pre_u-u)<0.1  %��?���N�����m���A?��
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