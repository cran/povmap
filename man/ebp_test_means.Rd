% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prepost_estimation_helpers.R
\name{ebp_test_means}
\alias{ebp_test_means}
\title{Perform test for difference between survey and census means}
\usage{
ebp_test_means(varlist, smp_data, pop_data, weights = NULL, pop_weights = NULL)
}
\arguments{
\item{varlist}{character vector, the set of variables of interest}

\item{smp_data}{the survey data}

\item{pop_data}{the population data}

\item{weights}{a character string containing the name of a variable that
indicates weights in the sample data. If a character string is provided
a weighted version of the ebp will be used. The variable has to be numeric.
Defaults to \code{NULL}.}

\item{pop_weights}{a character string containing the name of a variable that
indicates population weights in the populatation data. If a character string
is provided weighted indicators are estimated using population weights.
The variable has to be numeric. Defaults to \code{NULL}. Please note that
\code{pop_weights} should only be used if the samples and population data
are at different levels (e.g.: \code{smp_data} at individual level and
\code{pop_data} at household level, then \code{pop_weights} is needed for
the comparison with a variable indicating household size).}
}
\value{
dataframe with census and survey means and test results for their
difference.
}
\description{
This function computes weighted means of the same set of variables within the
census and the survey. A test for difference of the means are performed for
each variable with two-tailed p-values returned.
}
\examples{
\donttest{
data("eusilcA_pop")
data("eusilcA_smp")

variables <- c("gender", "eqsize", "cash", "self_empl",
               "unempl_ben", "age_ben", "surv_ben",
               "sick_ben", "dis_ben", "rent", "fam_allow",
               "house_allow", "cap_inv", "tax_adj")

ebp_test_means(varlist = variables,
               pop_data = eusilcA_pop,
               smp_data = eusilcA_smp,
               weights = "weight")

}

}
