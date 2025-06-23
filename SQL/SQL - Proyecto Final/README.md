# 🚚 Proyecto Final SQL – Sistema de Logística de Envíos

Este proyecto fue desarrollado como entrega final del curso de SQL de Coderhouse. Consiste en la construcción completa de una base de datos relacional para una empresa de logística, incluyendo diseño, normalización, implementación de objetos SQL, y documentación técnica.

---

## 📌 Introducción

En un contexto de creciente demanda de servicios de paquetería, este sistema busca optimizar la gestión de envíos, el seguimiento de paquetes, la asignación de recursos y el manejo de reclamos, todo dentro de una red logística nacional.

---

## 🎯 Objetivos

- Diseñar y crear una base de datos relacional robusta.
- Reflejar los procesos clave de una empresa de logística.
- Desarrollar objetos SQL avanzados: funciones, procedimientos, vistas y triggers.
- Facilitar la generación de reportes que mejoren la toma de decisiones.

---

## 🧩 Modelo de Negocio

El sistema representa una empresa que gestiona envíos de paquetes desde distintas sucursales hacia zonas de destino. Permite:

- Registrar clientes, empleados, vehículos y sucursales.
- Procesar pedidos de envío y su trazabilidad en el tiempo.
- Realizar asignaciones de recursos.
- Atender reclamos de manera eficiente.

---

## 🗂️ Estructura del Proyecto

| Componente             | Descripción |
|------------------------|-------------|
| `01_creacion_de_las_tablas+insercion_de_datos.sql` | Creación de la base de datos y carga inicial de datos. |
| `02_vistas.sql`        | 5 vistas que resumen operaciones frecuentes. |
| `03_funciones.sql`     | 2 funciones: volumen de paquete y total de envíos por cliente. |
| `04_procedimientos.sql` | 2 procedimientos: registrar envíos y reclamos. |
| `05_triggers.sql`      | 2 triggers: registro automático de errores y control de eliminación. |
| `06_listado_de_tablas_con_descripción_de_su_estructura.sql` | Documentación técnica de cada tabla. |
| `DER`                  | Diagrama Entidad-Relación (disponible en el documento PDF). |

---

## 🧱 Tablas Incluidas (15)

Se implementaron 15 tablas, incluyendo:

- **Clientes, empleados, sucursales, vehículos**
- **Envíos, detalle_paquete, seguimiento_envio**
- **Zonas, tipos_envio, estados_envio, rutas**
- **Asignaciones, reclamos, usuarios_sistema, log_errores**

---

## 🧠 Funcionalidades destacadas

- Vistas SQL para análisis por cliente, zona, sucursal y estado.
- Funciones para cálculos dinámicos (volumen, total de envíos).
- Procedimientos que automatizan inserciones críticas.
- Triggers que controlan acciones sensibles como eliminación de registros entregados.

---

## 🛠️ Herramientas y tecnologías utilizadas

- **MySQL Workbench**
- **SQL (DDL, DML, DCL, TCL)**
- **Microsoft Office para documentación**
- **Diagrama E-R** elaborado en Lucidchart / Draw.io

---

## 📎 Documentación

Toda la documentación y scripts están incluidos en los archivos adjuntos y se puede acceder al resumen completo en el siguiente documento:

📄 [`Proyecto Final SQL – Sistema de Logística de Envíos.pdf`](./_Proyecto%20Final%20SQL%20–%20Sistema%20de%20Logística%20de%20Envíos.pdf)

---

## 🧭 Futuras líneas de trabajo

- Incorporación de auditorías de cambios.
- Desarrollo de reportes BI con Power BI o Tableau.
- Automatización de procesos mediante procedimientos programados.

---

## 🧾 Autor

Matías Chamorro  
[GitHub](https://github.com/chamomatias) | [LinkedIn](https://www.linkedin.com/in/chamomatias)

---
