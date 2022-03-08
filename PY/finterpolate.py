import numpy as np
import pandas as pd
from scipy.interpolate import interp1d

def seebtest_v01_interp(heat, electrical):
    heat_interp = interp1d(heat.loc[:,"Temperature"], heat.loc[:,"Lambda"], bounds_error=False, fill_value="extrapolate")
    for i in range(1,len(electrical)):
         electrical.loc[i,"Lambda"] = heat_interp(electrical.loc[i,"Temperatura"])
         print(i, electrical.loc[i,"Lambda"])

def seebtest_v01_recalczt(electrical):
    for i in range(1, len(electrical)):
        electrical.iloc[i, 18] = electrical.loc[i, 3]

if __name__ == "__main__":
    pass


