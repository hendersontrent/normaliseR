
<p align="center">

<img src="man/figures/logo.png" alt="normaliseR logo" height="160"/>
</p>

<h1 align="center">

<em>normaliseR</em>: Re-Scale Vectors and Time-Series Features
</h1>

<p align="center">

<a href="https://github.com/hendersontrent/normaliseR/blob/main/LICENSE.md"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"/></a>
<a href="https://hendersontrent.github.io/normaliseR/"><img src="https://img.shields.io/badge/docs-pkgdown-blue" alt="Documentation"/></a>
<a href="https://cran.r-project.org/package=normaliseR"><img src="https://www.r-pkg.org/badges/version/normaliseR" alt="CRAN version"/></a>
<a href="https://cran.r-project.org/package=normaliseR"><img src="https://cranlogs.r-pkg.org/badges/normaliseR" alt="CRAN downloads"/></a>
</p>

*normaliseR* is an R package for rescaling numerical vectors, or `feature_calculations` objects produced by the [*theft*](https://github.com/hendersontrent/theft) package for computing time-series features.
Putting calculated feature vectors on an equal scale is crucial for most statistical and machine-learning models, because variables with high variance can adversely affect a model’s ability to fit the data, learn appropriate weights, or minimize a loss function.

📖 **Full documentation:** [hendersontrent.github.io/normaliseR](https://hendersontrent.github.io/normaliseR/), including the vignette and function reference.

## Installation

Install the stable version from CRAN:

``` r
install.packages("normaliseR")
```

Or install the development version from GitHub:

``` r
devtools::install_github("hendersontrent/normaliseR")
```

## Usage

The function `normalise()` (or `normalize()`, a synonym) rescales either a whole `feature_calculations` object (each feature separately) or a single numeric vector.
Choose the method with `norm_method`, and set `unit_int = TRUE` to rescale the result into the unit interval afterwards.

``` r
library(normaliseR)

x <- c(1, 3, 4, 8, 20, 100)

normalise(x, norm_method = "zScore")
```

    [1] -0.56291933 -0.51095754 -0.48497665 -0.38105308 -0.06928238  2.00918898

``` r
normalise(x, norm_method = "RobustSigmoid", unit_int = TRUE)
```

    [1] 0.00000000 0.07612107 0.11509869 0.27289297 0.67465169 1.00000000

The following methods are offered:

| `norm_method` | Method |
|----|----|
| `"zScore"` | z-score |
| `"Sigmoid"` | Sigmoid |
| `"RobustSigmoid"` | Outlier-robust Sigmoid (credit to Ben Fulcher for the original [MATLAB version](https://github.com/benfulcher/hctsa)) |
| `"MinMax"` | Min-max |
| `"MaxAbs"` | Maximum absolute |

Each method is also available as a stand-alone function that takes a numeric vector: `zscore_scaler()`, `sigmoid_scaler()`, `robustsigmoid_scaler()`, `minmax_scaler()`, and `maxabs_scaler()`.

## References

The outlier-robust Sigmoid was originally described in:

> B. D. Fulcher, M. A. Little, N. S. Jones.
> [Highly comparative time-series analysis: the empirical structure of time series and their methods](https://doi.org/10.1098/rsif.2013.0048).
> *Journal of The Royal Society Interface* **10**, 20130048 (2013).

*normaliseR* is part of the *theft* ecosystem, which is described in:

> T. Henderson and B. D. Fulcher.
> [“Feature-Based Time-Series Analysis in R using the Theft Ecosystem”](https://doi.org/10.32614/RJ-2025-023).
> *The R Journal* **17**(3), 43-68 (2025).

## License

*normaliseR* is licensed under the [MIT License](LICENSE.md).
