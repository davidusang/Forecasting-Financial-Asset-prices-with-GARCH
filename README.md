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

GARCH Volatility Forecasting for Silver Futures

This repository contains an R script that demonstrates how to use the GARCH (Generalized Autoregressive Conditional Heteroskedasticity) model for volatility forecasting of Silver Futures. The GARCH model is widely used in finance to model and predict the volatility of financial assets. This Readme file provides an overview of the script and explains the steps involved in the volatility forecasting process.
Table of Contents

    Dependencies
    Usage
    Results
    License

Dependencies

To run the script, you need to have the following R packages installed:

    quantmod
    ggplot2
    zoo
    rugarch

You can install these packages using the install.packages() function in R.
Usage

    Clone the repository or download the script file.

    Open the R environment or an R script editor.

    Install the required packages if they are not already installed:

R

install.packages(c("quantmod", "ggplot2", "zoo", "rugarch"))

Results

The script provides the following functionality:

    Fetching historical data for Silver Futures from Yahoo Finance using quantmod.
    Handling missing values in the dataset using last observation carried forward (LOCF) from the zoo library.
    Calculating daily returns from the closing prices of Silver Futures to analyze the asset's performance.
    Visualizing the returns over time through various plots using ggplot2.
    Calculating rolling annualized volatility to assess the asset's risk.
    Defining and fitting various GARCH models to capture the volatility dynamics using rugarch.
    Selecting the GARCH model with the lowest Akaike Information Criterion (AIC) for volatility forecasting.
    Forecasting future volatility using the selected GARCH model.
    Generating predictions by simulating future asset prices based on the forecasted volatility.

Execute the code step by step or run the entire script:

    The script fetches historical data for Silver Futures from Yahoo Finance using the quantmod package.

    Missing values in the dataset are handled using last observation carried forward (LOCF) from the zoo library.

    The script calculates daily returns from the closing prices of Silver Futures to analyze the asset's performance.

    The returns are visualized over time through various plots using ggplot2.

    Rolling annualized volatility is calculated to assess the asset's risk.

    The script defines and fits various GARCH models to capture the volatility dynamics using the rugarch package.

    The GARCH model with the lowest Akaike Information Criterion (AIC) is selected for volatility forecasting.

    Future volatility is forecasted using the selected GARCH model.

    Predictions of future asset prices are generated by simulating prices based on the forecasted volatility.

The script produces various plots to help visualize the time series data, returns, rolling volatility, and GARCH model diagnostics. It also provides future volatility forecasts and predictions for asset prices based on the fitted GARCH model.

## License

This script is released under the MIT License.

Feel free to copy the entire content and use it as a README file in your GitHub repository.
