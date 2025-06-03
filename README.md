# Análisis de compañías de taxis en Chicago (SQL + Web scraping + EDA)

Este proyecto explora el comportamiento de las compañías de taxi en la ciudad de Chicago durante el mes de noviembre de 2017. Se utilizó una combinación de herramientas para realizar un análisis robusto y multidimensional.

##  Objetivo
Analizar el volumen de viajes por compañía y entender cómo las condiciones climáticas pudieron haber influido en la frecuencia de uso del servicio de taxi.

##  Herramientas utilizadas

- **SQL** (consultas avanzadas con `GROUP BY`, `JOIN`, `ORDER BY`)
- **Python (pandas, BeautifulSoup, requests)** para extraer datos desde una tabla en HTML
- **Jupyter Notebook** para integrar código, visualizaciones y conclusiones

##  Componentes del análisis

1. **Extracción de datos SQL**: se consultó una base de datos para determinar la cantidad de viajes por compañía durante los días 15 y 16 de noviembre.
2. **Web scraping de clima**: se extrajo información meteorológica desde una tabla HTML disponible públicamente ([fuente](https://practicum-content.s3.us-west-1.amazonaws.com/data-analyst-eng/moved_chicago_weather_2017.html)).
3. **Análisis exploratorio y visualización**: se integraron ambas fuentes para explorar correlaciones y tendencias, permitiendo validar hipótesis sobre el impacto del clima.

##  Resultados destacados

- Las compañías con mayor cantidad de viajes fueron claramente identificadas.
- Se observaron patrones interesantes entre días con precipitaciones y volumen de viajes.

##  Conclusión

Este proyecto muestra cómo **SQL** es una herramienta fundamental para el análisis estructurado de datos, especialmente cuando se trabaja con bases grandes. A su vez, el uso de **web scraping** permite enriquecer nuestros análisis accediendo a fuentes complementarias sin depender de APIs.

##  Archivos disponibles

- `Proyecto_SQL.ipynb`: Notebook con todo el análisis
- `Proyecto_SQL.pdf`: Versión PDF para visualización rápida

---

# Trabajar con SQL desde un notebook con SQLAlchemy es una práctica moderna y poderosa, especialmente útil para proyectos de análisis de datos que combinan datos relacionales con transformaciones o visualizaciones en Python.

**Ventajas clave frente a usar MySQL Workbench o similares:**

- **Integración con Python:** Puedes ejecutar consultas SQL y procesar los resultados de inmediato con pandas, matplotlib, seaborn, etc., lo cual es ideal para análisis exploratorio, dashboards y modelos de machine learning.

- **Documentación enriquecida:** Puedes intercalar celdas Markdown con código para documentar hipótesis, interpretar resultados y dejar todo como un informe reproducible.

- **Reproducibilidad total:** Todo el proceso queda guardado en un único notebook, lo cual facilita compartir tu trabajo con otros analistas o subirlo a GitHub.

- **Automatización sencilla:** Desde Python puedes automatizar tareas con SQL como actualización de datos, filtrado, o envío de reportes.

- **Versatilidad en entornos remotos:** No estás limitado a una sola interfaz; puedes conectarte a múltiples tipos de bases de datos (PostgreSQL, MySQL, SQLite, Redshift, etc.) desde un solo entorno.
