---
type: governance
title: Términos de Uso, Compromiso y Marco Legal (INE)
description: Marco normativo, condiciones de uso y cláusula de atribución obligatoria para las bases de datos de comercio exterior del INE.
license: CC-BY-4.0
sources:
  - id: ine-comex-portal
    resource: http://web2.ine.gob.bo:8081/IneComex/BasesComex.aspx
    title: Portal de Bases de Datos de Comercio Exterior del INE
    author: org:ine-bolivia
tags:
  - gobernanza
  - marco-legal
  - ine
  - atribucion
  - terminos-de-uso
generated:
  by: "process:okf-cli"
  at: "2026-11-12T00:00:00Z"
status: active
---

# Términos de Uso, Compromiso y Marco Legal (INE)

## Portal Fuente Oficial
- **URL de Origen:** [http://web2.ine.gob.bo:8081/IneComex/BasesComex.aspx](http://web2.ine.gob.bo:8081/IneComex/BasesComex.aspx)
- **Institución Emisora:** Instituto Nacional de Estadística (INE), Estado Plurinacional de Bolivia.
- **Servicio:** Sistema de Consulta de Comercio Exterior y Bases de Datos en Formato de Texto.

---

## 1. Antecedentes Normativos

El Instituto Nacional de Estadística, en atención a las facultades otorgadas por el **Decreto Ley No. 14100** del *Sistema Nacional de Información Estadística*, tiene entre sus principales funciones recolectar, elaborar, analizar y publicar las estadísticas oficiales del país:

1. **Sistemas de Difusión (Decreto Ley 14100, Art. 8º inc. r):**
   Establece como función del INE definir y aprobar los sistemas de información de datos estadísticos y decidir el servicio de computación más adecuado a nivel regional y nacional. Bajo esta atribución, el INE determinó dos modalidades de difusión pública de Comercio Exterior: el Sistema de Consulta interactivo y las Bases de Datos descargables.
2. **Seguridad y Confidencialidad (Decreto Ley 14100, Art. 24º):**
   Dispone que todos los archivos banco de datos estadísticos generados por sistemas de computación deben contener sistemas de seguridad y protección de la información, salvaguardando el secreto estadístico y la integridad de los registros.
3. **Principio Constitucional de Transparencia (CPE, Arts. 8 y 232):**
   La Constitución Política del Estado Plurinacional consagra la transparencia como principio ético-moral y regla rectora del ejercicio de la función y administración pública.
4. **Difusión Pública Oportuna (Decreto Supremo 23318-A, Art. 5º):**
   Estipula que el desempeño transparente de la función pública involucra difundir información antes, durante y después de la ejecución de sus actos, procurando una comprensión básica por parte de la sociedad sobre la asignación, recursos y resultados oficiales.

---

## 2. Compromiso de Uso Responsable y Cláusula de Atribución

En el marco legal citado, todo usuario, investigador, analista o agente que consuma, procese o redistribuya esta base de datos asume el siguiente compromiso formal establecido por el INE:

> ### PRIMERO (Integridad de Datos)
> Hacer uso responsable de la información contenida en esta Base de Datos descargada, lo que implica entre otros aspectos **no modificar los datos originales**.

> ### SEGUNDO (Cláusula de Atribución Obligatoria)
> Mencionar en los cuadros, gráficos, modelos, reportes y estudios que se generen:
> 
> > **“Elaboración propia con Base de Datos de Comercio Exterior del Instituto Nacional de Estadística”**
> 
> *Nota de deslinde:* Los procesos, transformaciones y cálculos realizados con esta base son de exclusiva responsabilidad del autor o usuario, y no comprometen institucionalmente al INE.

> ### TERCERO (Titularidad de Derechos)
> Aceptar que la puesta a disposición de estos datos no transfiere, cede ni comparte los derechos de propiedad intelectual de la Base de Datos, los cuales permanecen bajo titularidad del Instituto Nacional de Estadística.

---

## 3. Implementación en este Repositorio OKF

Este paquete de conocimiento cumple estrictamente con el compromiso:
- **Preservación Inmutable:** Los microdatos originales han sido transcritos sin alteración numérica a formato Apache Parquet para optimización de lectura, conservando la integridad de cada declaración aduanera.
- **Trazabilidad Abierta:** Todo procesamiento analítico o query derivado explicita la cláusula de atribución y mantiene aislada la capa de datos respecto a los cálculos de valor agregado.
