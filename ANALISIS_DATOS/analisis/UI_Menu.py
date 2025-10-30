import tkinter as tk
from tkinter import ttk
from UI_Tables import mostrar_tabla, mostrar_grafica_eventos

def crear_menu(root: tk.Tk, dataframes: dict):
    """Crea la ventana de menú principal con las opciones de tablas."""
    tk.Label(
        root,
        text="Seleccione una opción para mostrar la tabla:",
        font=("Arial", 12)
    ).pack(pady=10)

    def ver_tabla(nombre: str):
        mostrar_tabla(dataframes[nombre], nombre)
        if nombre == "Eventos por hora":
            mostrar_grafica_eventos(dataframes[nombre])

    for nombre in dataframes.keys():
        ttk.Button(root, text=nombre, command=lambda n=nombre: ver_tabla(n)).pack(
            fill="x", padx=20, pady=5
        )

    ttk.Button(root, text="Salir", command=root.destroy).pack(pady=15)
