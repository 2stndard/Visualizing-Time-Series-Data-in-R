library(xts)

# plot() function quiz
# With regard to the plot() function, which one of the following propositions is true?
#   
#   Use the attached dataset data - containing the daily stocks price for four major companies since 2015: Yahoo!, Microsoft Corporation, Citigroup Inc. and the Dow Chemical Company - to try out these parameters in your console.
# 
# Instructions
# 50 XP
# Possible Answers
# 
# Use title to include a title, l to change the line type, and lwd to change the line thickness
# 
# Use main to include a title, type to change the line type, and lwd to change the line thickness  <- answer
# 
# Use main to include a title, line to change the line type, and l to change the line thickness


# Exercise
# plot() function - basic parameters
# The plot.xts() function is the most useful tool in the R time series data visualization artillery. It is fairly similar to general plotting, but its x-axis contains a time scale. You can use plot() instead of plot.xts() if the object used in the function is an xts object.
# 
# Let's look at a few examples:
# 
# > # Basic syntax
# > plot(mydata)
# 
# > # Add title and double thickness of line
# > plot(mydata, main = "Stock XYZ", lwd = 2)
# 
# > # Add labels for X and Y axes
# > plot(mydata, xlab = "X axis", ylab = "Y axis")
# As you can see, there are a wide variety of parameters for the function allowing endless possibilities. Note that each call of plot() creates an entirely new plot only using the parameters that are defined in that particular call.
# 
# Furthermore, to display the first few rows of a dataset mydata to your console, use head(mydata). To display only the names of the columns, use colnames(mydata). You can also select a particular column of a dataset by specifying its title after a dollar sign, like in mydata$mycolumn.
# 
# In this exercise, you will use the same dataset data containing the daily stocks price for four major companies since 2015.
# 
# Instructions
# 100 XP
# Display the first few lines of the dataset data
# Display the column names of the dataset
# Plot the first series of the data set and change the title to the name of the stock "yahoo"
# Replot the first series with the same title, and change the X label to "date" and Y label to "price"


data <- read.csv('./dataset_1_1.csv', stringsAsFactors = TRUE, header = TRUE, sep = ' ')
data <- xts(data[,-1], order.by = as.Date(data[, 1], '%Y-%m-%d'))

# Display the first few lines of the data

head(data)

# Display the column names of the data
colnames(data)

# Plot yahoo data and add title
plot(data$yahoo, main = 'yahoo')

# Replot yahoo data with labels for X and Y axes
plot(data$yahoo, main = 'yahoo', xlab = 'date', ylab = 'price')



# Exercise
# plot() function - basic parameters (2)
# You can add even more customization with the plot() function using other options. As you saw in the video, the lines() function is especially helpful when you want to modify an existing plot.
# 
# Let's look at another example:
# 
# > # Use bars instead of points and add subtitle
# > plot(mydata, type = "h", sub = "Subtitle")
# 
# > # Triple thickness of line and change color to red
# > lines(mydata, col = "red", lwd = 3)
# In this exercise, you will try some of this customization for yourself. The same dataset, data, is available in your workspace. (If you can't remember the names of the columns, run colnames(data) in your console.)
# 
# Instructions
# 70 XP
# Instructions
# 70 XP
# Plot the second time series in data and change the title of the chart to "microsoft"
# Replot with same title, include subtitle "Daily closing price since 2015", and use bars instead of points for the chart type
# Change the color of the line to red without creating a new plot

# Plot the second time series and change title
plot(data[,2], main = 'microsoft')

# Replot with same title, add subtitle, use bars
plot(data[,2], main = 'microsoft', sub = 'Daily closing price since 2015', type = 'h')

# Change line color to red
lines(data[,2], col = 'red')


