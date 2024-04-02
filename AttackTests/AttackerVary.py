import matplotlib.pyplot as plt
import numpy as np
import sys

data = np.genfromtxt(sys.argv[1]+'attack/attackvarytest.csv', delimiter=',')
print(data)
print(data[1][0])

x=np.arange(len(data) - 1)

i=0
y1=[]
y2=[]
y3=[]
y4=[]
ticks=[]
for run in x:
    ticks.append(data[run+1][0])
    y1.append(data[run+1][1])
    y2.append(data[run+1][2])
    y3.append(data[run+1][3])
    y4.append(data[run+1][4])

print(ticks)
print(y1)
print(y2)
print(y3)
print(y4)
width=0.1

plt.bar(x-0.15, y1, width, color='blue')
plt.bar(x-0.05, y2, width, color='green')
plt.bar(x+0.05, y3, width, color='orange')
plt.bar(x+0.15, y4, width, color='red')

plt.xticks(x, ticks)
plt.xlabel("Victim WSS (KB)")

plt.ylabel("Slowdown")
plt.ylim(0,10)
plt.axhline(y=1, color='black', linestyle='--', linewidth=1)

plt.title("BeagleV Attacker Count Impact")
plt.legend(["Reference Line (y=1)", "Solo BwRead", "1 BkPLLWrite", "2 BkPLLWrite", "3 BkPLLWrite"])

plt.savefig('attackvary_test.png')

