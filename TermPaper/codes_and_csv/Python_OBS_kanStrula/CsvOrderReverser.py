"""
THIS PROGRAM CALCULATES CORRELATION FOR FORMATED AND SORTED TIME SERIES

CREATED FOR ME2720 Macroeconomics for business VT2016

NOTES:
Assuming format of data is:
Country - Time series (n-times) - avg
"""

import csv

#Read in files
rawdata = []
with open('US_CPI_raw_r.csv') as csvfile:
    reader = csv.reader(csvfile, delimiter = ";")
    for row in reader:
        rawdata.append(row)


#Reverse Data
ReverseData=[]
#REVERSE ORDER FOR US
for i in reversed(rawdata):
    ReverseData.append(i)



# DEFINE CSV-WRITER FUNCTION
def csvWrite(data, file):
    with open(file, 'a', newline='') as csvfile:
                writer = csv.writer(csvfile, delimiter = ";")
                writer.writerow(data)
    return

for i in ReverseData:
    csvWrite(i,"US_CPI_raw.csv")