# Exercise
# Control graphic parameters
# In R, it is also possible to tailor the window layout using the par() function.
# 
# To set up a graphical window for multiple charts with nr rows and nc columns, assign the vector c(nr, nc) to the option mfrow. To adjust the size of the margins and characters in the text, set the appropriate decimal value to to the options mex and cex, respectively. Like plot(), each call to par() only implements the parameters in that particular call.
# 
# Look at this example:
#   
#   > # Create 3x1 graphical window
#   > par(mfrow = c(3, 1))
# 
# > # Also reduce margin and character sizes by half
#   > par(mfrow = c(2, 1), mex = 0.5, cex = 0.5)
# After this, you would make two consecutive calls to plot() to add the series in the order that you want them to appear.
# 
# It's time to practice! The dataset data is loaded in your workspace.
# 
# Instructions
# 100 XP
# Instructions
# 100 XP
# Create a 2x1 graphical window, then plot the first two series in data in that order, including the title for each of them
# Reduce margin size to 60% and character size to 80% of their normal sizes and and replot with same graphical window and titles


# Plot two charts on same graphical window
par(mfrow = c(2, 1))
plot(data[, 1], main = 'yahoo')
plot(data[, 2], main = 'microsoft')


# Replot with reduced margin and character sizes
par(mfrow = c(2, 1), cex = 0.8, mex = 0.6)
plot(data[, 1], main = 'yahoo')
plot(data[, 2], main = 'microsoft')



# Exercise
# Adding an extra series to an existing chart
# A great way to visually compare two times series is to display them on the same chart with different scales.
# 
# Suppose you already have a plot of mydata. As you saw in the video, you can use lines(mydata2) to add a new time series mydata2 to this existing plot. If you want a scale for this time series on the right side of the plot with equally spaced tick marks, use axis(side, at), where side is an integer specifying which side of the plot the axis should be drawn on, and at is set equal to pretty(mydata2).
# 
# Finally, to distinguish these two time series, you can add a legend with the legend() function. Let's examine the one used in the video:
# 
# > # x specifies location of legend in plot
# > legend(x = "bottomright",
#          # legend specifies text label(s)
#          legend = c("Stock X", "Stock Y"),
#          # col specifies color(s)
#          col = c("black", "red"),
#          # lty specifies line type(s)
#          lty = c(1, 1))
# Since there are two time series in the plot, some options in legend() are set to a vector of length two.
# 
# In this exercise, you will create a plot and legend for two time series. The same dataset data is provided for you.
# 
# Instructions
# 100 XP
# Plot the "microsoft" series and add the title "Stock prices since 2015"
# Add the "dow_chemical" series to the chart as a red line using lines()
# Add an appropriately scaled Y axis on the right side of the chart for the "dow_chemical" data using axis() and pretty()
# Add an appropriately colored legend in the bottom right corner labeled with the names of the stocks and regular lines

par(mfrow = c(1, 1), cex = 1, mex = 1)

# Plot the "microsoft" series
plot(data$microsoft, main = 'Stock prices since 2015')

# Add the "dow_chemical" series in red
lines(data$dow_chemical, col = 'red')

# Add a Y axis on the right side of the chart
axis(side = 4, at = pretty(data$dow_chemical))

# Add a legend in the bottom right corner
legend(x = 'bottomright', legend = c('microsoft', 'dow_chemical'), col = c('black', 'red'), lty = c(1, 1))


# Exercise
# Highlighting events in a time series
# You have also learned that it is possible to use the function abline() to add straight lines through an existing plot. Specifically, you can draw a horizontal line to identify a particular date by setting h to a specific Y value, and a vertical line to identify a particular level by setting v to a specific X value:
#   
#   > abline(h = NULL, v = NULL, ...)
# Recall that the index of an xts object are date objects, so the X values of a plot will also contain dates. In this exercise, you will use indexing as well as as.Date("YYYY-MM-DD") and mean() to visually compare the average of the Citigroup stock market prices to its price on January 4, 2016, after it was affected by turbulence in the Chinese stock market.
# 
# You are provided with the same dataset data as before. Let's give it a try.
# 
# Note: this code requires xts version 0.9-7 to work. You can use remotes::install_version() to install particular versions of packages.
# 
# Instructions
# 70 XP
# Instructions
# 70 XP
# Plot the third series in data with the title "Citigroup"
# Create vert_line, the index of the data point in the "citigroup" data that falls on January 4th, 2016
# Add a red vertical line at this date using abline(), .index(), and vert_line
# Create hori_line, the object equal to the average value of the "citigroup" price
# Add a blue horizontal line at this average value using abline() and hori_line


# Plot the "citigroup" time series
plot(data$citigroup, main = 'Citigroup')

