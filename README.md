# Data Cleaning and Transformation in R

## Overview
This project involves cleaning and transforming an employee dataset using R. The goal is to handle missing values, standardize formats, and derive useful insights.

## Technologies used
- RStudio IDE
- Required R packages: `readxl`, `dplyr`
- Input file: `Employees data.xlsx`

## Steps Performed
1. **Loading the Dataset**
   - Read the Excel file into R using `read_excel()`.

2. **Handling of missing values**
   - Replaced missing `Name` with "Unknown".
   - Replaced missing `Department` with "Unassigned".
   - Computed missing `Salary` with the average salary.
   - Removed rows where `Age` or `DOB` is missing.
   - Filled missing `Performance Score` with "Unknown".

3. **Column formats**
   - Converted `DOB` and `Joining Date` to Date format.
   - Converted `Performance Score` to a factor variable.

4. **Created new columns**
   - Calculated `Tenure` as the difference between the current year and `Joining Date` year ( number of years employee staying in the company).
   - Categorized `Experience Level` as Beginner, Intermediate, or Experienced based on `Tenure`.

5. **Saved Cleaned Data**
   - The cleaned dataset is saved as `cleaned_employees.csv`.
