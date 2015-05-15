

function [b,c]=GeneralizedScatterAN(nms2,index2,param1,param2,peaks,toplot,plottype)

colors = {'r','g','b','k'};

if plottype == 1 % need to separate into quadrants
    
    for j=1:size(toplot,2)
        peaksnew=[];
        for k=1:length(toplot{j})
            peaksnew{k} =  peaks{toplot{j}(k)};
        end
        
        [a,b,c,d] = mkVectorsForScatterAN(peaksnew,index2);
        
        limit1(j) = max(b);
        limit2(j) = max(c);
        
        
        if length(index2)==1
            figure(2),  subplot(2,2,j),plot(a,colors{j},'marker','*'), legend(nms2{j});
        else
            figure(2), subplot(2,2,j),scatter(b,c,colors{j}), legend(nms2{j});hold on
        end
        if length(index2)>2
            figure(2),  subplot(2,2,j),scatter(b,c,[],d), legend(nms2{j});hold on
        end
        
        
        xlabel(param1);
        ylabel(param2);
        
        
        limit1 = max(limit1);
        limit2 = max(limit2);
        for xx=1:size(nms2,2)
            figure(2), subplot(2,2,xx)
            
            xlim([0 limit1]);
            ylim([0 limit2]);
        end
    end
end
if plottype == 0
    for j=1:size(nms2,2)
        [a,b,c,d] = mkVectorsForScatterAN(peaks,index2);
        
        limit1(j) = max(b);
        limit2(j) = max(c);
        
        
        if length(index2)==1
            figure(2),  subplot(2,2,j),plot(a,colors{j},'marker','*'), legend(nms2{j});
        else
            figure(2), subplot(2,2,j),scatter(b,c,colors{j}), legend(nms2{j});hold on
        end
        if length(index2)>2
            figure(2),  subplot(2,2,j),scatter(b,c,[],d), legend(nms2{j});hold on
        end
        
        
        xlabel(param1);
        ylabel(param2);
        
        
        limit1 = max(limit1);
        limit2 = max(limit2);
        for xx=1:size(nms2,2)
            figure(2), subplot(2,2,xx)
            
            xlim([0 limit1]);
            ylim([0 limit2]);
        end
    end
end

end


    

  