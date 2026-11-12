---
type: dcat:Dataset
id: bo_comex
title: Comercio Exterior de Bolivia (1992-2026)
description: Microdatos oficiales armonizados de comercio exterior (exportaciones e importaciones) de Bolivia desde 1992 hasta 2026 a nivel de partida arancelaria NANDINA.
conformsTo: https://openknowledge.org/okf/v0.2
license: CC-BY-4.0
tags:
  - comercio-exterior
  - exportaciones
  - importaciones
  - bolivia
  - nandina
  - macroeconomia
  - ine
  - aduana
sources:
  - id: ine-comex-portal
    resource: http://web2.ine.gob.bo:8081/IneComex/BasesComex.aspx
    title: Portal de Bases de Datos de Comercio Exterior del Instituto Nacional de Estadística
    author: org:ine-bolivia
publisher:
  name: Instituto Nacional de Estadística (INE) & Aduana Nacional de Bolivia
  email: contacto@ine.gob.bo
  url: https://www.ine.gob.bo
spatial:
  country: BO
  regions: ["BO-B", "BO-C", "BO-H", "BO-L", "BO-O", "BO-P", "BO-S", "BO-T", "BO-N"]
  bbox: [-69.64, -22.9, -57.45, -9.67]
temporal:
  start: 1992-01-01T00:00:00Z
  end: 2026-03-31T23:59:59Z
contracts:
  - type: datapackage
    path: datapackage.json
resources:
  - name: exportaciones
    path: exportaciones/2024.parquet
    format: parquet
    hash: sha256:3a18ee31b28c7857c894fbd4f0d30675784ba45da174c81244a3ecca173604c5
  - name: importaciones
    path: importaciones/2024.parquet
    format: parquet
    hash: sha256:03d8c2219bf93a219dfb223138e22cccafd08c16ddcb016944780e8513b4a7b1
generated:
  by: "process:okf-cli"
  at: 2026-11-12T00:00:00Z
status: active
---

# Comercio Exterior de Bolivia (1992-2026)

Este paquete de conocimiento abierto (**Knowledge Bundle & Data Product**) compila de forma integral, armonizada y optimizada más de tres décadas del comercio exterior de Bolivia, abarcando **exportaciones** e **importaciones** desde el año 1992 hasta 2026 a nivel de desagregación mensual y partida arancelaria de 10 dígitos (NANDINA).

Implementa la especificación **Open Knowledge Format (OKF v0.2 / ODKF v0.2)** y los principios **FAIR (Findable, Accessible, Interoperable, Reusable)**, facilitando la consulta de alta velocidad para humanos, motores analíticos OLAP (DuckDB, ClickHouse) y agentes de inteligencia artificial mediante el protocolo **DataMesh**.

---

## Provenance, Marco Normativo & Cláusula de Atribución Obligatoria

