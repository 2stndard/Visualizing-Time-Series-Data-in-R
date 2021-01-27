if(!require(TTR)) {
  install.packages('TTR')
  library(TTR)
}


# Exercise
# Representing a univariate time series
# The very first step in the analysis of any time series is to address if the time series have the right mathematical properties to apply the standard statistical framework. If not, you must transform the time series first.
# 
# In finance, price series are often transformed to differenced data, making it a return series. In R, the ROC() (which stands for "Rate of Change") function from the TTR package does this automatically to a price or volume series x:
#   
#   ROC(x)
# In this exercise, you will compare plots of the Apple daily prices and Apple daily returns using the stock data contained in data, which is available in your workspace.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Plot data and name the chart "Apple stock price"
# Apply ROC() to data to create a time series rtn containing Apple's daily returns
# Plot data and rtn, in that order, as two new plots on a 1x2 graphical window

data <- read.csv('./dataset_2_1.csv', stringsAsFactors = TRUE, header = TRUE, sep = ' ')
data <- xts(data[,-1], order.by = as.Date(data[, 1], '%Y-%m-%d'))
colnames(data) <- c('apple')

# Plot Apple's stock price 
plot(data$apple, main = "Apple stock price")

# Create a time series called rtn
rtn <- ROC(data)

# Plot Apple daily price and daily returns 
par(mfrow = c(1, 2))
plot(data$apple, main = "Apple stock price")
plot(rtn)


# Exercise
# Histogram of returns
# A simple chart of returns does not reveal much about the time series properties; often, data must be displayed in a different format to visualize interesting features.
# 
# The density function, represented by the histogram of returns, indicates the most common returns in a time series without taking time into account. In R, these are calculated with the hist() and density() functions.
# 
# In the video, you saw how to create a histogram with 20 buckets, a title, and no Y axis label:
#   
#   > hist(amazon_stocks,
#          breaks = 20,
#          main = "AMAZON return distribution",
#          xlab = "")
# Recall that you can use the lines() function to add a new time series, even with different line properties like color and thickness, to an existing plot.
# 
# In this exercise, you will create a histogram of the Apple daily returns data for the last two years contained in rtn.
# 
# Instructions
# 100 XP
# Draw the histogram of rtn titled "Apple stock return distribution" and with probability = TRUE to scale the histogram to a probability density
# Add a new line to the plot showing the density of rtn
# Redraw the density line with twice the default width and a red color

par(mfrow = c(1, 1))

# Create a histogram of Apple stock returns
hist(rtn, probability = TRUE, main = "Apple stock return distribution")

# Add a density line
lines(density(rtn, na.rm = TRUE))

# Redraw a thicker, red density line
lines(density(rtn, na.rm = TRUE), lwd = 2, col = 'red')

# Exercise
# Box and whisker plot
# A box and whisker plot gives information regarding the shape, variability, and center (or median) of a data set. It is particularly useful for displaying skewed data.
# 
# By comparing the data set to a standard normal distribution, you can identify departure from normality (asymmetry, skewness, etc). The lines extending parallel from the boxes are known as whiskers, which are used to indicate variability outside the upper and lower quartiles, i.e. outliers. Those outliers are usually plotted as individual dots that are in-line with whiskers.
# 
# In the video, you also saw how to use boxplot() to create a horizontal box and whisker plot:
#   
#   > boxplot(amazon_stocks,
#             horizontal = TRUE,
#             main = "Amazon return distribution")
# In this exercise, you will draw a box and whisker plot for Apple stock returns in rtn, which is in your workspace.
# 
# Instructions
# 100 XP
# Draw a box and whisker plot of the data in rtn
# Draw a box and whisker plot for a standard normal distribution with 1000 points, which you can create with rnorm(1000)
# Redraw both plots, in their original order, on the same 2x1 graphical window and make them horizontal


# Draw box and whisker plot for the Apple returns
boxplot(rtn, horizontal = TRUE)

# Draw a box and whisker plot of a normal distribution
boxplot(rnorm(1000), horizontal = TRUE)

# Redraw both plots on the same graphical window
par(mfrow = c(2, 1))
boxplot(rtn, horizontal = TRUE)
boxplot(rnorm(1000), horizontal = TRUE)


