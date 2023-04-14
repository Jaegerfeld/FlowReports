import matplotlib.pyplot as plt
import numpy as np


def scatterplot_test(table):

    x = table['Created Date']
    y = table['CycleDays']
    plt.scatter(x, y, color = 'blue')

    #x = np.array([2,3,8,15,16,5,11,14,9,14])
    #y = np.array([107,90,66,86,130,98,100,76,67,88])
    #plt.scatter(x, y, color = 'red')

    plt.show()


