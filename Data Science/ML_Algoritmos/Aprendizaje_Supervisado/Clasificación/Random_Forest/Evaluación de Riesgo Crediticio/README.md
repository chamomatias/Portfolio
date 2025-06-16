# Evaluación de Riesgo Crediticio con Machine Learning

## Objetivo

Este proyecto tiene como finalidad construir un modelo de clasificación binaria que prediga la probabilidad de que un solicitante de crédito incurra en incumplimiento (default). La solución está orientada a entidades financieras que buscan optimizar su proceso de aprobación de préstamos, minimizando el riesgo crediticio.

## Dataset

Se utilizó un conjunto de datos con más de 32.000 registros de solicitudes de crédito. Cada registro contiene información personal, financiera y crediticia del solicitante.

### Principales columnas

- `person_age`: Edad del solicitante
- `person_income`: Ingreso anual
- `person_emp_length`: Años de empleo
- `loan_amnt`: Monto del préstamo solicitado
- `loan_int_rate`: Tasa de interés del préstamo
- `loan_percent_income`: Porcentaje del ingreso destinado al préstamo
- `cb_person_default_on_file`: Registro previo de incumplimiento
- `loan_status`: Variable objetivo (1 = incumplimiento, 0 = cumplimiento)

## Metodología

El pipeline del proyecto sigue las etapas comunes de un flujo de trabajo en Machine Learning:

1. Análisis exploratorio y limpieza de datos
2. Ingeniería de variables
3. División en conjunto de entrenamiento y prueba
4. Entrenamiento de modelos de clasificación
5. Evaluación comparativa con métricas estándar

## Modelo seleccionado

Se ha elegido el modelo **Random Forest Classifier** como solución principal por las siguientes razones:

- **Buen desempeño predictivo**: combina múltiples árboles de decisión y reduce el riesgo de sobreajuste.
- **Robustez ante outliers y ruido**: no requiere escalado de variables.
- **Importancia de variables**: permite interpretar cuáles son las características más relevantes en la decisión del modelo.

Se evaluó también un modelo base de **Regresión Logística** para comparación.

## Métricas de evaluación

Las métricas utilizadas para evaluar el desempeño fueron:

- Accuracy
- Precision
- Recall
- F1-Score
- AUC-ROC

## Conclusión

El modelo entrenado permite anticipar el riesgo de incumplimiento con una buena precisión y puede ser integrado en un sistema de evaluación crediticia automatizado. En futuras etapas se podrá refinar mediante optimización de hiperparámetros y validación cruzada.

---

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Profile-blue)](https://www.linkedin.com/in/m-chamorro/)
