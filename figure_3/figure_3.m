lead path
load('figure_3.mat','out');

datasets_name = {'default','riosetal'};

X = [zeros(size(out.(datasets_name{1}))); ones(size(out.(datasets_name{1})))];
Y = [-out.(datasets_name{1}); -out.(datasets_name{2})];

[h,~,~,~] = ea_raincloud(X,Y,datasets_name);
linkaxes(h.Children,'x');

[~,P,~,stat] = ttest(-out.(datasets_name{1}), -out.(datasets_name{2}), 'tail', 'left')
