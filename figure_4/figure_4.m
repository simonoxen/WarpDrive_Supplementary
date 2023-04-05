lead path;
load('figure_4.mat')

%% ttest

X = [];
Y = [];
for i = 1:length(out)
    vals = out(i).('distance_to_mean_coord');
    X = [X (i-1)*ones(1,length(vals))];
    Y = [Y vals'];
end

ea_raincloud(X,Y,{out.info});
[~,P,~,stat]=ttest(out(1).distance_to_mean_coord, out(2).distance_to_mean_coord, 'tail', 'right')


%% figures

load('coords_pre_post_v1','v1')
out(1).FaceColor = '#963902';
out(2).FaceColor = '#5CCCCC';

togglestates = struct;
togglestates.xyzmm = [-30 -20 -20];
togglestates.xyztoggles = [0 1 1];
togglestates.xyztransparencies = [100 100 100];
% put these in ea_defaultview
% togglestates.refreshcuts = 1;
% togglestates.template = 'Edlow MNI 100um biasfield';

for i = 1:length(out)

    f = ea_mnifigure_fornix;
    add_spheres(out(i).active_coords, out(i).FaceColor, 0.8, 0.3);    
    add_spheres(out(i).mean_coord_left, '#FFFFFF', 1, 0.5);    
    add_spheres(out(i).mean_coord_right, '#FFFFFF', 1, 0.5);    
    f.Position=[73   196   499   683];
    ea_defaultview(v1,togglestates);
    saveas(f,['coords_pre_post_mni3-' out(i).info '.png'])
    % close all;
    
end

f = ea_mnifigure_fornix;

for i = 1:length(out)
    add_spheres(out(i).active_coords, out(i).FaceColor, 0.3, 0.3);
end

active_coords_diff = out(2).active_coords - out(1).active_coords;
q = quiver3(out(1).active_coords(:,1), out(1).active_coords(:,2), out(1).active_coords(:,3),...
        active_coords_diff(:,1), active_coords_diff(:,2), active_coords_diff(:,3),...
        'AutoScale', 'off',...
        'Color', '#FFFFFF',...
        'LineWidth', 2);
  
f.Position=[73   196   499   683];
ea_defaultview(v1,togglestates);
saveas(f, 'coords_pre_post_mni3-all.png')
% close all;

%% Aux

function [] = add_spheres(coords, color, alpha, r)

[X,Y,Z] = sphere(64);
% r = 0.3;

for j = 1:size(coords,1)

    surf(X*r + coords(j,1),...
         Y*r + coords(j,2),...
         Z*r + coords(j,3),...
         'EdgeColor', 'none',...
         'FaceColor', color,...
         'FaceAlpha', alpha);
end

end

function f = ea_mnifigure_fornix()

f = ea_mnifigure;


fornix_file_lh = fullfile(ea_space,'atlases','Atlas of the Human Hypothalamus (Neudorfer & Germann 2020)','lh','fornix.nii.gz');
pobj.plotFigureH = f;
pobj.color = '#C5B644';
ea_roi(fornix_file_lh, pobj);

fornix_file_rh = fullfile(ea_space,'atlases','Atlas of the Human Hypothalamus (Neudorfer & Germann 2020)','rh','fornix.nii.gz');
pobj.plotFigureH = f;
pobj.color = '#C5B644';
ea_roi(fornix_file_rh, pobj);

end
