# Cyclistic-Bike-Share-Analysis

## 📌 Context

**Cyclistic** is a fictional bike-sharing company based in Chicago. The company operates a system with over 5,800 bicycles and 600 docking stations, allowing users to rent and return bikes at any station within the network. The company’s business model is based on three pricing plans: single-ride passes, full-day passes, and annual memberships, with annual members being the most profitable segment.

Cyclistic's current objective is to grow its annual subscriber base by transitioning casual riders to memberships. My goal is to deliver data-driven insights to inform marketing strategies focused on conversion, with a key component being the analysis and reporting of behavioral variations between casual and member user groups.

The data used in this analysis comes from publicly available historical bike trip data provided by Motivate International Inc. While the dataset has been adapted for the fictional Cyclistic case study, it is based on real-world information from a bike-sharing system. Due to privacy concerns, personally identifiable information has been removed, ensuring compliance with data security and confidentiality standards.

## 🧹 Data Cleaning and Preparation

- Loaded the data into Google Sheets and created a [copy](bike%20data.csv) to keep the original version intact.
- Adjusted formatting by centering titles and resizing columns for better visibility.
- Used Google Sheets' "Data Cleaning" function to remove duplicate records and trim unnecessary spaces.
- Extracted the start and end day and time from ‘started_at’ and ‘ended_at’, creating the columns `start_day`, `start_hour`, `end_day`, and `end_hour`.
- Created a new column named `weekday` using the function "=DIA.DA.SEMANA()". This function returns a number representing the day of the week for a given date.
- Downloaded the new data and used [python](data_cleaning.ipynb) to perform additional cleaning.

## 📊 Analyzes

- From the table, I created a pivot table with `member_casual` as columns and `weekday` as rows.
![Image](https://github.com/user-attachments/assets/2367be7e-316d-40eb-a630-004c4c91c1bf)
