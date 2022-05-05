import altair as alt
import pandas as pd
import numpy as np
import streamlit as st
from vega_datasets import data
from PIL import Image
import matplotlib.pyplot as plt
import matplotlib.dates


silver_on = pd.read_csv('Data/silver_on.csv')
silver_off = pd.read_csv('Data/silver_off.csv')
gold_on = pd.read_csv('Data/gold_on.csv')
gold_off = pd.read_csv('Data/gold_off.csv')
green_on = pd.read_csv('Data/green_on.csv')
green_off = pd.read_csv('Data/green_off.csv')

daily_silver_on = pd.read_csv('Daily/silver_daily.csv').drop(columns=['DailyAvgOff'])
daily_silver_off = pd.read_csv('Daily/silver_daily.csv').drop(columns=['DailyAvgOn'])
daily_gold_on = pd.read_csv('Daily/gold_daily.csv').drop(columns=['DailyAvgOff'])
daily_gold_off = pd.read_csv('Daily/gold_daily.csv').drop(columns=['DailyAvgOn'])
daily_green_on = pd.read_csv('Daily/green_daily.csv').drop(columns=['DailyAvgOff'])
daily_green_off = pd.read_csv('Daily/green_daily.csv').drop(columns=['DailyAvgOn'])





def bars(line_selection, total_selection):
    
    if (line_selection == 'Silver' and total_selection == 'Year Total'):
        
        st.title('Silver Line: Year Total (ON)')
        chart = alt.Chart(silver_on.reset_index()).mark_bar().encode(
            x="Stop:N",
            y="Count:Q",
        ).properties(
            width=700,
            height=500
        ).interactive()
        st.write(chart)
        
        st.title('Silver Line: Year Total (OFF)')
        chart = alt.Chart(silver_off.reset_index()).mark_bar().encode(
            x="Stop:N",
            y="Count:Q",
        ).properties(
            width=700,
            height=500
        ).interactive()
        st.write(chart)
        
    if (line_selection == 'Gold' and total_selection == 'Year Total'):
        
        st.title('Gold Line: Year Total (ON)')
        chart = alt.Chart(gold_on.reset_index()).mark_bar().encode(
            x="Stop:N",
            y="Count:Q",
        ).properties(
            width=700,
            height=500
        ).interactive()
        st.write(chart)
        
        st.title('Gold Line: Year Total (OFF)')
        chart = alt.Chart(gold_off.reset_index()).mark_bar().encode(
            x="Stop:N",
            y="Count:Q",
        ).properties(
            width=700,
            height=500
        ).interactive()
        st.write(chart)
        
    if (line_selection == 'Green' and total_selection == 'Year Total'):
        
        st.title('Green Line: Year Total (ON)')
        chart = alt.Chart(green_on.reset_index()).mark_bar().encode(
            x="Stop:N",
            y="Count:Q",
        ).properties(
            width=700,
            height=500
        ).interactive()
        st.write(chart)
        
        st.title('Green Line: Year Total (OFF)')
        chart = alt.Chart(green_off.reset_index()).mark_bar().encode(
            x="Stop:N",
            y="Count:Q",
        ).properties(
            width=700,
            height=500
        ).interactive()
        st.write(chart)
        
    if (line_selection == 'Silver' and total_selection == 'Daily Average'):
        
        st.title('Silver Line: Daily Average (ON)')
        chart = alt.Chart(daily_silver_on.reset_index()).mark_bar().encode(
            x="Stops:N",
            y="DailyAvgOn:Q",
        ).properties(
            width=700,
            height=500
        ).interactive()
        st.write(chart)
        
        st.title('Silver Line: Daily Average (OFF)')
        chart = alt.Chart(daily_silver_off.reset_index()).mark_bar().encode(
            x="Stops:N",
            y="DailyAvgOff:Q",
        ).properties(
            width=700,
            height=500
        ).interactive()
        st.write(chart)
        

    if (line_selection == 'Green' and total_selection == 'Daily Average'):
        
        st.title('Green Line: Daily Average (ON)')
        chart = alt.Chart(daily_green_on.reset_index()).mark_bar().encode(
            x="Stops:N",
            y="DailyAvgOn:Q",
        ).properties(
            width=700,
            height=500
        ).interactive()
        st.write(chart)
        
        st.title('Green Line: Daily Average (OFF)')
        chart = alt.Chart(daily_green_off.reset_index()).mark_bar().encode(
            x="Stops:N",
            y="DailyAvgOff:Q",
        ).properties(
            width=700,
            height=500
        ).interactive()
        st.write(chart)
        
        
    if (line_selection == 'Gold' and total_selection == 'Daily Average'):
        
        st.title('Gold Line: Daily Average (ON)')
        chart = alt.Chart(daily_gold_on.reset_index()).mark_bar().encode(
            x="Stop:N",
            y="DailyAvgOn:Q",
        ).properties(
            width=700,
            height=500
        ).interactive()
        st.write(chart)
        
        st.title('Gold Line: Daily Average (OFF)')
        chart = alt.Chart(daily_gold_off.reset_index()).mark_bar().encode(
            x="Stop:N",
            y="DailyAvgOff:Q",
        ).properties(
            width=700,
            height=500
        ).interactive()
        st.write(chart)

busimage = Image.open("bus.jpeg")
        
st.sidebar.title("Niner Transit - ITCS 4155-051")  
st.sidebar.image(busimage, caption="")
st.sidebar.title("Select an Option:")

if st.sidebar.checkbox('Show Route Map'):
    st.title('Campus Route Information')
    image1 = Image.open('map.jpg')
    st.image(image1, caption="")


if st.sidebar.checkbox('Show Route Data'):
    st.title("Daily and Yearly Exploration Tool")
    line_selection = st.selectbox('Select Line:', ('Green', 'Silver', 'Gold'))
    total_selection = st.selectbox('Select Type:', ('Year Total', 'Daily Average'))
    bars(line_selection, total_selection)
    

if st.sidebar.checkbox('More Data'):
    st.title('More Data')
    data1 = Image.open('Data1.png')
    data2 = Image.open('Data2.png')
    st.image(data1, caption="")
    st.image(data2, caption="")