---
title: "ParkingLA2017-Chrysler Vehicles"
output: html_notebook
---

## Main Topics: Data Exploration & Data Visualization

● Data Exploration & Visualization:

Read this file into your R environment.
```{r}
parkingLA2017.df <- read.csv("parkingLA2017.csv", header = TRUE) # load data
```

Per the below we can see that we are given the following dimesions of the dataset:
```{r}
dim(parkingLA2017.df) # find the dimensions of the dataframe 
```
We have a total of 1,048,575 rows with 21 columns.

Filter the dataframe.
```{r}
library(dplyr)
CHRY <- filter(parkingLA2017.df, Make == "CHRY") # create a new DF with 'CHRY' as a filter
dim(CHRY) # find the new dimensions
```
For 2017, the Chrysler car model was choosen to analyze how the car model was impacted with parking violations in 2017. We can now see that our search has narrowed to 11964 rows and 21 columns

Dealing with missing values:
```{r}
anyNA(CHRY) # determine if any missing values exist with dataframe CHRY 
```
Based on the above we can see that there are missing values for the given car make.

```{r}
anyNA(CHRY$RP.State.Plate) # determine if variabble RP.State.Plate has missing values
```
We can see that state license plate is not missing which is important info for examing parking violations

Find and display the standard deviation for the variable Fine.amount.
```{r}
sd(CHRY$Fine.amount) # Find the standard deviation for 'Fine.amount' variable
anyNA(CHRY$Fine.amount) # Alternative determine if NA's exist for var 'Fine.amount' 
median(CHRY$Fine.amount, na.rm = TRUE) # Determine if the median is reasonble
mean(CHRY$Fine.amount, na.rm = TRUE) # Determine if the mean is reasonable
range(CHRY$Fine.amount, na.rm = TRUE) # Observe the range for the variable
hist(CHRY$Fine.amount, col = c("orange")) # Use the histogram to observe any outliers
CHRY$Fine.amount[is.na(CHRY$Fine.amount)] <- median(CHRY$Fine.amount, na.rm = TRUE) # use median
anyNA(CHRY$Fine.amount) # determine if NAs were replaced
sd(CHRY$Fine.amount) # re-run the standard deviation 
```

Replace any blank cells in the Location column with NA.
```{r}
CHRY$Location[CHRY$Location==""] <- "NA" # replace blanks with NA's
anyNA(CHRY$Location) # check for any NA's
```

Remove all of the records that contain “NA” for AGENCY.SHORT.NAME from your dataset.
```{r}
anyNA(CHRY$AGENCY.SHORT.NAME) # check to see if NA's exist within that variable
library(tidyr)
CHRY <- drop_na(CHRY, AGENCY.SHORT.NAME) # drop all NA's from 
table(CHRY$AGENCY.SHORT.NAME) # after checking, NA's do exist
CHRY$AGENCY.SHORT.NAME <- droplevels(CHRY$AGENCY.SHORT.NAME) # alternate to dropping NA's
View(CHRY) 
```

Format the date
```{r}
CHRY$Issue.Date <- as.Date(CHRY$Issue.Date, format="%Y-%m-%d" ) # change the date based from View
str(CHRY) # recall the structure
```

Display the issue date in chronological order
```{r}
View(CHRY$Issue.Date) # filter by issue date or use View overall
CHRY <- arrange(CHRY, Issue.Date) # arrange the date in chronological order
View(CHRY) # recall View and the dates are in order
```

Using the subset() function, make a new object that only contains dates for November. 
```{r}
november <- subset(CHRY, Issue.Date >= "2017-11-01" & Issue.Date <= "2017-11-30") # use the first/last of Nov
View(november)
```

Since ticket number is not needed for our analysis, it would be best to remove.
```{r}
CHRY2 <- CHRY[,-c(2)] # use the = symbol rather than <- if you were to completely remove on CHRY
View(CHRY2)
```

Using the summary() function, we can find more about the distribution of fine amounts. 
```{r}
summary(CHRY2$Fine.amount)
```
The above displays the Minimum, 1st Quartile, Median, 3rd Quartile, Maximum, and Mean values for parking fine amounts. The highest parking vioaltion was 363 while the lowest was 25.

