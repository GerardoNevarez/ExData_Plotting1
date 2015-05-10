head -n 1 household_power_consumption.txt > power.txt
grep "^[1|2]/2/2007" household_power_consumption.txt >> power.txt

