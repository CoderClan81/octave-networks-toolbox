% The number of pairs of nodes at a distance x, 
%                      divided by the total number of pairs n(n-1)
% Source: Mahadevan et al, "Systematic Topology Analysis and
%                            Generation Using Degree Correlations"
% Note: The cumulative distance distribution (hop-plot) can be 
% obtained by using  ddist(i)=length(find(dij<=i)); in line 28 instead.
%
% INPUTS: adjacency matrix, (nxn)
% OUTPUTS: distribution vector ((n-1)x1): {k_i} where k_i is the 
%                 number of node pairs at a distance i, normalized
%
% Other routines used: simpleDijkstra.m
% GB: last updated, Oct 10 2012

function ddist=distanceDistribution(adj)

n=size(adj,1);

dij=[];
for i=1:n; dij=[dij; simpleDijkstra(adj,i) ]; end

dij(find(dij==0))=inf; % not considering (i-i) node pairs/loops,
                       % otherwise divide ddist by n^2

ddist=[];
for i=1:n-1; ddist(i)=length(find(dij==i)) / (n*(n-1)); end