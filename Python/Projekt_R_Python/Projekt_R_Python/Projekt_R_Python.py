import Import_CSV
import Calculate_CT


df = Import_CSV.importIssueTimes()

Calculate_CT.calculate_CT(df)





