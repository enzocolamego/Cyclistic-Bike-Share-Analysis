# Cyclistic Bike Share Analysis

## 📌 Context

**Cyclistic** is a fictional bicycle rental company based in Chicago. The company manage a system with more than 5800 bicycles and 600 docking stations, allowing users to rent and return bikes at any station within the network. The company’s business model is based on three pricing plans: single-ride passes, full-day passes, and annual memberships, with annual members being the most profitable segment.

Cyclistic’s current goal is to increase its base of annual subscribers by converting casual riders into members. My objective is to provide data-driven insights to inform marketing strategies focused on conversion, with a key component being the analysis and reporting of behavioral differences between casual users and members.

The data used in this analysis comes from publicly available historical bike trip data provided by Motivate International Inc. Although the dataset has been adapted for the fictional Cyclistic case study, it is based on real-world information from a bike-sharing system. Due to privacy concerns, personally identifiable information has been removed, ensuring compliance with data security and confidentiality standards.

## 🛠️ Tools and Languages Used

Python - Google Colab

R - RStudio

SQL - BigQuery

Spreadsheets - Google Sheets

## 🧹 Data Cleaning and Preparation

- Loaded the data into Google Sheets and created a [copy](bike%20data.csv) to keep the original version intact.
- Adjusted formatting by centering headers and resizing columns for better visibility.
- Used the “Data Cleanup” function in Google Sheets to remove duplicate records and trim unnecessary spaces.
- Extracted the day and time of trip start and end from 'started_at' and 'ended_at', creating the columns `start_day`, `start_hour`, `end_day` and `end_hour`.
- Created a new column called `weekday` using the function "=WEEKDAY()". This function returns a number representing the day of the week for a given date
- Downloaded the new dataset and used [Python](data_cleaning.ipynb) to perform additional cleaning.

## 📊 Analysis


- From the table, I created a pivot table with `member_casual` as columns and `weekday` as rows.


![Image](https://github.com/user-attachments/assets/2367be7e-316d-40eb-a630-004c4c91c1bf)


**Friday** is the busiest day.

**Thursday** has the lowest activity.

- I used Python to generate some basic [statistics](https://github.com/enzocolamego/Cyclistic-Bike-Share-Analysis/blob/main/analysis/different%20statistics.ipynb) by user type.

I decided to analyze the distribution of casual users and members throughout the day. To do this, I divided the day into four 6-hour periods: morning, afternoon, evening, and night, using the formula `=COUNTIFS('202411-divvy-tripdata.csv'!$E$2:$E,">=06:00:00.00",'202411-divvy-tripdata.csv'!$E$2:$E,"<12:00:00.000",'202411-divvy-tripdata.csv'!$Q$2:$Q,"casual",'202411-divvy-tripdata.csv'!$R$2:$R,1)` varying time intervals and user type.


![Image](https://github.com/user-attachments/assets/212eece8-c53a-45ef-b9e7-5ed6b57e92e2)


![Image](https://github.com/user-attachments/assets/6838ce32-5448-4593-bc9b-5fa652f2e198)


![Image](https://github.com/user-attachments/assets/bb259383-30f6-4faf-be94-c649f5ef5ca9)


![Image](https://github.com/user-attachments/assets/f3e1992e-9ae7-41a2-9fdb-2fea4b1bcbea)

Analyzing user behavior, it is possible to identify a usage pattern where afternoons are the busiest period, followed by mornings, evenings, and nights, for both casuals and members.

I created a [heatmap](https://github.com/enzocolamego/Cyclistic-Bike-Share-Analysis/blob/main/analysis/heatmap.R) to provide a different visual representation of time distribution.


![Image](https://github.com/user-attachments/assets/ac7397fa-cc0e-4a7a-b6ff-fad69cfce6a4)


Members use bikes for a significantly larger total amount of time than casual users, mainly due to their greater numbers. However, casual users have a higher average ride duration.

The data analysis shows that casual users ride primarily on weekends and Fridays, while members ride more consistently throughout the week. This suggests that members use bikes mainly for commuting and exercise, while casual users ride for leisure. Evenings generally have the lowest activity, except on Fridays, when casual users ride more at night than in the morning—likely because it’s the last workday of the week. On Sundays, nighttime usage drops sharply as people prepare for the upcoming workweek.

I also wanted to check if there was a preference for bike type, classic or electric, depending on user type and time of day.


### Casuals:

![Image](https://github.com/user-attachments/assets/91b2f3fd-e87e-45fd-b56f-d9eb8bd82031)

![Image](https://github.com/user-attachments/assets/8b825857-9414-43d7-8fbe-9fb9f1673ad0)

![Image](https://github.com/user-attachments/assets/e4bf83f0-6578-4dc4-89c4-1ec0c13bcf81)

![Image](https://github.com/user-attachments/assets/cf14bca7-45cb-4475-9468-7fe0356568d2)

### Members:

![Image](https://github.com/user-attachments/assets/7c9f8f3b-a5fe-4d05-966c-1cef9c33b53f)

![Image](https://github.com/user-attachments/assets/e2038bbf-c750-4043-8e16-e721b21933d6)

![Image](https://github.com/user-attachments/assets/2ba0ee2f-39c7-45db-bab4-7b8fbf216058)

![Image](https://github.com/user-attachments/assets/08764377-5b06-4b2b-a678-6a43542c48b8)

Despite similar chart patterns between bike types, electric bikes show a notable preference. Casual riders use them 10.89% more than classic bikes, and members 11.01% more, suggesting comfort and convenience as key factors. This observation is reinforced by the analogous chart patterns across bike types, with electric bike charts consistently showing upward trends, indicating higher values.

A final analysis I conducted was identifying the most frequently used [start stations](https://github.com/enzocolamego/Cyclistic-Bike-Share-Analysis/blob/main/analysis/start%20stations%20code.SQL) and [end stations](https://github.com/enzocolamego/Cyclistic-Bike-Share-Analysis/blob/main/analysis/end%20stations%20code.SQL) for members and casual users, using SQL. The analysis reveals the top three start and end stations by user type. We observed a significant concentration of member activity at Kingsbury St & Kinzie St station, while casual users heavily rely on Streeter Dr & Grand Ave station.

### Full Results:

- [Most used start stations](https://github.com/enzocolamego/Cyclistic-Bike-Share-Analysis/blob/main/analysis/start%20stations%20result.csv)
- [Most used end stations](https://github.com/enzocolamego/Cyclistic-Bike-Share-Analysis/blob/main/analysis/end%20stations%20result.csv)

  ## 💡 Insights

  - Given the high concentration of casual riders at the `Streeter Dr & Grand Ave`, `DuSable Lake Shore Dr & Monroe St` and `Millennium Park` stations, implementing geo-targeted marketing campaigns tailored to casual users could significantly increase membership conversion rates.
    
  - Although casual riders account for only 27% of total users, they have a higher average ride duration than members. Offering a special trial membership discount to casual riders who complete a certain number of trips in a month could effectively generate interest in annual memberships.
    
  - Casual riders’ usage peaks on weekends and Fridays, specifically from 10 AM to 4 PM. Launching promotional campaigns and discounts during these timeframes could effectively attract new members.
