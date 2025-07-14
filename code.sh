#!/bin/bash

#Declaring the important values

YEAR=$(date +%Y)
MONTH=$(date +%m)
DAY=$(date +%d)

#going to the data website

curl -s "wttr.in/casablanca?format=j1" -o weather.json

#Observed Temperature and Forecasted Temperature declared

OBS=$(jq -r '.current_condition[0].temp_C' weather.json)
FC=$(jq -r '.weather[1].hourly[4].tempC' weather.json)

#declaring file

FILE="weather_report.tsv"

#if condition, if the file with the same name doesn't exist, make new and start it with headers

if [ ! -f "$FILE" ]; then
    echo -e "year\tmonth\tday\tobs_temp\tfc_temp" > "$FILE"
fi

#otherwise save a new line of the data

echo -e "${YEAR}\t${MONTH}\t${DAY}\t${OBS}\t    ${FC}" >> "$FILE"