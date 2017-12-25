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
with open('US_GDP_real_Q_2009_r.csv') as csvfile:
    reader = csv.reader(csvfile, delimiter = ";")
    for row in reader:
        rawdata.append(row)


#Linear intepolation function - step between
def LinearInt(datalist, i,step):
    try:
        diff = float(datalist[i+1][1])-float(datalist[i][1])
        inc = diff/step
    except:
        inc = 0
    return inc, step

#Reverse Data
ReverseData=[]
#REVERSE ORDER FOR US
for i in reversed(rawdata):
    ReverseData.append(i)

#Fill new datalist with all data point incl. interpolated points
IntData=[]
for i in range(len(ReverseData)):
    inc, step = LinearInt(ReverseData,i,3)
    try:
        for j in range(step):
            IntData.append(float(ReverseData[i][1])+j*inc)
    except:
        print("error",i, ReverseData[i])



# DEFINE CSV-WRITER FUNCTION
def csvWrite(data, file):
    with open(file, 'a', newline='') as csvfile:
                writer = csv.writer(csvfile, delimiter = ";")
                writer.writerow([data])
    return

for i in IntData:
    csvWrite(i,"US_GDP_real_Q_2009_raw.csv")

