%
% Generalized function to plot infomation from Nplot number of outall
% files.
% plottype = parameter that determines whether the data needs to be devided
% into the quadrants
% plottype = 1 need to devide into quadrants: generate 'toplot,'peaksnew' and 'coloniesnew'
% plottype = 0 treat all outall miatfiles separately

function [] = plotallanalysisAN(thresh,nms,nms2,midcoord,fincoord,index1,index2,param1,param2,plottype)


if   ~exist('plottype','var')
   disp('Error: specify whether to devide the outall file into the quadrants (plottype var)')
   pause on
   pause
end 
 if    plottype==0 && size(nms2,2)>1 && size(nms,2) == 1
   disp('Error:wrong input (one of nms2, plottype or nms is incorrect}')
   pause on
   pause
end 

for k=1:size(nms,2)                                        % load the outall files (regardless of separate quadrants or not)
              
    filename{k} = ['.' filesep  nms{k} '.mat'];
        
        load(filename{k},'peaks');
        disp(['loaded file: ' filename{k}]);
        
        
end
                       
           
       if  plottype==1 % if you have only one outall matfile and you DO need to devide it into quadrants
      
        
          [toplot,peaks] = GetSeparateQuadrantImgNumbersAN(nms,filename{k},midcoord,fincoord);
        
          [newdata] = GeneralizedMeanAN(nms2,index1,param1,toplot,peaks,plottype); % 
          [b,c]=GeneralizedScatterAN(nms2,index2,param1,param2,peaks,toplot,plottype);
           GeneralizedColonyAnalysisAN(filename,thresh,nms,nms2,peaks,toplot,index1,param1,plottype);

    end 
      
           [~] = GeneralizedMeanAN(nms2,index1,param1,[],peaks,plottype); 
           [~,~]=GeneralizedScatterAN(nms2,index2,param1,param2,peaks,[],plottype);
           GeneralizedColonyAnalysisAN(filename,thresh,nms,nms2,peaks,[],index1,param1,plottype);

    
%     [valuestwo,valuesthree] = ScatterFromQuadrantsOfFullChip(Nplot,nms2,index2,param1,param2); % pot the scatter plots
%     totalcells = ANColAnalysisFromFullChip(Nplot,nms,thresh,nms2,param1,index1,midcoord,fincoord);
end






 
    




      