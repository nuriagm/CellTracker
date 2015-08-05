% generic function to obtain the vectors for scatter plots
% length of index2 specifies whether the vectors are normalized to Dapi or
% not.
% input argument is peaks of any matfile
% the last vector (d or valuescmap) may be used if the scatter plot needs to
% be colorcoded by the expression of the index2(3) peaks column.

function [a,b,c,d] = mkVectorsForScatterAN(peaks,index2)

valuescmap = [];
valuesone =[];
valuestwo=[];
valuesthree=[];

for ii=1:length(peaks)
    if ~isempty(peaks{ii})
        if length(index2)==1
            valuesone =[valuesone; peaks{ii}(:,index2(1))];
        else
            valuestwo =[valuestwo; peaks{ii}(:,index2(1))./peaks{ii}(:,5)];          % data plotted on the x axis
            valuesthree =[valuesthree; peaks{ii}(:,index2(2))./peaks{ii}(:,5)];      % data plotted on the y axis
            if length(index2) > 2
                valuescmap = [valuesfour; peaks{ii}(:,index2(3))./peaks{ii}(:,5)];
            end
        end
    end
    
end
a = valuesone;
b = valuestwo;
c = valuesthree;
d = valuescmap;
end