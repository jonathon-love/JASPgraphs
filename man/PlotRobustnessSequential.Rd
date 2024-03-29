% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PlotRobustnessSequential.R
\name{PlotRobustnessSequential}
\alias{PlotRobustnessSequential}
\title{Create a robustness or sequential plot}
\usage{
PlotRobustnessSequential(dfLines, dfPoints = NULL, BF = NULL,
  hasRightAxis = TRUE, xName = NULL, yName = NULL,
  addEvidenceArrowText = TRUE, drawPizzaTxt = !is.null(BF),
  evidenceLeveltxt = !is.null(BF), pointLegend = !is.null(dfPoints),
  linesLegend = !is.null(dfLines$g), bfSubscripts = NULL,
  pizzaTxt = hypothesis2BFtxt(hypothesis)$pizzaTxt, bfType = c("BF01",
  "BF10", "LogBF10"), hypothesis = c("equal", "smaller", "greater"),
  pointColors = c("red", "grey", "black", "white"),
  lineColors = c("black", "grey", "black"), lineTypes = c("dotted",
  "solid", "solid"), addLineAtOne = TRUE, bty = list(type = "n", ldwX =
  0.5, lwdY = 0.5), plotLineOrPoint = c("line", "point"), ...)
}
\arguments{
\item{dfLines}{A dataframe with \code{$x}, \code{$y}, and optionally \code{$g}. \code{$y} is assumed to be on the log scale.}

\item{dfPoints}{A dataframe with \code{$x}, \code{$y}, and optionally \code{$g}.}

\item{BF}{Numeric, with value of Bayes factor. This MUST correspond to bfType.}

\item{hasRightAxis}{Logical, should there be a right axis displaying evidence?}

\item{xName}{String or expression, displayed on the x-axis.}

\item{yName}{String or expression, displayed on the y-axis.}

\item{addEvidenceArrowText}{Logical, should arrows indicating "Evidence for H0/H1" be drawn?}

\item{drawPizzaTxt}{Logical, should there be text above and below the pizza plot?}

\item{evidenceLeveltxt}{Logical, should "Evidence for H0: extreme" be drawn?
Ignored if \code{!is.null(dfLines$g) && linesLegend}.}

\item{pointLegend}{Logical, should a legend of \code{dfPoints$g} be shown?}

\item{linesLegend}{Logical, should a legend of \code{dfLines$g} be shown?}

\item{bfSubscripts}{String, manually specify the BF labels.}

\item{pizzaTxt}{String vector of length 2, text to be drawn above and below pizza plot.}

\item{bfType}{String, what is the type of BF? Options are "BF01", "BF10", or "LogBF10".}

\item{hypothesis}{String, what was the hypothesis? Options are "equal", "smaller", or "greater".}

\item{pointColors}{String vector, colors for points if \code{dfPoints$g} is not \code{NULL}.}

\item{lineColors}{String vector, colors for lines if \code{dfLines$g} is not \code{NULL}.}

\item{lineTypes}{String vector, line types if \code{dfLines$g} is not \code{NULL}.}

\item{addLineAtOne}{Logical, should a black line be draw at BF = 1?}

\item{bty}{List of three elements. Type specifies the box type, ldwX the width of the x-axis, lwdY the width of the y-axis.}

\item{plotLineOrPoint}{String, should the main geom in the plot be a line or a point?}

\item{...}{Unused.}
}
\description{
Create a robustness or sequential plot
}
\examples{
n <- 100
dfLines <- data.frame(
  x = seq_len(n),
  y = c(0, rnorm(n - 1, seq_len(n - 1) / 30, .5)) # log Bayes factor
)

PlotRobustnessSequential(
  dfLines      = dfLines,
  xName        = "n",
)

BF10 <- exp(tail(dfLines, 1)$y)
PlotRobustnessSequential(
  dfLines      = dfLines,
  xName        = "n",
  BF           = BF10,
  bfType       = "BF10"
)
}
