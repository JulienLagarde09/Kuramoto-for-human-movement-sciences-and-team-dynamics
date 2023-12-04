A short note: Sometimes the order parameter of Y Kuramoto is presented as two "order parameters" (wikipedia pages for instance),
which is wrong. The physical interpretation, the meaning, of this order parameter, is both phase-coherence and mean angle.
This is given by a single complex variable. This correponds to first and second moment of the distribution of the phases of the ensemble oscillators.
References

For a great introduction: Strogatz, S. H. (2000). From Kuramoto to Crawford: exploring the onset of synchronization in populations of coupled oscillators. Physica D: Nonlinear Phenomena, 143(1-4), 1-20.
For the seminal work and textbook, which deserve to be cited each time the Kuramoto's order parameter is used:
Kuramoto, Y. (1975). Self-entrainment of a population of coupled non-linear oscillators. In International Symposium on Mathematical Problems in Theoretical Physics: January 23–29, 1975, Kyoto University, Kyoto/Japan (pp. 420-422). Springer Berlin Heidelberg.
Kuramoto, Y. (1984). Chemical oscilations, waves, and turbulence. Springer Berlin Heidelberg.

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