Los microdatos fuente provienen del portal oficial del Instituto Nacional de Estadística (INE):
- **Portal de Origen:** [http://web2.ine.gob.bo:8081/IneComex/BasesComex.aspx](http://web2.ine.gob.bo:8081/IneComex/BasesComex.aspx)
- **Marco Legal:** Decreto Ley Nº 14100 (Sistema Nacional de Información Estadística, Arts. 8r y 24), Constitución Política del Estado (Arts. 8 y 232) y Decreto Supremo Nº 23318-A (Art. 5).

### Compromiso de Uso y Cita Obligatoria

De conformidad con los términos fijados por el INE para la descarga y reutilización de estas bases de datos:

> Todo estudio, investigación, gráfico, tabla o publicación derivado de estos datos DEBE incluir obligatoriamente la siguiente atribución:
> 
> **“Elaboración propia con Base de Datos de Comercio Exterior del Instituto Nacional de Estadística”**

*Deslinde de responsabilidad:* Los cálculos, estimaciones y análisis derivados son de exclusiva responsabilidad de sus autores y no comprometen institucionalmente al INE. Consulte el detalle completo en [Términos de Uso y Marco Legal](concepts/terminos_y_marco_legal.md).

---

## Description & Domain Context

El comercio internacional de Bolivia constituye uno de los pilares macroeconómicos esenciales para el análisis de balanza de pagos, disponibilidad de reservas internacionales netas (RIN), cadenas de suministro transfronterizas y patrones de inserción comercial global. 

Las series estadísticas son generadas primariamente por el **Instituto Nacional de Estadística (INE)** en coordinación con la **Aduana Nacional de Bolivia**, recopiladas a partir de las declaraciones aduaneras de exportación (DEX) e importación (DIM/DUI).

- **Exportaciones (1992–2026):** Más de 544.000 registros históricos detallando producto (NANDINA), sector (tradicional / no tradicional), departamento de origen, país de destino, bloque comercial, medio de transporte, volumen físico (kg) y valor oficial en dólares estadounidenses ($us FOB).
- **Importaciones (1992–2026):** Más de 9.600.000 registros detallando mercancía (NANDINA), aduana de ingreso/nacionalización, departamento de destino, país de origen, vía logística, clasificaciones económicas (CUODE, GCE, CIIU, CUCI), volúmenes (kg bruto), valor en dólares ($us FOB y CIF), valor en moneda nacional (Bs. CIF) y gravamen arancelario aduanero liquidado.

---

## Methodology, Scope & Biases

1. **Unidades de Valoración:**
   - **Exportaciones:** Valuadas exclusivamente en **$us FOB** (Free On Board) en frontera o puerto de salida boliviano.
   - **Importaciones:** Valuadas en **$us CIF** (Cost, Insurance and Freight) en aduana de destino nacional y **$us FOB** en puerto de embarque de origen. Adicionalmente se incluye el valor liquidado en Bolivianos (**Bs. CIF**) y el **Gravamen Arancelario (GA)**.
2. **Nomenclatura Arancelaria:**
   - La clasificación principal se rige bajo la **NANDINA** (Nomenclatura Arancelaria Común de la Comunidad Andina), alineada con el Sistema Armonizado (SA) de la Organización Mundial de Aduanas (OMA).
   - Para compatibilidad analítica internacional, se incluyen cruces oficiales con **CUCI Rev. 3** (SITC), **GCE Rev. 3** (Grandes Categorías Económicas), **CIIU Rev. 3** (ISIC) y **CUODE** (Uso o Destino Económico).
3. **Puntualizaciones Metodológicas y Advertencias:**
   - **Gestión 2020 (Exportaciones):** La nomenclatura de columnas en la fuente original presentó variaciones históricas de nombres (`kilnet` en lugar de `peso_neto_kg`). Para análisis multi-anual se recomienda utilizar las consultas armonizadas provistas en este repositorio.
   - **Gestión 2026:** Comprende datos provisionales disponibles correspondientes al primer trimestre (enero a marzo de 2026).
   - **Contrabando y Comercio No Registrado:** Las series reflejan únicamente transacciones aduaneras formales registradas ante la Aduana Nacional. Flujos informales o no declarados quedan fuera del marco estadístico oficial.

---

## Architecture & Resource Partitioning

Para maximizar el rendimiento analítico y minimizar el uso de memoria, el corpus se encuentra particionado por gestión anual en formato columnar comprimido **Apache Parquet**:

```text
bo-comex/
  ├── datapackage.json               # Contrato de datos Frictionless v1/v2
  ├── index.md                       # Manifiesto DCAT/ODKF y navegación raíz
  ├── log.md                         # Registro inmutable cronológico de auditoría
  ├── README.md                      # Documentación ejecutiva y quickstart
  ├── concepts/                      # Documentos semánticos de conceptos OKF
  │   ├── index.md                   # Índice del directorio de conceptos
  │   ├── terminos_y_marco_legal.md  # D.L. 14100, D.S. 23318-A y atribución obligatoria
  │   ├── exportaciones.md           # Flujo FOB y sectores
  │   ├── importaciones.md           # Valuación CIF/FOB, aduanas y gravamen
  │   ├── nandina.md                 # Clasificador arancelario CAN (10 dígitos)
  │   ├── balanza_comercial.md       # Cómputo atestado de saldo comercial
  │   └── clasificaciones_economicas.md # CUCI, GCE, CIIU y CUODE
  ├── queries/                       # Consultas analíticas SQL estándar
  │   ├── index.md
  │   ├── balanza_comercial_historica.sql
  │   ├── top_10_exportaciones_recientes.sql
  │   ├── socios_comerciales_historicos.sql
  │   └── importaciones_por_medio_transporte.sql
  ├── exportaciones/                 # 35 particiones anuales (1992.parquet - 2026.parquet)
  └── importaciones/                 # 35 particiones anuales (1992.parquet - 2026.parquet)
```

---

## Progressive Disclosure & Concepts Directory

Navegación progresiva a través de los conceptos nucleares del dominio:

* [Términos de Uso y Marco Legal](concepts/terminos_y_marco_legal.md) — Antecedentes normativos del INE (D.L. 14100, D.S. 23318-A), términos de compromiso y cláusula de atribución obligatoria.
* [Exportaciones](concepts/exportaciones.md) — Metodología de registro, flujos FOB, destinos internacionales y estructura tradicional vs. no tradicional.
* [Importaciones](concepts/importaciones.md) — Despacho aduanero, valoración CIF/FOB, recaudación de gravamen arancelario y clasificación por destino económico (CUODE).
* [Nomenclatura NANDINA](concepts/nandina.md) — Estructura jerárquica de 10 dígitos, capítulos, subpartidas y correlación con el Sistema Armonizado.
* [Balanza Comercial](concepts/balanza_comercial.md) — Definición y cómputo atestado de saldo comercial anual ($Valor FOB_{exp} - Valor CIF_{imp}$).
* [Clasificaciones Económicas](concepts/clasificaciones_economicas.md) — Mapeo y aplicación de CUCI, GCE, CIIU y CUODE para análisis macroeconómico.

---

## Operational Interaction & Example Queries

### 1. Conexión Rápida vía DataMesh CLI

```bash
# Inspección del producto de datos y validación de contrato
datamesh get .

# Consulta de recursos tabulares
datamesh query bo-comex:exportaciones --limit 5
```

### 2. Análisis OLAP Multi-Anual con DuckDB en Python

```python
import duckdb

con = duckdb.connect()

# Balanza comercial agregada histórica (1992-2026)
query = """
WITH exp AS (
    SELECT gestion, SUM(valor) AS exp_fob_usd
    FROM 'exportaciones/*.parquet'
    GROUP BY gestion
),
imp AS (
    SELECT gestion, SUM(valor_cif_sus) AS imp_cif_usd
    FROM 'importaciones/*.parquet'
    GROUP BY gestion
)
SELECT 
    e.gestion,
    e.exp_fob_usd,
    i.imp_cif_usd,
    (e.exp_fob_usd - i.imp_cif_usd) AS balanza_comercial_usd
FROM exp e
JOIN imp i ON e.gestion = i.gestion
ORDER BY e.gestion DESC;
"""

df_balanza = con.execute(query).df()
print(df_balanza.head(10))
```

---

## Data Dictionary & Semantic Anchors

Consulte los esquemas detallados en los contratos [datapackage.json](datapackage.json) y en los documentos de concepto [Exportaciones](concepts/exportaciones.md) e [Importaciones](concepts/importaciones.md).
