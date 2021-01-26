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

