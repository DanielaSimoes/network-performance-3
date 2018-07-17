function [ val ] = distance( connectedAS )
    for k = 1:40
        labels = zeros(1,40);         
        labels(:) = -1;
        labels(k) = 0;
        for a = 0:1
            for i = 1:size(connectedAS,1)
                index_1 = connectedAS(i,1);
                index_2 = connectedAS(i,2);
                if labels(index_1) == a && labels(index_2) == -1
                    labels(index_2) = a + 1;
                elseif labels(index_2) == a && labels(index_1) == -1
                    labels(index_1) = a + 1;
                end
            end
        end
        val(k, :) = labels;
    end
    val(val>=0) = 1;
    val(val<0) = 0;
end