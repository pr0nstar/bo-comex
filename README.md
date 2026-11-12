---
type: reference
title: "bo-comex: Comercio Exterior de Bolivia (1992-2026)"
description: "Data Product y Knowledge Bundle OKF v0.2 de Importaciones y Exportaciones de Bolivia a nivel de partida arancelaria NANDINA."
license: CC-BY-4.0
tags:
  - comercio-exterior
  - bolivia
  - exportaciones
  - importaciones
  - ine
  - aduana
  - nandina
  - macroeconomia
status: active
generated:
  by: "process:okf-cli"
  at: "2026-11-12T00:00:00Z"
---

# bo-comex: Comercio Exterior de Bolivia (1992–2026)

[![OKF Conformance](https://img.shields.io/badge/OKF-v0.2_Compliant-00C853?style=flat-square)](https://openknowledge.org/okf/v0.2)
[![Data Mesh Ready](https://img.shields.io/badge/DataMesh-Federated_Product-0070F3?style=flat-square)](index.md)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg?style=flat-square)](https://creativecommons.org/licenses/by/4.0/)

Repositorio de microdatos y paquete de conocimiento estandarizado (**OKF Knowledge Bundle & Data Product**) del comercio exterior de Bolivia, cubriendo 35 años de serie histórica continua (1992 a 2026) en transacciones aduaneras oficiales de **Exportaciones** e **Importaciones**.

---

## Fuente Oficial y Cláusula de Atribución Obligatoria

Los microdatos originales proceden del portal del **Instituto Nacional de Estadística (INE)**:
- **Descarga Oficial:** [http://web2.ine.gob.bo:8081/IneComex/BasesComex.aspx](http://web2.ine.gob.bo:8081/IneComex/BasesComex.aspx)
- **Marco Legal:** Decreto Ley No. 14100 (Arts. 8r y 24), Constitución Política del Estado (Arts. 8 y 232) y Decreto Supremo 23318-A (Art. 5).

> ### Cláusula de Cita Requerida por el INE:
> Todo cuadro, gráfico, modelo o investigación que utilice esta base de datos debe citar obligatoriamente:
> 
> > **“Elaboración propia con Base de Datos de Comercio Exterior del Instituto Nacional de Estadística”**
> 
> *Deslinde:* Los procesos y cálculos realizados son de exclusiva responsabilidad del autor y no comprometen al INE. Consulte el documento de gobernanza en [`concepts/terminos_y_marco_legal.md`](concepts/terminos_y_marco_legal.md).

---

## Estructura del Repositorio

El repositorio sigue la especificación formal **Open Knowledge Format (OKF v0.2)** y el perfil **ODKF v0.2**:

```text
bo-comex/
  ├── datapackage.json               # Contrato de datos y esquema Frictionless
  ├── index.md                       # Manifiesto DCAT v3 / ODKF v0.2 de entrada raíz
  ├── log.md                         # Libro de contabilidad cronológico (OKF §9)
  ├── README.md                      # Presentación ejecutiva y quickstart
  ├── concepts/                      # Conceptos semánticos y metodológicos (OKF §4)
  │   ├── index.md                   # Directorio de conceptos
  │   ├── terminos_y_marco_legal.md  # D.L. 14100, D.S. 23318-A y atribución obligatoria
  │   ├── exportaciones.md           # Flujo de salida, valuación FOB y sectores
  │   ├── importaciones.md           # Internación aduanera, CIF/FOB y gravamen
  │   ├── nandina.md                 # Clasificador arancelario de la CAN (10 dígitos)
  │   ├── balanza_comercial.md       # Cómputo atestado de saldo comercial
  │   └── clasificaciones_economicas.md # CUCI, GCE, CIIU y CUODE
  ├── queries/                       # Consultas analíticas SQL de referencia
  │   ├── index.md                   # Catálogo de consultas
  │   ├── balanza_comercial_historica.sql
  │   ├── top_10_exportaciones_recientes.sql
  │   ├── socios_comerciales_historicos.sql
  │   └── importaciones_por_medio_transporte.sql
  ├── exportaciones/                 # 35 particiones Parquet anuales (1992-2026)
  └── importaciones/                 # 35 particiones Parquet anuales (1992-2026)
```

---

## Volumen y Resumen Estadístico

| Flujo | Registros | Rango Temporal | Valuación Principal | Particiones |
| :--- | :--- | :--- | :--- | :--- |
| **Exportaciones** | **544.635** filas | 1992 – 2026 (trim. I) | **$us FOB** ($196.646 millones acumulados) | 35 archivos Parquet (18 MB) |
| **Importaciones** | **9.606.197** filas | 1992 – 2026 (trim. I) | **$us CIF** ($192.725 millones acumulados) | 35 archivos Parquet (242 MB) |

---

## Quickstart: Consulta Analítica

### 1. Con Python y DuckDB (Carga instantánea sin descompresión)

```python
import duckdb

con = duckdb.connect()

# Calcular balanza comercial anual 2020-2025
query = """
WITH exp AS (
    SELECT gestion, SUM(valor) AS exp_usd
    FROM 'exportaciones/*.parquet'
    WHERE gestion BETWEEN 2020 AND 2025
    GROUP BY gestion
),
imp AS (
    SELECT gestion, SUM(valor_cif_sus) AS imp_usd
    FROM 'importaciones/*.parquet'
    WHERE gestion BETWEEN 2020 AND 2025
    GROUP BY gestion
)
SELECT 
    e.gestion,
    ROUND(e.exp_usd / 1e6, 2) AS exportaciones_fob_m_usd,
    ROUND(i.imp_usd / 1e6, 2) AS importaciones_cif_m_usd,
    ROUND((e.exp_usd - i.imp_usd) / 1e6, 2) AS saldo_m_usd
FROM exp e
JOIN imp i ON e.gestion = i.gestion
ORDER BY e.gestion DESC;
"""

print(con.execute(query).df())
```

### 2. Con DataMesh CLI

```bash
# Inspeccionar manifiesto federado
datamesh get .

# Muestra de exportaciones
datamesh query bo-comex:exportaciones --limit 10
```

---

## Fuentes de Datos y Cita Oficial

- **Instituto Nacional de Estadística (INE) del Estado Plurinacional de Bolivia:** Estadísticas oficiales de comercio exterior basadas en declaraciones aduaneras. [http://web2.ine.gob.bo:8081/IneComex/BasesComex.aspx](http://web2.ine.gob.bo:8081/IneComex/BasesComex.aspx)
- **Aduana Nacional de Bolivia:** Administración tributaria aduanera. [https://www.aduana.gob.bo](https://www.aduana.gob.bo)

Licencia: [Creative Commons Atribución 4.0 Internacional (CC-BY-4.0)](https://creativecommons.org/licenses/by/4.0/).
