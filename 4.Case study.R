# Exercise
# Current portfolio description
# Your savings are invested in a portfolio made of 3 stocks: Yahoo, Apple and Microsoft. Each stocks has the same weight in the portfolio at 33%. You have some extra cash to invest, but before going any further, you want to gather some information on your existing portfolio.
# 
# In this exercise, you are provided with a dataset data containing the value and the return of the portfolio over time, in value and return, respectively.
# 
# Instructions
# 100 XP
# Plot the portfolio value with the title "Portfolio Value"
# Plot the portfolio return with the title "Portfolio Return"
# Plot a histogram of the portfolio return
# Add a density line in red and twice as thick as normal

data <- read.csv('./data_4_1.csv', stringsAsFactors = TRUE, header = TRUE, sep = ',')
data <- as.xts(data[,-1], order.by = as.Date(data[, 1], '%Y-%m-%d'))


# Plot the portfolio value
plot(data$value, main = "Portfolio Value")

# Plot the portfolio return
plot(data$return, main = "Portfolio Return")


# Plot a histogram of portfolio return 
hist(data$return, probability = TRUE)

# Add a density line
lines(density(data$return), col = 'red', lwd = 2)


# Exercise
# Existing portfolio quiz
# You are given the same charts as the previous exercise.
# 
# Which statement best describes the portfolio behavior?
#   
#   Instructions
# 50 XP
# Possible Answers
# 
# Good performance, return negative on average, and no extreme returns
# 
# Good performance, return positive on average, and some extreme returns  <- answer
# 
# Poor performance, return negative on average, and no extreme returns



# Exercise
# New stocks description
# In this exercise, you will review plotting multiple graphs on the same graphical window.
# 
# The new dataset data containing four new stocks is available in your workspace:
#   
#   Goldman Sachs (GS)
# Coca-Cola (KO)
# Walt Disney (DIS)
# Caterpillar (CAT)
# Instructions
# 100 XP
# Plot all four stocks in the order given in the assignment text on the same graphical window in a 2x2 layout making the character size and the margin size 80% of their normal sizes


data <- read.csv('./data_4_3.csv', stringsAsFactors = TRUE, header = TRUE, sep = ',')
data <- as.xts(data[,-1], order.by = as.Date(data[, 1], '%Y-%m-%d'))


# Plot the four stocks on the same graphical window
par(mfrow = c(2, 2), mex = 0.8, cex = 0.8)
plot(data$GS)
plot(data$KO)
plot(data$DIS)
plot(data$CAT)


# Exercise
# New stocks description (2)
# Now that you know what the new stocks look like, you want to find out if any of them provide diversification benefits to your existing portfolio. You can do this by looking at the correlation of each stock to our portfolio, visualized through regression lines.
# 
# In this exercise, you are provided with four individual series containing the return of the same four stocks:
#   
#   Goldman Sachs (gs)
# Coca-Cola (ko)
# Walt Disney (dis)
# Caterpillar (cat)
# The return of your existing portfolio in portfolio are also available in your workspace. Now it's your turn to analyze the relationships!
# 
# Instructions
# 100 XP
# Draw the scatterplot of gs against the portfolio
# Add a regression line in red and twice as thick as normal
# On a single graphical window, draw the scatterplots and the regression lines of the four stocks against the portfolio in the order given in the assignment text; add a regression line in red and twice as thick as normal to each plot

portfolio <- read.csv('./old.vs.new.portfolio.csv', stringsAsFactors = TRUE, header = TRUE, sep = ',')
data <- data[-1762, ]
# Draw the scatterplot of gs against the portfolio
plot(x = data$GS, y = portfolio[, 3])

# Add a regression line in red
abline(reg = lm(data$GS ~ portfolio[, 3]), col = 'red', lwd = 2)

# Plot scatterplots and regression lines to a 2x2 window

par(mfrow = c(2, 2))

plot(x = data$GS, y = portfolio[, 3],new=FALSE,axes=FALSE,ann=FALSE)
abline(reg = lm(data$GS ~ portfolio[, 3]), col = 'red', lwd = 2)

plot(x = data$KO, y = portfolio[, 3])
abline(reg = lm(data$KO ~ portfolio[, 3]), col = 'red', lwd = 2)

