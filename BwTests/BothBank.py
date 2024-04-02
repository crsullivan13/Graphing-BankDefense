import matplotlib.pyplot as plt
import numpy as np
import sys
import math

file_path = sys.argv[1]+'bw/bothbankbw-c1234.csv'

data = np.genfromtxt(file_path, delimiter='\n')
print(data)

i=1
x=[]
y=[]
for point in np.arange(len(data)):
    x.append(i)
    y.append(data[point])
    i += 1

print(y[0])

plt.plot(x, y, label='Both Bank BW', color='black')
plt.xlabel('Number of Cores')
plt.ylabel('Aggregate Bandwidth (MB/s)')
plt.title('BeagleV Aggregate BW')
plt.legend()

plt.xticks(x,x)
plt.yticks(np.arange(math.floor(min(y)/500.0)*500.0,(max(y)/500.0 + .5)*500,500))

plt.grid(True)
plt.savefig('bothbankbw.png')
