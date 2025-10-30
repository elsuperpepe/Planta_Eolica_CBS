from tkinter import Tk
from Data_loader import cargar_datos
from Data_processing import preparar_dataframes
from UI_Menu import crear_menu

def main():
    archivo = r"Registros_Sistema_IDS.csv"
    df = cargar_datos(archivo)
    dataframes = preparar_dataframes(df)

    root = Tk()
    root.title("Análisis IDS - Menú principal")
    crear_menu(root, dataframes)
    root.mainloop()

if __name__ == "__main__":
    main()


