function [maskC, statsN] = image2peaks(red, gr)
%
% [maskC, statsN] = segmentCells(red0, gr0)
%
% Input a red nuclear image and a green (cytoplasmic + nuc) image.
% Find nuclei and define a mask for the union of all cells, based on
% thresholding the green.
% If gr0 = [], just find nuclei and quit (maskC is then the nuclear mask)
% The struct array, statsN, has at least the fields,
%   Centroid   xy positions of nuclear centers
%   PixelIdxList  the pixels of the nuclear mask for each nuclei
%
% AW 11/25/14 -- removed smoothing from here, will do beforehand. 
% also removed all methods except for countNucCtr which is the only one in
% use

global userParam;

%make sure the field userParam.errorstr exists
if ~isfield(userParam,'errorStr')
    userParam.errorStr=[];
end

% look at each V-polygon and use either grad(gr) or fraction of max to
% define cyto for each cell. MaskC = mask for cells == cyto + nuclei. Redefine
% the Vpolygons since nuclei have been eliminated since last call
statsN = addVoronoiPolygon2Stats(statsN, size(red));

%Loop over non-nuclear fluoresence channels. run edgeThreshCyto once
% for each
maskC=zeros(size(gr));
for ii=1:size(gr,3)
    [maskC(:,:,ii), statsN] = edgeThreshCyto(gr(:,:,ii), statsN, maskN,ii);
end

%cyto mask is 1 if included in any of the individual masks
maskC=any(maskC,3);

return