plot(x = data$DIS, y = portfolio[, 3])
abline(reg = lm(data$DIS ~ portfolio[, 3]), col = 'red', lwd = 2)

plot(x = data$CAT, y = portfolio[, 3])
abline(reg = lm(data$CAT ~ portfolio[, 3]), col = 'red', lwd = 2)


# Exercise
# Portfolio quiz
# Based on the results of the previous exercise, which stock is best for you to buy to add diversification to your portfolio, and why?
#   
#   Instructions
# 50 XP
# Possible Answers
# 
# Walt Disney because it performs well
# 
# Goldman Sachs because recent performance has been excellent
# 
# Coca-Cola because it is the least correlated with the existing portfolio   <- answer



# Exercise
# Compare old and new portfolios
# Great work. You decide to buy stocks in Coca-Cola, and now your portfolio is made of equal proportions of four stocks: Yahoo, Microsoft, Apple and Coca-Cola.
# 
# In this exercise, you are given a dataset old.vs.new.portfolio with the following self-explanatory columns:
#   
#   old.portfolio.value
# new.portfolio.value
# old.portfolio.rtn
# new.portfolio.rtn
# Instructions
# 70 XP
# Plot the old portfolio value, then add the new portfolio value onto the same chart; make the old portfolio black and the new one red
# Plot the density of the old portfolio returns, then add the density of the new portfolio returns on the same chart; make the old portfolio black and the new one red

par(mfrow = c(1, 1))
old.vs.new.portfolio <- read.csv('./old.vs.new.portfolio.csv', stringsAsFactors = TRUE, header = TRUE, sep = ',')
# Plot new and old portfolio values on same chart
plot(old.vs.new.portfolio$old.portfolio.value)
lines(old.vs.new.portfolio$new.portfolio.value
      , col = 'red')


# Plot density of the new and old portfolio returns on same chart
plot(density(old.vs.new.portfolio$old.portfolio.rtn))
lines(density(old.vs.new.portfolio$new.portfolio.rtn)
      , col = 'red')


# Exercise
# A more accurate comparison of portfolios
# Looking at the value and distribution of returns of your portfolio is a good start, but it doesn't necessarily tell the whole story. You could obviously look at many other charts and metrics, but ultimately what matters is performance, and specifically periods of poor performance.
# 
# The PerformanceAnalytics package provides additional tools to get a finer view of your portfolio. In particular, the charts.PerformanceSummary() function provides a quick and easy way to display the portfolio value, returns, and periods of poor performance, also known as drawdowns.
# 
# In this exercise, you will use this new function on the same old and new portfolio data in old.vs.new.portfolio from the previous exercise.
# 
# Instructions
# 100 XP
# Draw the value, the return, and the drawdowns of the old portfolio.
# Draw the value, the return, and the drawdowns of the new portfolio.
# Subset the two return columns from old.vs.new.portfolio and chart them to view the performance of both portfolios on the same graph.

if(!require(PerformanceAnalytics)) {
  install.packages('PerformanceAnalytics')
  library(PerformanceAnalytics)
}
old.vs.new.portfolio <- as.xts(old.vs.new.portfolio[,-1], order.by = as.Date(old.vs.new.portfolio[, 1], '%Y-%m-%d'))

# Draw value, return, drawdowns of old portfolio
charts.PerformanceSummary(old.vs.new.portfolio$old.portfolio.rtn)

# Draw value, return, drawdowns of new portfolio
charts.PerformanceSummary(old.vs.new.portfolio$new.portfolio.rtn)

# Draw both portfolios on same chart
charts.PerformanceSummary(old.vs.new.portfolio[, c(3, 4)])


# Exercise
# Wrap up quiz
# This is the final exercise for this course.
# 
# Given that you already own a portfolio of stocks, on what grounds should you add a new stock to your portfolio?
#   
#   Instructions
# 50 XP
# Possible Answers
# 
# Correlation to your existing portfolio to assess diversification, return histogram and box and whisker plot to assess risk
# 
# Correlation to your existing portfolio to assess risk, return histogram to assess diversification
# 
# Correlation to your existing portfolio to assess diversification, return histogram to assess risk and box and whisker plot to assess average return

