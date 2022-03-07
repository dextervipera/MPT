import numpy as np
import  pandas as pd

electrical = pd.read_csv("example\MPT-electrical.txt", delimiter="\t", header=[0])
print (electrical)
