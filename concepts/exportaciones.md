---
type: dataset
title: Exportaciones de Bolivia
description: Registro histórico mensual de exportaciones de mercancías de Bolivia (1992-2026) valoradas en dólares FOB.
license: CC-BY-4.0
tags:
  - exportaciones
  - bolivia
  - comercio-exterior
  - fob
  - ine
skos:
  - "http://www.wikidata.org/entity/Q22881"
  - "http://www.wikidata.org/entity/Q750"
contracts:
  - type: datapackage
    path: "../datapackage.json"
generated:
  by: "process:okf-cli"
  at: "2026-11-12T00:00:00Z"
status: active
freshness:
  cadence: P1M
---

# Exportaciones de Bolivia (1992–2026)

## Description & Domain Context

El conjunto de datos de exportaciones captura la salida legal de mercancías nacionales o nacionalizadas del territorio aduanero boliviano con destino al resto del mundo, registradas oficialmente en las Declaraciones Únicas de Exportación (DUE / DEX).

El valor estadístico se registra en **dólares estadounidenses ($us FOB)**, representando el valor de la mercancía puesta a bordo del medio de transporte en el punto de salida fronterizo boliviano, excluyendo costos internacionales de flete y seguro hacia destino final.

## Methodology, Scope & Biases

1. **Sectores de Exportación:**
   - **Exportaciones Tradicionales:** Agrupa los sectores extractivos históricos de Bolivia:
     - *Minería:* Concentrados y minerales refinados (zinc, plata, plomo, estaño, oro, antimonio).
     - *Hidrocarburos:* Gas natural y combustibles líquidos transportados vía ductos a países vecinos (Brasil, Argentina).
   - **Exportaciones No Tradicionales:** Mercancías del sector agroindustrial, manufacturas y alimentos (soya y derivados, castaña/nuez de la Amazonía, quinua, maderas, textiles, joyería).
2. **Dimensiones Clave:**
   - Temporal: `gestion` (1992 a 2026) y `mes` (1 a 12).
   - Producto: Código de 10 dígitos [NANDINA](nandina.md) y clasificaciones agregadas CUCI, GCE y CIIU.
   - Geografía: Departamento de origen (`depart`, `desdep`) y país de destino (`pais`, `despais`).
   - Logística: Modo de transporte (`desmedi`: carretera, aéreo, férreo, ductos, fluvial) y vía aduanera de salida (`desvia`).
3. **Advertencia Histórica sobre Gestión 2020:**
   - En la partición `1992.parquet` a `2026.parquet`, la gestión 2020 contiene etiquetas de columna pre-normalizadas por el INE (`kilnet` en lugar de `peso_neto_kg`). Se debe contemplar este alias al consultar dicha gestión específica.

## Operational Interaction & Example Queries

```sql
-- Principales productos exportados en la última gestión completa (2025)
SELECT 
    nandina,
    desnan,
    cltnt,
    ROUND(SUM(valor) / 1e6, 2) AS valor_fob_millones_usd,
    ROUND(SUM(peso_neto_kg) / 1e3, 2) AS peso_neto_toneladas
FROM 'exportaciones/2025.parquet'
GROUP BY nandina, desnan, cltnt
ORDER BY valor_fob_millones_usd DESC
LIMIT 10;
```

## Relación con otros Conceptos

- Importaciones: Flujo comercial inverso para el cómputo de balanza de pagos.
- Balanza Comercial: Indicador sintético de superávit o déficit comercial.
- [Nomenclatura NANDINA](nandina.md): Especificación técnica de los códigos arancelarios.
