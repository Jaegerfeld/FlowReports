
import os
from pathlib import Path  

def exportCSV(table, name):
    
    firstpart = os.getcwd() + "/Export/"
    

    filepath = Path(firstpart + name + ".csv")  
    filepath.parent.mkdir(parents=True, exist_ok=True)  
    table.to_csv(filepath)  