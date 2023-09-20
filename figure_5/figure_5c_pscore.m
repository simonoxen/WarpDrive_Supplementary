lead path

t = readtable("../figure_4/Figure-4.csv");
improvement = t.improvement(strcmp(t.reg_method,'ANTs'));
sweetspot_score_default = t.sweetspot_score(strcmp(t.reg_method,'ANTs'));
sweetspot_score_riosetal = t.sweetspot_score(strcmp(t.reg_method,'ANTs+WD'));
sweetspot_score_easyreg = t.sweetspot_score(strcmp(t.reg_method,'EasyReg'));

[~, p_default] = ea_permcorr(improvement, sweetspot_score_default, 'spearman')

[~, p_riosetal] = ea_permcorr(improvement, sweetspot_score_riosetal, 'spearman')

[~, p_easyreg] = ea_permcorr(improvement, sweetspot_score_easyreg, 'spearman')


