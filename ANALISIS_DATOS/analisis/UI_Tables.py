import tkinter as tk
from pandastable import Table
import matplotlib.pyplot as plt
import pandas as pd

def mostrar_tabla(df: pd.DataFrame, titulo: str):
    """Muestra un DataFrame en una ventana de pandastable."""
    win = tk.Toplevel()
    win.title(titulo)
    frame = tk.Frame(win)
    frame.pack(fill="both", expand=True)
    tabla = Table(frame, dataframe=df, showtoolbar=False, showstatusbar=True)
    tabla.show()

def mostrar_grafica_eventos(ataques_por_hora: pd.DataFrame):
    """Muestra la gráfica de eventos por hora."""
    plt.figure(figsize=(8, 4))
    ataques_por_hora.set_index('Hora')['Conteo'].plot(kind='bar')
    plt.title("Eventos por hora")
    plt.xlabel("Hora del día")
    plt.ylabel("Cantidad de eventos")
    plt.tight_layout()
    plt.show()
