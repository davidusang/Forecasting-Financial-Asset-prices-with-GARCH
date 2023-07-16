# Financial Analysis with GARCH Models

This repository contains code for performing financial analysis using GARCH (Generalized Autoregressive Conditional Heteroskedasticity) models in R. The code fetches historical price data for silver futures from Yahoo Finance, calculates returns, visualizes the data, fits GARCH models, and performs forecasting.

## Table of Contents

- [Dependencies](#dependencies)
- [Usage](#usage)
- [Results](#results)
- [License](#license)

## Dependencies

To run the code, you need to have the following R packages installed:

- quantmod
- ggplot2
- zoo
- rugarch

You can install these packages using the `install.packages()` function in R.

## Usage

1. Clone the repository or download the code files.

2. Open the R environment or an R script editor.

3. Install the required packages if they are not already installed:
   
install.packages(c("quantmod", "ggplot2", "zoo", "rugarch"))
   
## Results

The code provides the following functionality:

    Fetching historical price data for silver futures from Yahoo Finance.
    Calculating returns from the closing prices.
    Visualizing the returns using time series plots and histograms.
    Calculating rolling annualized volatility.
    Fitting different GARCH models to the returns.
    Performing model diagnostics and visualizations.
    Selecting the GARCH model with the lowest AIC value for forecasting.
    Generating a 1-year ahead forecast using the selected GARCH model.
    Simulating price paths based on the GARCH model.

The code produces various plots and outputs to help analyze and understand the financial data.


## License

This code is released under the MIT License.

Feel free to copy the entire content and use it as a README file in your GitHub repository.
