from finterpolate import seebtest_v01_interp, seebtest_v01_recalczt
import pandas as pd


class SeebTestContainer:
    electrical = None
    heat = None

    def __init__(self):
        self.electrical = pd.read_csv("example\MPT-electrical.txt", delimiter="\t", header=[0, 1])
        print(self.electrical)
        self.heat = pd.read_csv("example\MPT-lambda_table.txt", delimiter="\t", header=[0])
        seebtest_v01_interp(self.heat, self.electrical)
        seebtest_v01_recalczt(self.electrical)
        print(self.electrical.columns)

    def debug_memory(self):
        print(self.electrical.columns, self.electrical.iloc[0, 2])
