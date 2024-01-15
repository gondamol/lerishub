##-------------------------------------------------------------------
##-------------------------------------------------------------------
##
##                          SPOTLIGHT ON R
##                               DEMO
##
##                  Code written by: Aashna Uppal
##                   Last modified: 16 Oct 2023
##
##-------------------------------------------------------------------
##-------------------------------------------------------------------

# The first step in writing code in R is to create an informative header
# in your document, like the one above. It should contain the name(s) of 
# all the people who worked on the code, as well as a date indicating when
# the code was last modified. 

# Also, anything that follows a hashtag, like this line, is considered to be
# a comment. So none of this will be executed as code. 

# The next step is to load the packages you require. Note that this can be 
# done several ways. I've chosen to individually load each package since I 
# don't need that many packages, using the "library()" function. You can think
# of a package as a collection of functions. Functions allow you to perform
# different actions in R. 

# --------------------------
# LOAD PACKAGES
# --------------------------

# If you don't have these packages installed, you'll have to install them 
# before loading them. To install packages, uncomment the following four 
# lines of code. Note that you only need to install packages once, but you 
# need to load them every time you open R. 
# install.packages("rio")
# install.packages("tidyverse")
# install.packages("plotly")
# install.packages("here")

# Now load packages. 
library(rio) # this package is used to import data
library(tidyverse) # this package is used to work with data
library(plotly) # this package is used to create interactive graphs

# --------------------------
# LOCATE CODE
# --------------------------
# This seems like a strange step, since you clearly know where your code is. 
# But it's good practice to use relative file paths rather than absolute file 
# paths. For example, the file path C:/Users/AUppal/Desktop exists on my 
# computer, but it wouldn't exist on yours. The "here" package in R uses relative
# file paths. Basically, if you use the "i_am()" function within the package, it'll
# locate your current document, and then it'll build file paths to locations 
# relative to where your document lives. Note that I'm using a different way
# to load the "here" package - the double colon allows me to use a function
# within that package immediately after loading it, instead of doing the "library()"
# step first. 

here::i_am("Spotlight on R Demo.R")

# --------------------------
# IMPORT DATA
# --------------------------

# Use the "import()" function within the rio package to import data. Note that
# rio cleverly guesses what format the data is in - it could've equivalently been
# a .csv or .txt file, and the import() function would still work! Note that I'm
# creating an object here using the "<-" assignment operator. My object is called
# case_data, and it contains the dataset I've just imported. 

# NOTE #1: THIS DATA IS TOTALLY FICTIONAL!!

# NOTE #2: make sure your Sample Case Data.xlsx file is in the same place as your 
# Spotlight on R Demo.R code. 

case_data <- import("Sample Case Data.xlsx")

# --------------------------
# EXPLORE DATA
# --------------------------

# I can use the names() function to quickly check the column names within my dataset. 
# Doing so is handy because I can check for things like duplicate columns, and columns
# with potentially nonsensical names. 

names(case_data)

# Now I can look at a snippet of the data. The head() function allows me to preview
# the first few rows of my dataset. 

head(case_data)

# --------------------------
# WORK WITH DATA
# --------------------------

# I can also create a table to look at some summary statistics. The code below follows
# something called "tidyverse" syntax - tidyverse is a collection of packages designed
# to help with data wrangling and manipulation. It makes use of something called a "pipe
# operator", which is the %>% symbol you see below. This symbol separates operations and
# makes it so that you can read the code like a sentence. Think of the pipe operator as
# a "and then" - so we start of with our case_data dataset, AND THEN we group the data by 
# Country, AND THEN we summarise our data by calculating min, median, and max.

case_data %>%
  group_by(Country) %>%
  summarise(min_cases = min(Cases), 
            median_cases = median(Cases), 
            max_cases = max(Cases))

# Similarly, I can plot my data. Here I'm using something super common in R, which is the
# "ggplot". This comes from the ggplot2 package, which is a member of the tidyverse family, 
# and is why you can work with pipe operators here too. In this plot, I've got Date on the 
# x axis, Cases on the y axis, and I've split up my data by Country. The "geom_line" bit
# ensures that I've got a line graph. 

case_data %>%
  ggplot(aes(x = Date, y = Cases, color = Country)) +
  geom_line() 

# --------------------------
# BONUS SECTION
# --------------------------

# Something really cool in R is that you can create interactive graphs!
# This is done through a package called plotly. In order to create an 
# interactive graph, first we have to reshape our dataset a bit. If you view
# our current dataset, you'll notice it has three columns - Country, Date, 
# and Cases. For plotly, we want each country to have its own column; the Date
# column can stay as is. In order to achieve this, we have to "spread" our
# dataset, because we're essentially taking one column (Country) and spreading
# it out into three columns (Brazil, Cambodia, and Ghana)

case_data_wide <- spread(case_data, Country, Cases)

# Now if you take a look at the dataset, we have successfully split Country 
# into three columns

names(case_data_wide)

# The entries in the three country columns are the number of cases

head(case_data_wide)

# Now we can get to plotting! You'll notice that the pipe operator comes in handy
# here as well. Except plotly works a little differently - you have to create a 
# figure, which I've called "fig" below, and then you keep adding to it step by step. 
# The first line below creates the figure, and then the following lines add more data
# onto it. 

fig <- plot_ly(case_data_wide, x = ~Date, y = ~Brazil, name = 'Brazil', type = 'scatter', mode = 'lines') %>%
  layout(yaxis = list(title = 'Case Count'))
fig <- fig %>% add_trace(y = ~Cambodia, name = 'Cambodia', mode = 'lines') 
fig <- fig %>% add_trace(y = ~Ghana, name = 'Ghana', mode = 'lines')

# Now print out fig - you've got an interactive graph!

fig



