from finterpolate import seebtest_v01_interp, seebtest_v01_recalczt
import numpy as np
import pandas as pd

class SeebTestContainer:
    electrical = None
    heat = None
    def __init__(self):
        self.electrical = pd.read_csv("example\MPT-electrical.txt", delimiter="\t", header=[0])
        self.heat = pd.read_csv("example\MPT-lambda_table.txt", delimiter="\t", header=[0])
        seebtest_v01_interp(self.heat, self.electrical)
        seebtest_v01_recalczt(self.electrical)

    def debug_memory(self):
        print(self.electrical.columns, self.electrical.iloc[0, 2])

