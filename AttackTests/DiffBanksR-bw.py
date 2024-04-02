import matplotlib.pyplot as plt
import csv
import sys

def read_data_from_csv(file_path):
    data = {"WSS": [], "SoloBW": [], "DiffBankBW": [], "SameBankBW": []}
    with open(file_path, 'r') as file:
        reader = csv.DictReader(file)
        for row in reader:
            data["WSS"].append(int(row["WSS"]))
            data["SoloBW"].append(float(row["SoloBW"]))
            data["DiffBankBW"].append(float(row["DiffBankBW"]))
            data["SameBankBW"].append(float(row["SameBankBW"]))
    return data

file_path = sys.argv[1]+'attack/sepbanksR-bw.csv'

data = read_data_from_csv(file_path)

x = data["WSS"]
y1 = data["SoloBW"]
y2 = data["DiffBankBW"]
y3 = data["SameBankBW"]

plt.plot(x, y1, label='Solo BW', linestyle=(0, (3, 5, 1, 5, 1, 5)), color='blue')
plt.plot(x, y2, label='DiffBank BW', linestyle=(0, (5, 10)), color='green')
plt.plot(x, y3, label='SameBank BW', color='red')
plt.axhline(y=2500, color='black', linestyle='--', linewidth=1, label="Ref Line (y=2500)")

plt.xlabel('WSS(KB)')
plt.ylabel('Bandwidth(MB/s)')
plt.title('BeagleV Bankisol (BkPLL victim) BW -- Read')
plt.legend()

plt.xticks(x,x)

plt.grid(True)
plt.savefig('bankisolR-bw_test.png')

