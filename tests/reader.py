import sys
import h5py
filename = sys.argv[1]
f = h5py.File(filename, 'r')

# List all groups
print("Keys: %s" % f.keys())
statsKey = f.keys()[0]

# Get the data
print(statsKey)
data = list(f[statsKey])
print(data)
