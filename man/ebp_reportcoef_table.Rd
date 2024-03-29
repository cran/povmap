% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prepost_estimation_helpers.R
\name{ebp_reportcoef_table}
\alias{ebp_reportcoef_table}
\title{Produce coefficient table for reporting}
\usage{
ebp_reportcoef_table(model, decimals = 3)
}
\arguments{
\item{model}{an object returned by the ebp function of type "emdi ebp",
representing point and MSE estimates}

\item{decimals}{the number of decimals to report on coefficient estimates}
}
\value{
dataframe with regression model results
}
\description{
This function takes the object of class 'ebp' to present the regression
model results having specified the number of decimal places.
}
\examples{
\donttest{
data("eusilcA_pop")
data("eusilcA_smp")

ebp_model <- ebp(
 fixed = eqIncome ~ gender + eqsize + cash + self_empl +
   unempl_ben + age_ben + surv_ben + sick_ben + dis_ben + rent + fam_allow +
   house_allow + cap_inv + tax_adj, pop_data = eusilcA_pop,
 pop_domains = "district", smp_data = eusilcA_smp, smp_domains = "district",
 L = 2, na.rm = TRUE)

ebp_reportcoef_table(ebp_model, 4)

}

}
