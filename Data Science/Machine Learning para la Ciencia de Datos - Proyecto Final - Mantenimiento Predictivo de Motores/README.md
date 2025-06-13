# 🛠️ Predicción de Fallas en Motores con Machine Learning

Este proyecto utiliza técnicas de Machine Learning para predecir fallas en motores industriales a partir de sensores y registros históricos. Fue desarrollado como parte de un proceso de mantenimiento predictivo, con el objetivo de minimizar tiempos de inactividad y costos asociados a fallas inesperadas.

---

## 📊 Objetivos del Proyecto

- Predecir la probabilidad de falla de motores individuales.
- Clasificar los motores en niveles de **riesgo de falla**.
- Identificar las variables más relevantes que anticipan una avería.
- Aplicar el modelo en un entorno real simulando decisiones de mantenimiento preventivo.

---

## 🧠 Tecnologías utilizadas

- **Python 3.10**
- **Pandas**, **NumPy** – Limpieza y manipulación de datos.
- **Matplotlib**, **Seaborn** – Visualización de datos.
- **Scikit-learn** – Entrenamiento de modelos de clasificación.
- **Streamlit** – Interfaz de usuario para explorar el modelo (opcional).

---

## 🔁 Flujo del proyecto

1. **Importación y exploración de datos**
   - Limpieza y tratamiento de valores nulos.
   - Análisis de correlaciones y outliers.
2. **Preprocesamiento**
   - Codificación de variables categóricas.
   - Escalado de variables numéricas.
3. **Entrenamiento de modelos**
   - Modelos probados: Árbol de Decisión, Random Forest, y Regresores de Ensamble.
   - Métricas: Accuracy, Matriz de Confusión, ROC-AUC.
4. **Interpretación de resultados**
   - Importancia de variables.
   - Visualización de riesgo por motor.
5. **Aplicación del modelo**
   - Predicción sobre nuevos registros.
   - Estrategia de intervención basada en umbral de riesgo.

---

## 📈 Ejemplo de resultados

- Motor **`MTR_003`** → Probabilidad de Falla: **0.81** → Riesgo: **Alto**
- Motor **`MTR_021`** → Probabilidad de Falla: **0.15** → Riesgo: **Bajo**

> Se propone intervenir sobre los motores con riesgo alto (umbral > 0.30).

---

## 🏭 Aplicaciones en la industria

Este tipo de análisis puede ser implementado en sectores industriales que operan con maquinarias críticas, como:

- Plantas de procesamiento químico
- Industrias manufactureras
- Generación de energía
- Transporte y logística

---

## 📂 Estructura del repositorio

```
📦 prediccion-fallas-motores
├── data/                 # Dataset de entrenamiento
├── notebooks/            # Análisis exploratorio y modelado
├── src/                  # Scripts de procesamiento y predicción
├── app/                  # (opcional) Streamlit app
└── README.md
```

---

## ✅ Estado del proyecto

✅ Finalizado – Modelo entrenado y probado con datos sintéticos.  
🔜 Próximos pasos: Integración con sensores IoT y retraining automático.

---

## ✍️ Autor

**Matías Chamorro** – [LinkedIn](https://www.linkedin.com/in/tu-usuario/) | [Portfolio](https://github.com/tu-usuario)

---

## 📄 Licencia

Este proyecto está bajo la licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.
