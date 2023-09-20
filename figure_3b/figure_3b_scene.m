lead path;
load('figure_3b_scene.mat')


%% figures

load('coords_pre_post_v1','v1')
out(1).FaceColor = '#E25A38';
out(2).FaceColor = '#00DED3';

togglestates = struct;
togglestates.xyzmm = [-30 -20 -20];
togglestates.xyztoggles = [0 1 1];
togglestates.xyztransparencies = [100 100 100];
% put these in ea_defaultview
% togglestates.refreshcuts = 1;
% togglestates.template = 'Edlow MNI 100um biasfield';

for i = 1:length(out)

    f = ea_mnifigure_fornix;
    add_spheres(out(i).active_coords, out(i).FaceColor, 0.6, 0.2);    
    add_spheres(out(i).mean_coord_left, '#FFFFFF', 1, 0.6);    
    add_spheres(out(i).mean_coord_right, '#FFFFFF', 1, 0.6);    
    f.Position=[73   196   499   683];
    ea_defaultview(v1,togglestates);
    saveas(f,['coords_pre_post_mni3-' out(i).info '.png'])
    % close all;
    
end

f = ea_mnifigure_fornix;

for i = 1:length(out)
    add_spheres(out(i).active_coords, out(i).FaceColor, 0.4, 0.2);
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
