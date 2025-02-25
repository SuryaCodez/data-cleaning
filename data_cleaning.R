library(readxl)
library(dplyr)
# Here i am loading the excel sheet consisting of employee data
df <- read_excel("C:/Users/surya/Downloads/Employees data.xlsx")

# Here i am cleaning the dataset by handling missing values in various columns
df$Name[is.na(df$Name)] <- "Unknown"
df$Department[is.na(df$Department)] <- "Unassigned"
df$Salary[is.na(df$Salary)] <- mean(df$Salary, na.rm = TRUE)
df <- df[!is.na(df$Age) & !is.na(df$`DOB`), ]
df$`Performance Score`[is.na(df$`Performance Score`)] <- "Unknown"

# Here i am converting the DOB and Joining Date columns to Date format
df$DOB <- as.Date(df$DOB, format="%Y-%m-%d")
df$`Joining Date` <- as.Date(df$`Joining Date`, format="%Y-%m-%d")

# Here i am calculating the employee tenure in the company using the year of joining
current_year <- as.numeric(format(Sys.Date(), "%Y"))
df$Tenure <- current_year - as.numeric(format(df$`Joining Date`, "%Y"))

# Here i am creating new experience level column
df$`Experience Level` <- ifelse(df$Tenure < 2, "Beginner",
                                ifelse(df$Tenure < 5, "Intermediate", "Experienced"))

# Here i am converting performance score to categorical type
df$`Performance Score` <- as.factor(df$`Performance Score`)

# Finally Saving the cleaned dataset onto a new csv file
write.csv(df, "cleaned_employees.csv", row.names = FALSE)

# This is a confirmation message to confirm completion of the R script, if it ran successfully.
print("Data cleaning and transformation completed successfully!")
