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
num_unique_pid = len(set(itrace["pid"].get_values()))
print set(itrace["pid"].get_values())


# instructions executed by vcore
fig, ax = plt.subplots(figsize=(10, 6))
# sns.countplot(y="queue", hue="pid", data=itrace)
plt.plot(itrace["cycleCount"], itrace["pid"], 'bo')
ax.set_title("Virtual Core Thread Execution")
ax.set_xlabel("Cycle Count", labelpad=10)
ax.set_ylabel("PID", labelpad=10)
plt.tight_layout()
plt.savefig(PLOTDIR + "/vcore_exec.png")
plt.show()
