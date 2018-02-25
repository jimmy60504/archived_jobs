from pyproj import Proj
import numpy as np
import pandas as pd
from pandas import DataFrame

pd.options.display.float_format = '{:.7f}'.format

data = np.loadtxt("cdp/08_501_BL3.txt")
df = DataFrame(data, columns=['cdp', 'lon', 'lat'])

myProj = Proj("+proj=utm +zone=50 +ellps=WGS84 +datum=WGS84 +unit=m +no_defs")
df["x"], df["y"] = myProj(df['lon'].values, df['lat'].values, inverse=False)

print(df)

np.savetxt(r'cdp/501.txt', df.values, fmt='%7i %12.6f %12.6f %12.2f %12.2f')