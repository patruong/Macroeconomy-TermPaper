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
with open('BNPSverige.csv') as csvfile:
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

#Fill new datalist with all data point incl. interpolated points
IntData=[]
for i in range(len(rawdata)):
    inc, step = LinearInt(rawdata,i,3)

    for j in range(step):
        IntData.append(float(rawdata[i][1])+j*inc)

ReverseIntData=[]
REVERSE ORDER FOR US
for i in reversed(IntData):
    print(i)

# DEFINE CSV-WRITER FUNCTION
def csvWrite(data, file):
    with open(file, 'a', newline='') as csvfile:
                writer = csv.writer(csvfile, delimiter = ";")
                writer.writerow([data])
    return

for i in IntData:
    csvWrite(i,"File.csv")

