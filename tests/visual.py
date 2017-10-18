# visual.py
# generates plots for the trace csvs

import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

TRACEDIR = "traces"
PLOTDIR = "plots"

mpl.style.use("fivethirtyeight")

# itrace plots
itrace = pd.read_csv(TRACEDIR + "/itrace.csv", index_col=False,
    names=["pid", "queue", "numContexts", "uop", "numUops", "cycleCount"])
print itrace.head()
num_pid = len(itrace["pid"].get_values())
unique_pids = set(itrace["pid"].get_values())
num_unique_pid = len(unique_pids)
print unique_pids


# instructions executed by vcore
fig, ax = plt.subplots(figsize=(10, 6))
# plt.scatter(itrace["cycleCount"], itrace["pid"], c=cm.hot(np.abs(y)), edgecolor='none')
plt.scatter(itrace["cycleCount"], itrace["pid"], c=itrace["pid"])
ax.set_title("PID vs. Time")
ax.set_xlabel("Time (cycles)", labelpad=10)
ax.set_ylabel("PID", labelpad=10)
plt.yticks(list(unique_pids))
plt.gca().get_yaxis().get_major_formatter().set_useOffset(False)
plt.tight_layout()
plt.savefig(PLOTDIR + "/vcore_exec2.png")

fig, ax = plt.subplots(figsize=(10, 6))
sns.countplot(y="queue", hue="pid", data=itrace)
ax.set_title("Virtual Core Thread Execution")
ax.set_xlabel("Microinstructions Executed", labelpad=10)
ax.set_ylabel("Virtual Core", labelpad=10)
plt.savefig(PLOTDIR + "/vcore_exec.png")
plt.show()
