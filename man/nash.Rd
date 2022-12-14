% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nash.R
\name{nash}
\alias{nash}
\title{Computes harvesting rates at the Nash Equilibrium}
\usage{
nash(par, fn, ..., method = "LV", yield.curves = FALSE, conv.criterion = 0.001,
 Bcons = 0, F.increase = 0.1)
}
\arguments{
\item{par}{Numeric vector of harvesting rates of length equal to the number of
harvested species.}

\item{fn}{Function that runs the ODE model with \code{par} as input and
returns simulated yields at equilibrium.}

\item{...}{Further arguments to be passed to \code{fn}.}

\item{method}{Method utilised to compute the Nash Equilibrium:
(i) `\code{LV}` or (ii) `\code{round-robin}` method.}

\item{conv.criterion}{Absolute convergence tolerance set by default to
\eqn{< 0.001}.}

\item{Bcons}{Biomass conservation threshold. Default set to \eqn{0}.}

\item{F.increase}{Double type numeric vector indicating the step size used
to compute the interaction matrix.}

\item{yield.cruves}{Logical TRUE/FALSE if equilibrium yield curves for each
species are desired.}
}
\value{
The function \code{nash} returns a list with the following components:
\item{par}{Harvesting rates at the Nash Equilibrium.}
\item{value}{Value of \code{fn} corresponding to the optimised \code{par}.}
\item{counts}{Number of calls to \code{fn}.}
\item{convergence}{Statement indicating the number of iterations for
\code{conv.criterion} to be reached.}
}
\description{
Function that takes a numeric vector `\code{par}` of initial harvesting rates
to be optimised by evaluating the objective function `\code{fn}` that is to
be maximised. Its structure in terms of arguments and outputs is analogous
to that of \code{\link{optim}}.
}
\details{
For ecosystem models where there is some interest in keeping some or
all harvested species above a certain biomass state limit, \code{Bcons}
should be populated with non zero biomass values. The length of this vector
must be the same as \code{par} and set to non zero where relevant. In the
literature, is common practice to fixed such \emph{constraint of biodiversity
conservation} \insertCite{Matsuda2006}{nash} to \eqn{10%} of the virgin
biomass; level at which a stock is considered collapsed
\insertCite{Worm2009}{nash}.

\loadmathjax
Equilibrium yield curves are obtained for each \eqn{i} species by applying
different harvesting values to \eqn{i} whilst keeping the other species
\eqn{j} at the optimised \code{par} levels (\emph{i.e.} at the Nash
Equilibrium). These harvesting values applied to \eqn{i} run from \eqn{0}
to \mjeqn{F_{\text{Nash},i}\times 2}{ascii} in increments of \eqn{0.025}.
As raised by \insertCite{Thorpe2017;textual}{nash}, this is
one of the advantages of using the Nash Equilibrium as a representation of
the \emph{Maximum Sustainable Yield} concept.

To compute the interaction matrix a second order central difference quotient
is used to approximate derivatives. \code{F.increase} is employed during
this calculation as a step-size set by default to \eqn{0.1} to avoid
truncation and/or rounding errors \insertCite{Pope2019}{nash}.

The `\code{LV}` method is set by default given its performance advantage
over the `\code{round-robin}` method and is based on the protocol devised by
\insertCite{Farcas2016}{nash}. For each species \eqn{i} in turn,
\code{round-robin} iteratively maximises the yield by adjusting the harvesting
rates whereas \code{LV} does the same for all species at once per iteration.
}
\references{
\insertRef{Matsuda2006}{nash}

\insertRef{Worm2009}{nash}

\insertRef{Thorpe2017}{nash}

\insertRef{Pope2019}{nash}

\insertRef{Farcas2016}{nash}

\insertRef{Lucey2020}{nash}
}
