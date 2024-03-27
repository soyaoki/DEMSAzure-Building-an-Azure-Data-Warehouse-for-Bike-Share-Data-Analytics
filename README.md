# Project Overview
Divvy is a bike sharing program in Chicago, Illinois USA that allows riders to purchase a pass at a kiosk or use a mobile application to unlock a bike at stations around the city and use the bike for a specified amount of time. The bikes can be returned to the same station or to another station. The City of Chicago makes the anonymized bike trip data publicly available for projects like this where we can analyze the data.

Since the data from Divvy are anonymous, we have created fake rider and account profiles along with fake payment data to go along with the data from Divvy. The dataset looks like this:

![This image represents the data model for the dataset based on the Divvy Bikeshare data. The tables include: Rider, Account, Payment, Trip, and Station.](https://video.udacity-data.com/topher/2022/February/6205b1d2_divvy-erd/divvy-erd.png)
Relational ERD for the Divvy Bikeshare Dataset (with fake data tables)

The goal of this project is to develop a data warehouse solution using Azure Synapse Analytics. You will:

- Design a star schema based on the business outcomes listed below;
- Import the data into Synapse;
- Transform the data into the star schema;
- and finally, view the reports from Analytics.

## The business outcomes you are designing for are as follows:
1. Analyze how much time is spent per ride
- Based on date and time factors such as day of week and time of day
- Based on which station is the starting and / or ending station
- Based on age of the rider at time of the ride
- Based on whether the rider is a member or a casual rider
2. Analyze how much money is spent
- Per month, quarter, year
- Per member, based on the age of the rider at account start
3. EXTRA CREDIT - Analyze how much money is spent per member
- Based on how many rides the rider averages per month
- Based on how many minutes the rider spends on a bike per month

On the next page are instructions for logging in to an Azure account where you can configure the resources, Azure Synapse Workspace, and data storage to complete the project.
If you are not fully familiar with date dimensions, this article from MSSQL Tips on [Creating a date dimension or calendar table in SQL Server](https://www.mssqltips.com/sqlservertip/4054/creating-a-date-dimension-or-calendar-table-in-sql-server/) is a good refresh.

# Environments

## Project Environment
In order to complete this project, you'll need to use these tools:

- Access to Microsoft Azure.
- Python to run the script to load data into a PostgreSQL database on Azure to simulate your OLTP data source
- An editor to work with the Python and SQL scripts, we recommend [Visual Studio Code](https://code.visualstudio.com/)


## Local Machine Instructions
To work locally on this project, you'll need to have [Python](https://www.python.org/downloads/) and [Visual Studio Code](https://code.visualstudio.com/) installed, or another editor of your choice to run Python scripts.

## Starter Code and Data
You'll need a Python script found in the [Github project starter repository](https://github.com/udacity/Azure-Data-Warehouse-Project/tree/main/starter). Instructions for using this script for loading data are on the next page, in the project instructions

You'll need the [dataset](https://video.udacity-data.com/topher/2022/March/622a5fc6_azure-data-warehouse-projectdatafiles/azure-data-warehouse-projectdatafiles.zip) from the course resources menu in the left navigation bar. Instructions for how to use the data in your project are on the next page in the project instructions

