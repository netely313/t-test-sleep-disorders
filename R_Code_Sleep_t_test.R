library(readr)
library(ggplot2)
install.packages("lubridate")
library(lubridate)

Sleep <- read_delim("Sleep.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)

# Creating the function for converting "XH Ymin" from variabl Avg Duration in minutes
convert_to_minutes <- function(time_string) {
  # Extract the number of hours from all cells
  hours <- as.numeric(gsub("h.*", "", time_string))
  
  # Extract the number of minutes from all cells
  minutes <- as.numeric(gsub(".*h |min", "", time_string))
  
  # Converting to minutes
  total_minutes <- hours * 60 + minutes
  
  return(total_minutes)
}

# Apply the function to the column Avg Duration with the time of sleep duration, creating new variable "Minutes"
Sleep$Minutes <- sapply(Sleep$`Avg Duration`, convert_to_minutes)

print(Sleep)


# Filter of the data to exclude the time set between 01:00:00 AM and 03:00:00 AM in column Avg Bedtime, our outliers
filtered_data <- Sleep %>%
  filter(!(hour(`Avg Bedtime`) == 1 & minute(`Avg Bedtime`) == 0 & second(`Avg Bedtime`) == 0) & !(hour(`Avg Bedtime`) >= 1 & hour(`Avg Bedtime`) < 3))

# Save the data in CSV-file using the function write.csv
write.csv(filtered_data, "filtered_data.csv", row.names = FALSE)

# Save the table in in CSV-file in the local computer using write_csv
write_csv(filtered_data, "filtered_data.csv")

# Open the table again for further analysis with the new name (the part of contents of the filterd_data.csv on the local computer was accidentally deleted) 
FilteredSleep <- read_delim("filtered_data.csv", delim = ";", spec(), escape_double = FALSE, trim_ws = TRUE, show_col_types = FALSE)
# due to I saved the workflow of R, therefore I can recover the filterd_data.csv with the new name and save it

#Build the boxplot for the hypothesis 1
SleepBoxplot <- ggplot(FilteredSleep, aes(x = AVBTK, y = Minutes)) +
  geom_boxplot(fill = "lightblue", color = "darkblue") +
  labs(title = "Boxplot of Sleep Minutes by AVBTK",x = "AVBTK", y = "Minutes") + 
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(SleepBoxplot)

#run the independent t-test for the hypothesis 1
ind.t.test<-t.test(Minutes ~ AVBTK, data = FilteredSleep)
ind.t.test

#build the boxplot for the hypothesis 2
SleepBoxplot1 <- ggplot(FilteredSleep, aes(x = AVBTK, y = `Avg Wake Time`)) +
  geom_boxplot(fill = "lightblue", color = "darkblue") +
  labs(title = "Boxplot of Sleep Avg Wake Time by AVBTK",x = "AVBTK", y = "Avg Wake Time") + 
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(SleepBoxplot1)

#Run the independent t-test for the hypothesis 2
ind.t.test2<-t.test(`Avg Wake Time` ~ AVBTK, data = FilteredSleep)
ind.t.test2