# Exercise
# Autocorrelation
# Another important piece of information is the relationship between one point in the time series and points that come before it. This is called autocorrelation and it can be displayed as a chart which indicates the correlation between points separated by various time lags.
# 
# In R, you can plot the autocorrelation function using acf(), which by default, displays the first 30 lags (i.e. the correlation between points n and n - 1, n and n - 2, n and n - 3 and so on up to 30). The autocorrelogram, or the autocorrelation chart, tells you how any point in the time series is related to its past as well as how significant this relationship is. The significance levels are given by 2 horizontal lines above and below 0.
# 
# You saw in the video that using this function is fairly straightforward:
#   
#   > acf(amazon_stocks,
#         main = "AMAZON return autocorrelations")
# In this exercise, you will create an autocorrelation plot of the Apple stock price return data in rtn.
# 
# Instructions
# 100 XP
# Draw an autocorrelation plot of rtn and title it "Apple return autocorrelation"
# Redraw the plot and change the maximum lag to 10 by adding lag.max = 10

rtn <- rtn[-1]

# Draw autocorrelation plot
acf(rtn, main = "Apple return autocorrelation")

# Redraw with a maximum lag of 10
acf(rtn, main = "Apple return autocorrelation", lag.max = 10)



# Exercise
# q-q plot
# A q-q plot is a plot of the quantiles of one dataset against the quantiles of a second dataset. This is often used to understand if the data matches the standard statistical framework, or a normal distribution.
# 
# If the data is normally distributed, the points in the q-q plot follow a straight diagonal line. This is useful to check for normality at a glance but note that it is not an accurate statistical test. In the video, you saw how to create a q-q plot using the qqnorm() function, and how to create a reference line for if the data were perfectly normally distributed with qqline():
#   
#   > qqnorm(amazon_stocks,
#            main = "AMAZON return QQ-plot")
# 
# > qqline(amazon_stocks,
#          col = "red")
# In the context of this course, the first dataset is Apple stock return and the second dataset is a standard normal distribution. In this exercise, you will check how Apple stock returns in rtn deviate from a normal distribution.
# 
# Instructions
# 100 XP
# Draw a q-q plot for rtn titled "Apple return QQ-plot"
# Add a reference line in red for the normal distribution using qqline()


# Create q-q plot
qqnorm(rtn, main = "Apple return QQ-plot")

# Add a red line showing normality
qqline(rtn, col = 'red')


# Exercise
# A comprehensive time series diagnostic
# Each plotting function that you've learned so far provides a different piece of insight about a time series. By putting together the histogram, the box and whisker plot, the autocorrelogram, and the q-q plot, you can gather a lot of useful information about time series behavior.
# 
# In this exercise, you will explore the ExxonMobil return data in the rtn series available in your workspace.
# 
# Instructions
# 100 XP
# Draw a histogram of rtn, scale it to a probability density, and add a red line to the plot showing the density of rtn
# Draw a boxplot of rtn
# Draw an autocorrelogram of rtn
# Draw a q-q plot of rtn and add a red reference line showing the normal distribution


# Draw histogram and add red density line
hist(rtn, probability = TRUE)
lines(density(rtn), col = 'red')

# Draw box and whisker plot
boxplot(rtn)

# Draw autocorrelogram
acf(rtn)

# Draw q-q plot and add a red line for normality
qqnorm(rtn)
qqline(rtn, col = 'red')



# Exercise
# A comprehensive time series diagnostic (2)
# To allow a quick and efficient diagnostic, it is often more convenient to display the four charts above on the same graphical window.
# 
# In this exercise, you will put all the charts you created from the previous exercise onto one graphical window.
# 
# Instructions
# 100 XP
# Set up the graphical window with 2 rows and 2 columns
# Recreate the plots from the previous exercise (this has been done for you)

# Set up 2x2 graphical window
par(mfrow = c(2, 2))

# Recreate all four plots
hist(rtn, probability = TRUE)
lines(density(rtn), col = "red")

boxplot(rtn)

acf(rtn)

qqnorm(rtn)
qqline(rtn, col = "red")

