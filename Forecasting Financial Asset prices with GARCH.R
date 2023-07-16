# Load the necessary libraries for the analysis
library(quantmod)  # Library for financial quantitative modeling
library(ggplot2)  # Library for data visualization
library(zoo)  # Library for handling and analyzing time series data
library(rugarch)  # Library for modeling and forecasting volatility

# Fetch the time series data from Yahoo Finance using the 'SI=F' ticker
df <- getSymbols('SI=F', src = 'yahoo', periodicity = "daily", auto.assign = FALSE)

# Handle missing values
sum(is.na(df))

# Replace missing values
df <- na.locf(df, fromLast = TRUE)

# Confirm missing values
sum(is.na(df))

# Explore the dataset to gain initial insights
head(df)  # Display the first few rows of the dataset
tail(df)  # Display the last few rows of the dataset
chartSeries(df)  # Visualize the time series data using a chart

# Calculate returns from closing prices to analyze the asset's performance
returns <- diff(df$`SI=F.Close`)  # Calculate the difference in closing prices
returns <- returns[-1]  # Remove the first element (NAs)
returns <- na.omit(returns)  # Remove any remaining NAs

# Visualize the returns through various plots
autoplot(returns)  # Plot the returns over time
hist(returns)  # Generate a histogram to examine the distribution of returns
hist(returns, freq = FALSE, col = "lightblue", main = "Histogram of Returns")  # Create a histogram with density and normal curves
curve(dnorm(x, mean = mean(returns), sd = sd(returns)), add = TRUE, col = "darkgreen", lwd = 2)  # Add a normal curve to the histogram
chartSeries(returns)  # Visualize the returns using a time series chart
head(returns)  # Display the first few returns

# Calculate the rolling annualized volatility to assess the asset's risk
rolling_volatility <- rollapply(returns, width = 22, FUN = function(x) sd(x) * sqrt(252), by.column = FALSE, align = "right", fill = NA)

# Plot the rolling volatility to understand the volatility patterns over time
plot(rolling_volatility, type = "l", col = "blue", xlab = "Date", ylab = "Volatility",
     main = "Asset's Yearly Rolling Volatility")

# Define and fit various GARCH models to capture the volatility dynamics
s1 <- ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(1, 1)),
                 mean.model = list(armaOrder = c(0, 0)), distribution.model = "norm")
m1 <- ugarchfit(data = returns, spec = s1)
plot(m1, which = 'all')

s2 <- ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(1, 1)),
                 mean.model = list(armaOrder = c(2, 2)), distribution.model = "norm")
m2 <- ugarchfit(data = returns, spec = s2)
plot(m2, which = 'all')

s3 <- ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(1, 2)),
                 mean.model = list(armaOrder = c(2, 2)), distribution.model = "norm")
m3 <- ugarchfit(data = returns, spec = s3)
plot(m3, which = 'all')

s4 <- ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(2, 1)),
                 mean.model = list(armaOrder = c(1, 1)), distribution.model = "norm")
m4 <- ugarchfit(data = returns, spec = s4)
plot(m4, which = 'all')

# Select the GARCH model with the lowest Akaike Information Criterion (AIC) for forecasting
s_final <- ugarchspec(variance.model = list(model = "sGARCH", garchOrder = c(1, 2)),
                      mean.model = list(armaOrder = c(2, 2)), distribution.model = "norm")
m_final <- ugarchfit(data = returns, spec = s_final)
forecast <- ugarchforecast(fitORspec = m_final, n.ahead = 252)
plot(fitted(forecast))
plot(sigma(forecast))

# Generate predictions by forecasting future asset prices
sim <- ugarchsim(m_final, n.sim = 100)
tail(df)
prediction_df <- 24.910 * apply(fitted(sim), 2, 'cumsum') + 24.910
matplot(prediction_df, type = "l", lwd = 3)
prediction_df
