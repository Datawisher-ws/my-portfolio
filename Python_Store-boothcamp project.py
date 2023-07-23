# -*- coding: utf-8 -*-

# -- Project --

# # Final Project - Analyzing Sales Data
# 
# **Date**: 23 July 2023
# 
# **Author**: Warisara Tipjuk
# 
# **Project**: `Pandas Foundation`


# import data
import pandas as pd
df = pd.read_csv("sample-store.csv")

# preview top 5 rows
df.head()

# shape of dataframe
df.shape

# see data frame information using .info()
df.info()

# TODO - convert order date and ship date to datetime in the original dataframe
df['Order Date'] = pd.to_datetime(df['Order Date'], format='%m/%d/%Y')
df['Ship Date'] = pd.to_datetime(df['Ship Date'], format='%m/%d/%Y')

df.head()

# TODO - count nan in postal code column
df['Postal Code'].isna().sum()

# TODO - filter rows with missing values
df [df.isna()]

# TODO - Order in each Region
count_region = df['Region'].value_counts()

count_region.sort_values(ascending=False)

# ## Data Analysis Part


# TODO 01 - how many columns, rows in this dataset
df.shape

# TODO 02 - is there any missing values?, if there is, which colunm? how many nan values?
df.isna().sum()

# TODO 03 - your friend ask for `California` data, filter it and export csv for him
state_california = df [df['State'] == 'California']

state_california.to_csv('state_california.csv')

# TODO 04 - your friend ask for all order data in `California` and `Texas` in 2017 (look at Order Date), send him csv file
state_2017 = df[ ((df['State'] == 'California') | (df['State'] == 'Texas')) & (df['Order Date'].dt.year == 2017) ]


state_2017.to_csv('state_2017.csv')

# TODO 05 - how much total sales, average sales, and standard deviation of sales your company make in 2017
data_2017 = df[df['Order Date'].dt.year == 2017]

data_2017 = pd.DataFrame(data_2017)

data_2017['Sales'].agg(['sum', 'mean', 'std'])

# TODO 06 - which Segment has the highest profit in 2018
sales_2018 = df[df['Order Date'].dt.year == 2018]
sales_2018 = pd.DataFrame(sales_2018)

max_sales2018 = sales_2018['Sales'].max()
max_sales2018

# TODO 07 - which top 5 States have the least total sales between 15 April 2019 - 31 December 2019

start_date = pd.to_datetime('4/15/2019', format='%m/%d/%Y')
end_date = pd.to_datetime('12/31/2019', format='%m/%d/%Y')

range_df = df[(df['Order Date'] >= start_date) & (df['Order Date'] <= end_date) ].sort_values('Sales')

range_df.head(5)


# TODO 08 - what is the proportion of total sales (%) in West + Central in 2019 e.g. 25% 
state_2019 = df[(df['Order Date'].dt.year == 2019) & ((df['Region'] == 'West') | (df['Region'] == 'Central'))]
df_2019 = df[(df['Order Date'].dt.year == 2019)]
per_totalsales2019 = (state_2019['Sales'].sum()/df_2019['Sales'].sum())*100

per_totalsales2019.round(2)


# TODO 09 - find top 10 popular products in terms of number of orders vs. total sales during 2019-2020
range_time = df[(df['Order Date'].dt.year >= 2019) & (df['Order Date'].dt.year <= 2020)]

product_sales = range_time.groupby('Product Name')['Sales'].sum()
product_sales = pd.DataFrame(product_sales)

product_sales.sort_values('Sales', ascending=False).head(10)

# TODO 10 - plot at least 2 plots, any plot you think interesting :)
# 1. Bar chart for total sales in each region
region_sales = df.groupby('Region')['Sales'].sum()
region_sales = pd.DataFrame(region_sales)
region_sales.plot(kind='bar', color='gold');

df['Region'].value_counts().plot(kind='bar', color='gold');

# 2. Profit in each year
df.groupby([df['Order Date'].dt.year])['Profit'].sum().plot(kind='bar', color='#0F9D58');

# TODO Bonus - use np.where() to create new column in dataframe to help you answer your own questions
# Profit and Loss
import numpy as np

df['P&L'] = np.where(df['Profit'] >= 0, 'Profit', 'Loss')

df

