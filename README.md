# Kuramoto-for-human-movement-sciences-and-team-dynamics
test on random data some variables inspired by Yoshiki Kuramoto, the Jedi of population synchronization.
Examining the behavior of Richardson (& Frank) group sync variables, and whether they correlate with Kuramoto's  order parameter.
Richardson, M. J., Garcia, R. L., Frank, T. D., Gergor, M., & Marsh, K. L. (2012).
Measuring group synchrony: a cluster-phase method for analyzing multivariate
movement time-series. Frontiers in physiology, 3, 405.

get a data set of phases Subjects X time point drawn from a Gaussian distribution
 wrapped to +-pi (von Mises would be better);
compute the variables on this data set,
varying the variance of the distributions as in different "trials" (for loop dstb)
Output: Correlation between Kuramoto's order param (dispersion) and Richardson variable = 1
julien lagarde, Euromov DHM, PIAS and SemTax teams, Montpellier
University, Labex NUMEV, 2023
