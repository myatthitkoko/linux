#!/bin/bash

echo "Format             : MM/DD/YYYY"
echo -n "Enter a future date: "
read futureDate

day=$((10#$(echo $futureDate | cut -f2 -d'/')))
month=$((10#$(echo $futureDate | cut -f1 -d'/')))
year=$((10#$(echo $futureDate | cut -f3 -d'/')))

function thirtyDays () {
    if [[ $month -eq 9 || $month -eq 4 || $month -eq 6 || $month -eq 11 ]]; then 
        if [[ $day -le 30 ]] ; then
            return 0
        else 
            return 1
        fi
    else
        return 0
    fi
}

function dayCheck () {
    if [[ $day -ge 1 ]] && [[ $day -le 31 ]] ; then
        return 0
    else 
        return 1
    fi
}

function monthCheck () {
    if [[ $month -ge 1 ]] && [[ $month -le 12 ]] ; then
        return 0
    else 
        return 1
    fi
}

function yearCheck () {
    if [[ $year -ge 0 ]] && [[ $year -le 9999 ]] ; then
        return 0
    else 
        return 1
    fi
}

function febCheck () {
    if [[ $month -eq 2 ]]; then
        if [[ $(( $year % 400)) -eq 0 ]] || ([[ $(( $year % 4 )) -eq 0 ]] && [[ $(( $year % 100 )) -ne 0 ]]); then
            if [[ $day -le 29 ]]; then
                return 0
            else
                return 1
            fi
        else if [[ $day -le 28 ]]; then
                return 0
            else
                return 1
            fi
        fi
    else
        return 0
    fi
}

function futureCheck () { #YYYYMMDD format comparison as integers also works but nested if for practice
    currentYear=$(date +%Y)
    currentMonth=$(date +%m)
    currentDay=$(date +%d)

    if [[ $currentYear -le $year ]]; then
        if [[ $currentYear -eq $year ]]; then
            if [[ $currentMonth -le $month ]]; then
                if [[ $currentMonth -eq $month ]]; then
                    if [[ $currentDay -le $day ]]; then
                        return 0
                    else
                        return 1
                    fi
                else
                    return 0
                fi
            else
                return 1
            fi
        else
            return 0
        fi
    else
        return 1
    fi
}

function notToday () {
    currentYear=$(date +%Y)
    currentMonth=$(date +%m)
    currentDay=$(date +%d)
    if [[ $day -eq $currentDay ]] && [[ $month -eq $currentMonth ]] && [[ $year -eq $currentYear ]]; then
        return 1
    else
        return 0
    fi
}

if thirtyDays && dayCheck && monthCheck && yearCheck && futureCheck && febCheck && notToday; then
    echo "valid future date"
else
    if ! thirtyDays || ! dayCheck; then
        echo "Invalid day"
    fi
    if ! monthCheck; then
        echo "Invalid month"
    fi
    if ! yearCheck; then
        echo "Invalid year"
    fi
    if ! futureCheck || ! notToday; then
        echo "Date must be in the future"
    fi
    if ! febCheck; then
        echo "Double Check February Date"
    fi
fi