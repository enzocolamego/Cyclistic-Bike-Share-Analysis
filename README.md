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
- I used python to see some basics [statistics](https://github.com/enzocolamego/Cyclistic-Bike-Share-Analysis/blob/main/analysis/different%20statistics.ipynb) per user type


![Image](https://github.com/user-attachments/assets/2367be7e-316d-40eb-a630-004c4c91c1bf)


**Friday** is the busiest day for rides.
**Thursday** has the lowest activity.

I decided to analyze the distribution of casual and member users throughout the day. I did this by dividing the day into four 6-hour periods: morning, afternoon, evening, and dawn, using the formula `=COUNTIFS('202411-divvy-tripdata.csv'!$E$2:$E,">=06:00:00.00",'202411-divvy-tripdata.csv'!$E$2:$E,"<12:00:00.000",'202411-divvy-tripdata.csv'!$Q$2:$Q,"casual",'202411-divvy-tripdata.csv'!$R$2:$R,1)` varying the time ranges and the user type.


![Image](https://github.com/user-attachments/assets/212eece8-c53a-45ef-b9e7-5ed6b57e92e2)


![Image](https://github.com/user-attachments/assets/6838ce32-5448-4593-bc9b-5fa652f2e198)


![Image](https://github.com/user-attachments/assets/bb259383-30f6-4faf-be94-c649f5ef5ca9)


![Image](https://github.com/user-attachments/assets/f3e1992e-9ae7-41a2-9fdb-2fea4b1bcbea)

Analyzing user behavior, it's possible to identify a usage pattern where afternoon periods are the busiest, followed by morning, evening, and early morning, for both casual riders and members

I made a [heatmap](https://github.com/enzocolamego/Cyclistic-Bike-Share-Analysis/blob/main/analysis/heatmap.R) to provide a different visual representation of the time distribution.


![Image](https://github.com/user-attachments/assets/ac7397fa-cc0e-4a7a-b6ff-fad69cfce6a4)


Members use bicycles for significantly longer overall than casual riders, primarily due to their larger numbers. However, casual riders have a higher average usage time per ride.

Data analysis shows that casual riders use bicycles most on weekends and Fridays, while members ride more consistently throughout the week. This suggests that members primarily use bikes for **commuting and exercise**, whereas casual riders use them for **leisure**. The evening period generally sees the least activity, except on Fridays when casual riders ride more at night than in the morning—likely because it’s the last workday of the week. On Sundays, evening usage drops sharply as people prepare for the workweek ahead.

I wanted to see if there was a preference for bike type, classic or electric, across user types and time of day.


### Casual:

![Image](https://github.com/user-attachments/assets/91b2f3fd-e87e-45fd-b56f-d9eb8bd82031)

![Image](https://github.com/user-attachments/assets/8b825857-9414-43d7-8fbe-9fb9f1673ad0)

![Image](https://github.com/user-attachments/assets/e4bf83f0-6578-4dc4-89c4-1ec0c13bcf81)

![Image](https://github.com/user-attachments/assets/cf14bca7-45cb-4475-9468-7fe0356568d2)

### Member:

![Image](https://github.com/user-attachments/assets/7c9f8f3b-a5fe-4d05-966c-1cef9c33b53f)

![Image](https://github.com/user-attachments/assets/e2038bbf-c750-4043-8e16-e721b21933d6)

![Image](https://github.com/user-attachments/assets/2ba0ee2f-39c7-45db-bab4-7b8fbf216058)

![Image](https://github.com/user-attachments/assets/08764377-5b06-4b2b-a678-6a43542c48b8)

Despite similar graph shapes across bike types, electric bikes show a noticeable preference. Casual riders use them 10.89% more than classic bikes, and members 11.01% more, suggesting comfort and convenience as key factors. This observation is corroborated by the analogous graph formations for different bike types, with the electric bike graphs consistently demonstrating an upward trend, signifying higher values.

A final analysis I conducted was to identify the most frequently used [start](https://github.com/enzocolamego/Cyclistic-Bike-Share-Analysis/blob/main/analysis/start%20stations%20code.SQL) and [end](https://github.com/enzocolamego/Cyclistic-Bike-Share-Analysis/blob/main/analysis/end%20stations%20code.SQL) stations among members and casual riders using SQL. The analysis reveals the three most popular start and end stations, segmented by user type. We observe a significant concentration of member activity at Kingsbury St & Kinzie St station, while casual riders heavily utilize the Streeter Dr & Grand Ave station. 

### Full result:

- [Most used start stations](https://github.com/enzocolamego/Cyclistic-Bike-Share-Analysis/blob/main/analysis/start%20stations%20result.csv)
- [Most used end stations](https://github.com/enzocolamego/Cyclistic-Bike-Share-Analysis/blob/main/analysis/end%20stations%20result.csv)

  ## 💡 Insights

  - Given the high concentration of casual riders at Streeter Dr & Grand Ave, DuSable Lake Shore Dr & Monroe St, and Millennium Park stations, implementing geolocalized marketing campaigns tailored to casual users could significantly boost membership conversion rates.
  - Although casual riders constitute only 27% of total users, they exhibit a higher average ride duration than members. Offering a special trial membership discount to casual riders who complete a certain number of trips within a month could effectively generate interest in annual memberships.
  - Casual rider usage of Cyclistic services reaches its highest point on weekends and Fridays, specifically from 10 AM to 4 PM. Offering promotional campaigns and discounts during these times could effectively attract new members.
