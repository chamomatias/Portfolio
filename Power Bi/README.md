# 📊 Portfolio de Proyectos en Power BI

Este repositorio reúne una selección de dashboards y visualizaciones desarrollados para analizar distintas temáticas a partir de datos reales o simulados. Cada proyecto incluye detalles sobre su objetivo, origen de datos, modelo utilizado y un enlace para ver el informe en Power BI.

---

## 📌 Índice de proyectos

1. [Proy_01 – Gráfico de ciclos (Liq_divisas_por_exp_de_oleaginosas_y_cereales)](#proy_01--gráfico-de-ciclos-liq_divisas_por_exp_de_oleaginosas_y_cereales)
2. [Proy_02 – Dashboard Análisis de maíz](#proy_02--dashboard-análisis-de-maíz)
3. [Proy_03 – Seguimiento de stocks](#proy_03--seguimiento-de-stocks)
4. [Proy_04 – Data - Proyecto final](#proy_04--data---proyecto-final)

---

# Proy_01 – Gráfico de ciclos (Liq_divisas_por_exp_de_oleaginosas_y_cereales)

## Introducción
El gráfico de ciclos es una herramienta elegante que me permitió explorar, al mismo tiempo, la tendencia general de una variable en el tiempo y sus ciclos estacionales. Lo usé para analizar mes a mes el comportamiento de ciertas métricas a lo largo de varios años.

Con este enfoque, busqué:

- **Detectar patrones estacionales** repetitivos.
- **Comparar cada año** frente a los anteriores.
- **Hacer más intuitivo** el análisis de series temporales.

## Datos
Fuente: datos oficiales de la Secretaría de Gobierno de Energía de Argentina  
[sspm-liquidacion-divisas-por-exportaciones-oleaginosas-cereales](https://datos.gob.ar/dataset/sspm-liquidacion-divisas-por-exportaciones-oleaginosas-cereales/archivo/sspm_349.2)

## Limpieza de datos
- Python y pandas.
- Reemplazo de puntos por comas.
- Separador de columnas estandarizado.

## Modelo
**Modelo híbrido (semi-dimensional).**

## Demo  
🔗 [Ver dashboard](https://app.powerbi.com/view?r=eyJrIjoiOWVlNWY0NDAtNmQyZS00Y2Y2LWI5MzEtZmQzOTliYTVmNzk0IiwidCI6IjkxZjVjYjg5LTUyZmUtNDdhYi05MDVmLTRlMzU4ODZmNWE1NyIsImMiOjR9)

---

# Proy_02 – Dashboard Análisis de maíz

## Introducción
Desarrollé este tablero para controlar la entrega de materia prima. Me permitió comparar el desempeño entre períodos distintos y detectar cuellos de botella.

## Datos
Datos sintéticos basados en valores reales.  
Se aplicó una variación promedio de ±25%.

## Limpieza de datos
Realizada completamente en **Power Query**.

## Modelo
**Modelo en estrella** (hechos + dimensiones).

## Demo  
🔗 [Ver dashboard](https://app.powerbi.com/view?r=eyJrIjoiYWRmZDFhNjQtMjIwZS00YzY2LWExZWItMjBlMGUyZTdmYWI3IiwidCI6IjkxZjVjYjg5LTUyZmUtNDdhYi05MDVmLTRlMzU4ODZmNWE1NyIsImMiOjR9)

---

# Proy_03 – Seguimiento de stocks

## Introducción
Este tablero tiene como fin **controlar y analizar stocks** de materia prima y productos elaborados.  
Incorpora un **gráfico de ciclos** para visualizar la estacionalidad en el tiempo.

## Datos
Datos sintéticos con comportamiento similar a los datos reales.

## Limpieza de datos
Procesamiento realizado con **Python**.  
El notebook está disponible en la carpeta `dataset`.

## Modelo
**Modelo híbrido (semi-dimensional)**: hechos + calendario.

## Demo  
🔗 [Ver dashboard](https://app.powerbi.com/view?r=eyJrIjoiMDM0MTQ3YTEtOWQ3Ni00ODk5LWFjMDgtYjYwYWU3YzE4NTQ5IiwidCI6IjkxZjVjYjg5LTUyZmUtNDdhYi05MDVmLTRlMzU4ODZmNWE1NyIsImMiOjR9)

---

# Proy_04 – Data - Proyecto final

## Introducción
Presenté este tablero como **proyecto final de la diplomatura en Ciencia de Datos**.  
Aunque presenta algunas redundancias, se ajustó a los requisitos definidos por **Coderhouse**.

## Datos
Dataset provisto por **Coderhouse**.

## Limpieza de datos
Realizada con **Power Query**, siguiendo los lineamientos del curso.

## Modelo
**Modelo en estrella**.

## Demo  
🔗 [Ver dashboard](https://app.powerbi.com/view?r=eyJrIjoiNjkxMTZmOGEtMzJhNi00OGRlLTg3OGEtMGU1YzJmNDc0OTE1IiwidCI6IjkxZjVjYjg5LTUyZmUtNDdhYi05MDVmLTRlMzU4ODZmNWE1NyIsImMiOjR9)