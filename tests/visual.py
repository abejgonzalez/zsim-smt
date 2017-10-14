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
    names=["pid", "queue", "numContexts", "uop", "numUops"])
print itrace.head()

# instructions executed by vcore
fig, ax = plt.subplots(figsize=(10, 6))
sns.countplot(y="queue", hue="pid", data=itrace)
ax.set_title("Virtual Core Thread Execution")
ax.set_xlabel("Microinstructions Executed [uop]", labelpad=10)
ax.set_ylabel("Virtual Core", labelpad=10)
plt.tight_layout()
plt.savefig(PLOTDIR + "/vcore_exec.png")
plt.show()
