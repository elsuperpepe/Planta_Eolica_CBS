import pandas as pd

def cargar_datos(ruta_csv: str) -> pd.DataFrame:
    return pd.read_csv(ruta_csv)
