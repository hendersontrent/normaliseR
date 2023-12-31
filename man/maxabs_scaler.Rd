% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rescalers.R
\name{maxabs_scaler}
\alias{maxabs_scaler}
\title{Rescales a numeric vector using maximum absolute scaling}
\usage{
maxabs_scaler(x)
}
\arguments{
\item{x}{\code{numeric} vector}
}
\value{
\code{numeric} vector
}
\description{
\eqn{z_{i} = \frac{x_{i}}{\text{max}(\mathbf{x})}}
}
\author{
Trent Henderson
}
