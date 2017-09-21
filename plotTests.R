rm(list = ls())
library(JASPgraphs)
# library(ggedit)
# prior posterior plot ----

xCoords = seq(-1, 1, length.out = 1e3)
prior = dunif(xCoords, -1, 1)
posterior = dbeta(xCoords, 4, 5)

datLines = data.frame(x = c(xCoords, rev(xCoords)),
                      y = c(prior, posterior),
                      group = factor(rep(c("prior", "posterior"), each = length(xCoords))))

datPoints = data.frame(x = 0,
					  y = c(dunif(0, -1, 1), dbeta(0, 4, 5)),
					  group = factor(c("prior", "posterior")))
datBF <- data.frame(y = c(1, 2))

dat <- list(datLines, datPoints, datBF)

graphOptions(fontsize = 18)

g <- priorPosteriorPlot(dat, xName = expression(rho))
x11(width = 480, height = 320)
print(g)

graphOptions(fontsize = 26)

g <- priorPosteriorPlot(dat, xName = expression(rho))
x11(width = 480, height = 320)
print(g)

# library(ggedit)
# ggedit(g)
#
#
# g <- priorPosteriorPlot(NULL, xName = expression(rho))
# x11(width = 480, height = 320)
# print(g)

# points plots ----
data("iris", package = "datasets")

xName = "Petal.Length"
yName = "Sepal.Length"
toPlot = data.frame(x = iris[[xName]],
                    y = iris[[yName]],
                    g = iris[["Species"]])

g <- drawCanvas(xName = xName, yName = yName)#, dat = dat)
g <- drawPoints(g, dat = toPlot, size = 4, alpha = .5)
g <- themeJasp(g)

x11(width = 480, height = 320)
print(g)

# line plots ----
data("cars", package = "datasets")
xName = "speed"
yName = "dist"
toPlot = data.frame(x = cars[[xName]], y = cars[[yName]])

g <- drawCanvas(xName = xName, yName = yName, dat = toPlot, xBreaks = seq(5, 25, 5), xLabels = seq(0, 5, 1))
g <- drawLines(g, dat = toPlot, alpha = .25)
g <- drawPoints(g, dat = toPlot, size = 5, alpha = .65)
g <- themeJasp(g)

x11(width = 480, height = 320, pointsize = 12)
print(g)

# line + points ----
data("iris", package = "datasets")

xName = "Petal.Length"
yName = "Sepal.Length"
toPlot = data.frame(x = iris[[xName]],
                    y = iris[[yName]])

g <- drawCanvas(xName = xName, yName = yName, dat = toPlot)
g <- drawSmooth(g, dat = toPlot)
g <- drawPoints(g, dat = toPlot, size = 4)
g <- themeJasp(g)

x11(width = 480, height = 320, pointsize = 12)
print(g)


# bar graphs ----
data("mpg", package = "ggplot2")

toPlot <- data.frame(x = mpg$class)
xName = "Class"
yName = "Count"

g <- drawCanvas(xName = xName, yName = yName)
g <- drawBars(g, dat = toPlot, size = 4, stat = "count",
              mapping = ggplot2::aes(x = x, fill = x)) + ggplot2::xlab("Class")
g <- themeJasp(g, horizontal = TRUE)

x11(width = 480, height = 320)
print(g)

# heatmaps ----
# heat map no 1: random gaussian data
randomGaussian <- matrix(rnorm(100^2), 100, 100)
g <- themeJasp(drawHeatmap(dat = randomGaussian, interpolate = TRUE,
                           show.legend = TRUE),
               legend.position = "right")
x11(width = 480, height = 320)
print(g)

# heat map no 2: correlation matrix
cn <- cbind(1, rep(-1:1, each = 5), matrix(rnorm(15*13, sd = .3), 15, 13))
Q <- qr.Q(qr(cn)); L <- c(5, 4, sort(runif(13, .01, 1), decreasing = TRUE))
covMat <- Q %*% diag(L) %*% t(Q)
corMat <- Matrix::cov2cor(covMat)
dat <- corMat

gList <- list()
rot <- c(0, 90, 180, 270)
xBreaks = c(seq(1, 15, 5), 15)
yBreaks = c(seq(1, 15, 5), 15)
for (i in 1:4) {
    g <- drawCanvas(xName = "", yName = "", xBreaks = xBreaks, yBreaks = yBreaks)
    gList[[i]] <- themeJasp(drawHeatmap(graph = g, dat = dat, interpolate = FALSE, rotation = rot[i],
                                        show.legend = i==1), legend.position = "right")
}

x11(width = 480, height = 320)
multiplot(plotList = gList, cols = 2)

