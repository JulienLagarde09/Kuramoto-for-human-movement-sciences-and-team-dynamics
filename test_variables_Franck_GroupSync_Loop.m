% Examining the behavior of Richardson (& Frank) group sync variables
% Richardson, M. J., Garcia, R. L., Frank, T. D., Gergor, M., & Marsh, K. L. (2012).
% Measuring group synchrony: a cluster-phase method for analyzing multivariate
% movement time-series. Frontiers in physiology, 3, 405.
%
% get a data set of phases Subjects X time point drawn from a Gaussian distribution
%  wrappd to +-pi (von Mises would be better);
% compute the variables on this data set,
% varying the variance of the distributions as in different "trials" (for loop dstb)
%% output: correlation between Kuramoto's order param (dispersion) and Richardson variable = 1
% julien lagarde, Euromov DHM, PIAS and SemTax teams, Montpellier
% University, Labex NUMEV, 2023

close all, clear all

% say we get 1000 time points and 10 participants
time_pts = 1000;% samples values as a fct of time
partic = 100;% participants or trials

%% 
for dstb = 1:10 % varying variance of distribution of phases
% assuming normal distribution(could test other distributions, Von Mises, Lorenzian, etc...).
% randn give a normal distribution with mean 0 and variance (std) 1
B = randn(time_pts,partic);
% Varying the variance of the distribution of phases: B = A * 2 gives a variance = 4 and std = 2
A = B*dstb/3;
% bounded +- pi
A = wrapToPi(A);
% check that bounded figure,histogram(A(:)), max(max(A))

% compute the ensemble mean angle (phase) for each time point:
mean_gp_Kura = angle(sum(exp(1i*A')));
disp_gp_Kura = abs(sum(exp(1i*A')));
% individuals' phase minus group mean phase for each time point (relative phase):
phase_rel = A' - repmat(mean_gp_Kura,partic,1);% individual phase 'relative' to mean phase of group
% dispersion of relative phase over time for each Subject:
for Subj = 1:partic  
disp_phase_rel_ind_buff(Subj) =  1/length(A)*abs(sum(exp(1i*phase_rel(Subj,:))));
% mean relative phase of each Subject:
mean_phase_rel_buff(Subj) = angle(sum(exp(1i*(phase_rel(Subj,:)))));
end
% dispersion between Subject of shift (departure) of individual relative phase to his/her mean relative phase
for tim = 1:time_pts
cohere_phase_rel_buff(tim) = 1/length(A)*abs(sum(exp(1i*(phase_rel(:,tim)-mean_phase_rel_buff'))));
end

% storage accross the dstb loop

disp_gp_Kura_all(dstb,:) = disp_gp_Kura;% 10 x 1000
disp_phase_rel_ind(dstb,:) = disp_phase_rel_ind_buff;% 10 x 100
mean_phase_rel(dstb,:) = mean_phase_rel_buff;% 10 x 100
cohere_phase_rel(dstb,:) = cohere_phase_rel_buff;% 10 x 1000
% mean departure to groupe mean
mean_degree_to_group(dstb) = mean(cohere_phase_rel_buff);% 10




end% dstb


figSig = figure('Name','Richardson');
subplot(2,2,1)
plot(disp_phase_rel_ind,'o')
title('disp phase rel indiv')
subplot(2,2,2)
plot(mean_phase_rel,'o')
title('mean phase rel')
subplot(2,2,3)
plot(cohere_phase_rel,'o')
title('cohere phase rel')
subplot(2,2,4)
plot(mean_degree_to_group)
title('mean degree to group')

figSig = figure('Name','Kuramoto disp');
subplot(2,2,1)
plot(disp_gp_Kura_all,'o')
title('disp_gp_Kura')
subplot(2,2,2)
plot(cohere_phase_rel,'o')
title('cohere phase rel')

figur(3)
figure,plot(disp_gp_Kura_all,cohere_phase_rel,'.');

[rho,pval] = corr(disp_gp_Kura_all(:),cohere_phase_rel(:))