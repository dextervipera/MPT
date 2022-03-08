from finterpolate import seebtest_v01_interp, seebtest_v01_recalczt
import numpy as np
import pandas as pd


electrical = pd.read_csv("example\MPT-electrical.txt", delimiter="\t", header=[0])
heat = pd.read_csv("example\MPT-lambda_table.txt", delimiter="\t", header=[0])

seebtest_v01_interp(heat, electrical)

print(electrical.columns, electrical.iloc[0,2])

