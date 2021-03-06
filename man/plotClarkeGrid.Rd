% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/plots.R
\name{plotClarkeGrid}
\alias{plotClarkeGrid}
\title{Plot a Clarke Error Grid}
\usage{
plotClarkeGrid(referenceVals, testVals, title = "Clarke Error Grid",
  xlab = "Reference Glucose Concentration (mg/dL)",
  ylab = "Test Glucose Concentration (mg/dL)", linesize = 0.5,
  linetype = "solid", linecolor = "black", linealpha = 0.6,
  pointsize = 2, pointalpha = 1, zones = NA)
}
\arguments{
\item{referenceVals}{A vector of glucose values obtained via the reference
method.}

\item{testVals}{A vector of glucose values obtained via a non-reference
method (e.g. a new meter). The values in this vector are paired with those
in \code{referenceVals}, so the length should be the same.}

\item{title}{The main plot title. Defaults to "Clarke Error Grid".}

\item{xlab}{The x-axis label. Defaults to "Reference Glucose
Concentration (mg/dL)".}

\item{ylab}{The y-axis label. Defaults to "Test Glucose Concentration
(mg/dL)".}

\item{linesize}{The size to be used when drawing the zone lines. The
acceptable values are the same as for \code{\link[ggplot2]{geom_segment}}.
The default is 0.5.}

\item{linetype}{The type of line to be used when drawing the zone lines. The
acceptable values are the same as for \code{\link[ggplot2]{geom_segment}}.
The default is "solid".}

\item{linecolor}{The color of the zone lines. The acceptable values are the
same as for \code{\link[ggplot2]{geom_segment}}.
The default is "black".}

\item{linealpha}{The alpha (transparency) level to be used when drawing
the zone lines. The acceptable values are the same as for
\code{\link[ggplot2]{geom_segment}}. The default is 0.6.}

\item{pointsize}{The size to be used when plotting the glucose data points.
The acceptable values are the same as for \code{\link[ggplot2]{geom_point}}.
The default is 2.}

\item{pointalpha}{The alpha (transparency) level to be used when plotting
the glucose data points. The acceptable values are the same as for
\code{\link[ggplot2]{geom_point}}. The default is 1.}

\item{zones}{An optional character vector specifying the Clarke zones
for each paired value. If this is not supplied, \code{\link{getClarkeZones}}
will be called to generate zone labels.}
}
\value{
A \code{\link[ggplot2]{ggplot}} object is returned. If the return
value is not assigned, a plot is drawn.
}
\description{
The function uses \code{\link[ggplot2]{ggplot}} to draw the
Clarke error grid lines according to the criteria described in the
original publication by Clarke et. al. (see reference below). If zones
have not already been assigned via the \code{zones} parameter, the
function \code{\link{getClarkeZones}} is called first. The values in
\code{referenceVals} and \code{testVals} are then superimposed as a scatter
plot. Some basic plot parameters can be specified as arguments, but the
return value can also be stored and modified further before plotting
(see examples and vignette).
}
\examples{
library(ggplot2)

# default
plotClarkeGrid(glucose_data$ref, glucose_data$test)

# with options
plotClarkeGrid(glucose_data$ref, glucose_data$test,
              pointsize=1.5,
              pointalpha=0.6,
              linetype="dashed")

# store return value and modify
ceg <- plotClarkeGrid(glucose_data$ref, glucose_data$test)

ceg + theme_gray() +
   theme(plot.title = element_text(size = rel(2), colour = "blue"))
}
\references{
Clarke, W. L., D. Cox, L. A. Gonder-Frederick, W. Carter, and S. L. Pohl.
"Evaluating Clinical Accuracy of Systems for Self-Monitoring of Blood
Glucose." Diabetes Care 10, no. 5 (September 1, 1987): 622-28.
}
\seealso{
\code{\link{getClarkeZones}} \code{\link[ggplot2]{ggplot}}
}

