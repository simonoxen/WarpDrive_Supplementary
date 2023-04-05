lead path;
load("figure_2.mat")

f = ea_corrplot(sparead, dice, 'no', {'', 'SPARE-AD (larger values, larger atrophy)', 'DICE (manual vs automatic segmentation)'});

scatter(f.Children(3), sparead(cellfun(@(x) find(strcmp(sparead_ids, x)), wd_subs)), wd_dice, [], 'k');