Identify the five most common types of violation descriptions in your dataset.
```{r}
summary(CHRY2$Violation.Description, head(6)) # shows all summary for violations desc for top five
```
We can see that No parking due to Street cleaning were the most common parking violations for Chrysler vehicles in LA. The 'other' category is an expansion of other violations descriptions from the summary function.

Create a new dataframe that only contains data for the five most common violations. 
```{r}
top5vio <- as.data.frame(sort(table(CHRY2$Violation.Description), decreasing = TRUE)[1:5]) # create a new df
test <- filter(CHRY2, Violation.Description %in% top5vio$Var1) # pull the top5
dim(test) # check for varaibles
View(top5vio) # view your new dataframe
```

Using ggplot, create a barplot that displays the number of occurrences for the five most common violations. 
```{r}
library(ggplot2)
library(wesanderson)
top5bar <- ggplot(test, aes(Violation.Description, fill=Violation.Description)) + geom_bar() + scale_fill_manual(values = wes_palette(n=5, "BottleRocket2"))
top5bar <- top5bar + labs(title = "Top 5 Parking Violations for Chryslers in LA FY2017") # add title
top5bar <- top5bar + theme(axis.text.x = element_text(angle=45, hjust=1)) # adjust the labels on horizontal line
top5bar

```

Find the average fine size for each agency.
```{r}
Chrysler <- group_by(test, AGENCY.SHORT.NAME)
Chrysler2 <- summarise(Chrysler, AvgFine = mean(Fine.amount))
Chrysler2
table(test$AGENCY.SHORT.NAME)
AvgBar <- ggplot(Chrysler2, aes(x=AGENCY.SHORT.NAME, y=AvgFine)) + geom_bar(stat="identity", fill=topo.colors(n=8))
AvgBar <- AvgBar + labs(title = "Average Fines Per Agency in LA FY2017 - Chrysler models") 
AvgBar <- AvgBar + theme(axis.text.x = element_text(angle=45, hjust=1))
AvgBar
```
Based on the above, we can see that the Hollywood, BLDG & SAF, Western, and the Valley agencies had the most average fines. All other agencies were equal in terms of the average fines that were given throughout the year for all Chrysler vehicles.


Create a violin plot that shows the agencies on the x-axis, and the fine amounts on the y-axis.
```{r}
FineViolin <- ggplot(Chrysler, aes(x=AGENCY.SHORT.NAME, y=Fine.amount, fill=AGENCY.SHORT.NAME)) + geom_violin(trim=FALSE)
FineViolin <- FineViolin + stat_summary(fun.data="mean_sdl", mult=1, geom="crossbar", width=0.04 )
FineViolin <- FineViolin + labs(title = "Fine amounts per Agency in LA FY2017 - Chrysler models")
FineViolin <- FineViolin + theme(axis.text.x = element_text(angle=45, hjust=1))
FineViolin
```
The above violin plot shows where the fine amounts are concetrated in dollar value per agency. When we look at Hollywood for example, there is higher probability of having a fine amounts bwteen 90- 95 dollars. Whereas for the Western agency, you are likely to have a fine within the 90 to 95 dollars range or 65-73 dollars range.  

Create a histogram that shows the frequency of ticket issuances per hour of the day. Use different colors to depict different types of violation descriptions.
```{r}
TicketHist <- ggplot(Chrysler, aes(x=Issue.time, fill=Violation.Description)) + geom_histogram(color="black")
TicketHist <- TicketHist + ggtitle("Ticket Issuance Per Hour") + xlab("Time Per Day (Military time)") + xlim(0, 2300)  
TicketHist
```
The above gives us an indication on how many parking tickets per description were given throughout the day. Per the above histogram, we can see that the No Parking due street cleaning is mostly given during the times of 7:30 am up until 1:00 pm. Meter expirations violations took place between 7:30 am until 8:00 pm. This in return gives agencies a better indication of when certain violations per description are occuring throughout the day. 