# Create vert_line to identify January 4th, 2016 in citigroup
vert_line <- which(index(data) == as.Date('2016-01-04'))

# Add a red vertical line using vert_line
abline(v = .index(data$citigroup)[vert_line], col = "red")

# Create hori_line to identify average price of citigroup
hori_line <- mean(data$citigroup)

# Add a blue horizontal line using hori_line
abline(h = hori_line, col = "blue")



# Exercise
# Highlighting a specific period in a time series
# To highlight a specific period in a time series, you can display it in the plot in a different background color. The chart.TimeSeries() function in the PerformanceAnalytics package offers a very easy and flexible way of doing this.
# 
# Let's examine some of the arguments of this function:
# 
# chart.TimeSeries(R, period.areas, period.color)
# R is an xts, time series, or zoo object of asset returns, period.areas are shaded areas specified by a start and end date in a vector of xts date ranges like c("1926-10/1927-11"), and period.color draws the shaded region in whichever color is specified.
# 
# In this exercise, you will highlight a single period in a chart of the Citigroup time series in data.
# 
# Instructions
# 70 XP
# Create an object called period containing the first three months of 2015
# Using the chart.TimeSeries() function, highlight the citigroup data values in the period
# Use chart.TimeSeries() again to redraw the same line chart but this time set the color of the highlighted period to "lightgrey"

# Create period to hold the 3 months of 2015
period <- c('2015-01/2015-03')

# Highlight the first three months of 2015 
if(!require(PerformanceAnalytics)) {
  install.packages('PerformanceAnalytics')
  library(PerformanceAnalytics)
}

chart.TimeSeries(data$citigroup, period.areas = period)

# Highlight the first three months of 2015 in light grey
chart.TimeSeries(data$citigroup, period.areas = period, period.color = 'lightgrey')


# Exercise
# A fancy stock chart
# It's time to bring together what you have learned so far to create a chart that could go onto a publication.
# 
# In this exercise, you will plot Microsoft and Citigroup stock prices on the same chart. You are provided with the same dataset, data, as before.
# 
# Instructions
# 100 XP
# Plot the "microsoft" series in data and add the title "Dividend date and amount"
# Without creating a new plot, add the "citigroup" series to the plot, and make its line "orange" and twice as thick as the default width
# Add an appropriately scaled Y axis on the right side of the chart for the "citigroup" data using axis() and pretty(), and make it orange


# Plot the microsoft series
plot(data$microsoft, main = 'Dividend date and amount')

# Add the citigroup series
lines(data$citigroup, col = 'orange', lwd = 2)

# Add a new y axis for the citigroup series
axis(side = 4, at = pretty(data$citigroup), col = 'orange')



# Exercise
# A fancy stock chart (2)
# In this exercise, you will add a legend to the chart that you just created containing the name of the companies and the dates and values of the latest dividends.
# 
# Fill in the pre-written code with the following variables containing the dividend values and dates for both companies:
#   
#   citi_div_value
# citi_div_date
# micro_div_value
# micro_div_date
# Recall that the default color of a plotted line is black, and that the values for legend, col, and lty in legend() should be set to vectors of the same length as the number of time series plotted in your chart.
# 
# If you can't see all of the legend, try making the chart full screen after you plot it. Let's make our chart even fancier!
#   
#   Instructions
# 100 XP
# Create the same plot as in the previous exercise (this has been done for you)
# Use the pre-loaded variables above to create the strings, micro and citi, to be used in the legend
# "Microsoft div of $0.39 on 15 Nov. 2016"
# "Citigroup div of $0.16 on 13 Nov. 2016"
# Create the legend on the bottom right corner of the chart using the micro and citi strings you just created for the text, appropriate colors for the labels, and regular lines


# Same plot as the previous exercise
plot(data$microsoft, main = "Dividend date and amount")
lines(data$citigroup, col = "orange", lwd = 2)
axis(side = 4, at = pretty(data$citigroup), col = "orange")

# Create the two legend strings
micro <- paste0("Microsoft div of $0.39 on 15 Nov. 2016")
citi <- paste0("Citigroup div of $0.16 on 13 Nov. 2016")

# Create the legend in the bottom right corner
legend(x = 'bottomright', legend = c(micro, citi), col = c('black', 'orange'), lty = c(1, 1))
