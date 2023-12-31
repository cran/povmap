% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prepost_estimation_helpers.R
\name{ebp_compute_cv}
\alias{ebp_compute_cv}
\title{Coefficient of Variation (CV) estimations for Unit EBP Model Headcount
Estimates}
\usage{
ebp_compute_cv(
  model,
  calibvar = NULL,
  boot_type = "calibrate",
  designvar = NULL,
  threshold = NULL,
  B = model$call$B
)
}
\arguments{
\item{model}{an object returned by the ebp function of type "emdi ebp",
representing point and MSE estimates}

\item{calibvar}{the calibration variable to be used in method 1}

\item{boot_type}{the bootstrap type "calibrated" or "naive" to be used in
method 1}

\item{designvar}{the survey design variable to be used in estimating the
design effect for method 3.}

\item{threshold}{a number defining a threshold. The  argument defaults to
\code{NULL}. In this case, the threshold is set to 60\% of the median of the
variable that is selected as dependent variable similary to the
at-risk-of-poverty rate used in the EU (see also
\cite{Social Protection  Committee 2001}). However, any desired threshold can
be chosen.}

\item{B}{number of bootstrap iterations for variance estimation. Defaults
to number of bootstrap iteration in ebp obeject (specified in \code{model}).}
}
\value{
dataframe containing different types of CV values for the headcount
}
\description{
Function \code{ebp_compute_cv} estimates CVs for the headcount of the unit
model EBP functions using three different methods. CV, by definition, is the
ratio of mean square error of the head count to the  head count estimates.
Therefore, the CV types are distinguished by the method of estimating the
mean square.
}
\details{
Method 1 uses the calibrated/naive bootstrapping of the MSE which allows to
calibrate each bootstrap sample on auxiliary information using the
\code{direct} function.' Calibrated bootstrap improves on the bias of the
naive bootstrap when used in the complex survey context
(see \cite{Rao and Wu (1988)}) for more details.

Method 2 employs the Horowitz Thompson variance estimation technique to
compute MSE i.e. each household is assigned the probability selection within
the sample under a given sampling scheme. The computation employs
\code{sae::direct} function.

Method 3 finally uses the design effect adjusted naive calibrated MSE. The
design effect is estimated using the \code{survey::svydesign} function.
}
\examples{
\donttest{
data("eusilcA_pop")
data("eusilcA_smp")

# estimate a unit model
ebp_model <- ebp(fixed = eqIncome ~ gender + eqsize + cash +
                    self_empl + unempl_ben + age_ben + surv_ben + sick_ben +
                    dis_ben + rent + fam_allow + house_allow + cap_inv +
                    tax_adj,
                 pop_data = eusilcA_pop, pop_domains = "district",
                 smp_data = eusilcA_smp, smp_domains = "district",
                 na.rm = TRUE, weights = "weight",
                 pop_weights = "hhsize", MSE = TRUE, weights_type = "nlme",
                 B = 2, L = 2)

# compute CV table
ebp_compute_cv(model = ebp_model, calibvar = "gender")
}

}
