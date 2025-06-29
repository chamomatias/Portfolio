# Predicción de Fallas en Motores

Este proyecto aplica técnicas de **Machine Learning** para predecir si un motor entrará en estado de falla en los próximos **15 días**, a partir de datos operativos y de sensores.

## 🔍 Objetivo

Desarrollar un modelo predictivo que permita anticipar fallas en motores, optimizando así las tareas de mantenimiento preventivo y evitando paradas no planificadas.

## 🧠 Enfoque de Machine Learning

1. **Exploración y limpieza de datos**  
   Se analizaron las variables más relevantes, se eliminaron valores faltantes y se normalizaron los datos para su posterior modelado.

2. **Modelo entrenado: `XGBoostClassifier`**  
   Se seleccionó el algoritmo XGBoost por su rendimiento superior en problemas de clasificación con datos tabulares.

3. **Evaluación del modelo**  
   El modelo se entrenó y validó con datos históricos, logrando una precisión del **73%**, con métricas equilibradas entre clases.

4. **Exportación del modelo**  
   El modelo final fue serializado como `modelo_xgboost.pkl` para ser usado en producción.

## 🚀 Aplicación Web (Streamlit)

Se desarrolló una app en Streamlit que permite:

- Subir un archivo CSV con datos de nuevos motores.
- Predecir si cada motor fallará o no.
- Visualizar los resultados y descargarlos en un archivo.

La aplicación está desplegada en línea mediante **Streamlit Community Cloud**.

## 📁 Estructura del repositorio

```
├── app.py                  # App Streamlit
├── models/
│   └── modelo_xgboost.pkl  # Modelo entrenado serializado
├── notebooks/              # Análisis exploratorio y entrenamiento
├── reports/                # Resultados gráficos
├── src/                    # Scripts auxiliares (preprocesamiento, features, etc.)
├── tests/                  # Pruebas del sistema
├── requirements.txt        # Librerías necesarias
└── README.md               # Descripción del proyecto
```

## 🔧 Librerías clave

- `pandas`, `numpy`
- `scikit-learn`
- `xgboost`
- `matplotlib`
- `streamlit`
