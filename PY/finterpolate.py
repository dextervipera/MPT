import numpy as np
import pandas as pd
from scipy.interpolate import interp1d
from dict_SeebTest import dictST as dST


def seebtest_v01_interp(heat: pd.DataFrame, electrical: pd.DataFrame) -> None:
    heat_interp = interp1d(heat.loc[:, "Temperature"], heat.loc[:, "Lambda"], bounds_error=False, fill_value="extrapolate")
    for i in range(0, len(electrical)):
        electrical.loc[i, "Lambda"] = heat_interp(electrical.loc[i, "Temperatura"])
        #print(i, electrical.loc[i, "Lambda"])


def seebtest_v01_recalczt(electrical: pd.DataFrame) -> None:
    """

    :rtype: object
    """
    for i in range(0, len(electrical)):
        electrical.iloc[i, dST['ZT']] = pow(base=electrical.iloc[i, dST['seebeck']]/10e6, exp=2) * electrical.iloc[i, dST["swl"]] * electrical.iloc[i, dST['temperatureABS']] / electrical.iloc[i, dST['Lambda']]
        #print(type(electrical.iloc[i, dST['LP']]), type(electrical.iloc[i, dST['seebeck']]), type(electrical.iloc[i, dST["swl"]]), electrical.iloc[i, dST['temperatureABS']], electrical.iloc[i, dST['Lambda']])


if __name__ == "__main__":
    pass
