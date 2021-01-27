library(tidyverse)

# Exercise
# Two time series grouped or stacked
# In the first chapter, you learned how to use axis() to plot two lines on the same graphic with different Y scales. Should you want to compare them, however, you may find other kind of graphs to be more insightful. One solution is to plot both time series as barcharts. There are two types:
#   
#   Grouped barchart: for a single period, there are as many bars as time series
# Stacked bar chart: for each period, there is a single bar, and each time series is represented by a portion of the bar proportional to the value of the time series at this date (i.e. the total at each period adds up to 100%)
# You are provided with a dataset (portfolio) containing the weigths of stocks A (stocka) and B (stockb) in your portfolio for each month in 2016. You will use the barplot() function to create both types of charts.
# 
# Instructions
# 100 XP
# Plot a stacked barplot for stocka and stockb.
# Plot a grouped barplot for stocka and stockb by setting beside equal to TRUE.

stocka <- c(0.1,0.4,0.5,0.5,0.2,0.3,0.7,0.8,0.7,0.2,0.1,0.2)
stockb <- c(0.9,0.6,0.5,0.5,0.8,0.7,0.3,0.2,0.3,0.8,0.9,0.8)
portfolio <- cbind(stocka, stockb)
portfolio <- ts(portfolio, start = 2016, frequency = 12)
portfolio <- as.xts(portfolio)

par(mfrow = c(1, 1))
# Plot stacked barplot
barplot(portfolio)

# Plot grouped barplot
barplot(portfolio, beside = TRUE)



# Exercise
# Visualizing bivariate relationships
# If you want to go even further than simply plotting variables and instead investigate whether any relationship exists between 2 variables, you can draw a scatterplot. This is a graph where the values of two variables are plotted along two axes.
# 
# The pattern of the resulting points is used to reveal the presence of any correlation; usually, a regression line is added to identify the tendency, if there is any:
#   
#   An upward sloping regression line indicates a positive linear relationship between A and B (when A goes up B tends to goes up as well)
# A downward sloping regression line indicates a negative linear relationship between A and B
# You can draw a scatterplot and then create a regression model with the following functions:
#   
#   plot(x = A, y = B)
# lm(B ~ A)
# In this exercise, you will draw a scatterplot and regression line for the return series for the SP500 (sp500) and Citigroup (citi) from January 2015 to January 2017, both of which are provided in your workspace
# 
# Instructions
# 100 XP
# Draw a scatterplot with sp500 on the x-axis and citi on the y-axis.
# Add a regression line of citi against sp500 using lm() and abline().
# Specify the regression as the reg argument to abline().
# Make this line red and twice as thick as the default.

data <- read.csv('./data_3_2.csv', stringsAsFactors = TRUE, header = TRUE, sep = ',')
#data <- xts(data[,-1], order.by = as.Date(data[, 1], '%Y-%m-%d'))

# Draw the scatterplot
plot(data$sp500, data$citi)

# Draw a regression line
abline(reg = lm(data$citi ~ data$sp500), col = 'red', lwd = 2)


# Exercise
# Correlation matrix
# What if you want to evaluate the relationship between mutiple time series? The most common tool to use is a correlation matrix, which is a table showing correlation coefficients between pairs of variables. Several types of correlations exist but the most used ones are:
#   
#   Pearson correlation: measures the linear relationship between 2 variables
# Spearman rank correlation: measures the statistical dependency between the ranking of 2 variables (not necessarily linear)
# The latter is used when there is no assumption made on the distribution of the data. All this is achieved in R using the function cor(). You can use the method argument to select the desired correlation type. "pearson" is the default method, but you can specify "spearman" as well.
# 
# In this exercise, you will calculate the correlation matrix of the data provided in the dataset my_data containing the returns for 5 stocks: ExxonMobile, Citigroup, Microsoft, Dow Chemical and Yahoo.
# 
# Instructions
# 100 XP
# Calculate the correlation matrix between the 5 return times series using the Pearson method
# Calculate the correlation matrix between the 5 return times series using the Spearman method

data <- xts(data[,-1], order.by = as.Date(data[, 1], '%Y-%m-%d'))
# Create correlation matrix using Pearson method
cor(data, method = 'pearson')

# Create correlation matrix using Spearman method
cor(data, method = 'spearman')



# Exercise
# Scatterplots for multiple pairs of data
# In the previous exercise, you saw a numerical representation of the relationship between pairs of data through a correlation matrix. It's also possible to have a graphical representation of those relationships using scatterplots.
# 
# Specifically, the relationship between pairs() of time series is represented by a facetted scatterplot of all pairs at once. This is very convenient for a quick comparison betwen pairs of time series.
# 
# In this exercise, you will draw scatterplots of the stock data in my_data from the previous exercise.
# 
# Instructions
# 100 XP
# Draw the scatterplots for all possible pairs in my_data
# Remove the lower triangle of the scatterplot matrix by setting the lower.panel argument to NULL


# Create scatterplot matrix
pairs(data)

# Create upper panel scatterplot matrix
pairs(data, lower.panel = NULL)


# Exercise
# Correlation plot
# R offers other ways of displaying the correlation matrix. With the corrplot package, the visualization of correlations is made easier and more powerful by allowing you to represent the correlations with numbers, symbols, colors, and more.
# 
# In this exercise, you will use the provided correlation matrix cor_mat and the corrplot() function to draw some correlation charts.
# 
# Instructions
# 100 XP
# Plot the corelation matrix of cor_mat using default settings
# Change the method to display numbers instead of circles
# Change the method to display colors instead circles
# Display only the upper triangle of the correlation matrix using numbers

library(corrplot)
cor_mat <- as.matrix(data[,-1])

# Create correlation matrix
corrplot(cor_mat)

# Create correlation matrix with numbers
corrplot(cor_mat, method = 'number')


# Create correlation matrix with colors
corrplot(cor_mat, method = 'color')


# Create upper triangle correlation matrix
corrplot(cor_mat, method = 'number', type = 'upper')
