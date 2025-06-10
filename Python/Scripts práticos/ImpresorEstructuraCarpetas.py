
import os
import csv

ruta = r"G:\Mi unidad\Portfolio - GD\Portfolio"
nombre_archivo = "ImpresorEstructuraCarpetas.csv"
estructura = []

for carpeta_raiz, carpetas, archivos in os.walk(ruta):
    for carpeta in carpetas:
        estructura.append([os.path.join(carpeta_raiz, carpeta), "Carpeta"])
    for archivo in archivos:
        estructura.append([os.path.join(carpeta_raiz, archivo), "Archivo"])

with open(nombre_archivo, mode='w', newline='', encoding='utf-8') as archivo_csv:
    escritor = csv.writer(archivo_csv)
    escritor.writerow(["Ruta", "Tipo"])
    escritor.writerows(estructura)

print(f"Estructura guardada en '{nombre_archivo}'")
