lead path
load("figure_5.mat");

ea_corrplot(improvement,sweetspot_score_default,0,{'Default','Empirical','Default Score'});
[~, p_default] = ea_permcorr(improvement', sweetspot_score_default', 'spearman')

ea_corrplot(improvement,sweetspot_score_riosetal,0,{'Rios et al','Empirical','Rios et al Score'});
[~, p_riosetal] = ea_permcorr(improvement', sweetspot_score_riosetal', 'spearman')

