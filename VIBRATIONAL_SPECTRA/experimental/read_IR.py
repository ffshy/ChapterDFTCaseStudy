#!/usr/bin/env python3
# -*- coding:utf-8 *-

import numpy as np
import matplotlib.pyplot as plt
from jcamp import JCAMP_reader

filename = "NIST_142-08-5-IR.jdx"

jcamp_dict =JCAMP_reader(filename)
plt.plot(jcamp_dict["x"], jcamp_dict["y"])
plt.title(filename)
plt.xlabel(jcamp_dict["xunits"])
plt.ylabel(jcamp_dict["yunits"])
# save the data
scale = 500.0
data = np.column_stack((jcamp_dict["x"], jcamp_dict["y"] * scale))
np.savetxt("expt_IR.dat", data, fmt="%20.10g")
plt.show()
