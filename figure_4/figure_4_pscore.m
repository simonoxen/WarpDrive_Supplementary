lead path

t = readtable("Figure-4.csv");
improvement = t.improvement(strcmp(t.reg_method,'ANTs'));
sweetspot_score_default = t.sweetspot_score(strcmp(t.reg_method,'ANTs'));
sweetspot_score_riosetal = t.sweetspot_score(strcmp(t.reg_method,'ANTs+WD'));

[~, p_default] = ea_permcorr(improvement, sweetspot_score_default, 'spearman')

[~, p_riosetal] = ea_permcorr(improvement, sweetspot_score_riosetal, 'spearman')

