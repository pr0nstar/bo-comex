---
type: Attested Computation
title: Balanza Comercial Anual de Bolivia
description: Cómputo atestado de la balanza comercial anual de Bolivia calculado como la diferencia entre Exportaciones FOB e Importaciones CIF.
license: CC-BY-4.0
tags:
  - balanza-comercial
  - macroeconomia
  - computacion
  - duckdb
generated:
  by: "process:okf-cli"
  at: "2026-11-12T00:00:00Z"
status: active
---

# Balanza Comercial Anual de Bolivia

## Description & Domain Context

La **Balanza Comercial** es la cuenta del sector externo que registra el saldo neto de las transacciones de bienes entre los residentes de Bolivia y el resto del mundo durante un período determinado (generalmente mensual o anual). 

Constituye un componente central de la balanza en cuenta corriente del Balance de Pagos publicado por el Banco Central de Bolivia (BCB) y el INE:

$$\text{Balanza Comercial} = \sum \text{Valor FOB}_{\text{Exportaciones}} - \sum \text{Valor CIF}_{\text{Importaciones}}$$

- **Superávit Comercial:** Saldo positivo ($\text{Exportaciones} > \text{Importaciones}$), indicando entrada neta de divisas por concepto de bienes.
- **Déficit Comercial:** Saldo negativo ($\text{Importaciones} > \text{Exportaciones}$), implicando una demanda de divisas superior al ingreso de exportación.

# Computation

La consulta estándar determinista para reproducir la serie histórica de la balanza comercial desde 1992 hasta 2026 se ejecuta en SQL analítico:

```sql
WITH exportaciones_anuales AS (
    SELECT 
        gestion,
        SUM(valor) AS total_exportaciones_fob_usd
    FROM 'exportaciones/*.parquet'
    GROUP BY gestion
),
importaciones_anuales AS (
    SELECT 
        gestion,
        SUM(valor_cif_sus) AS total_importaciones_cif_usd,
        SUM(valor_fob_sus) AS total_importaciones_fob_usd
    FROM 'importaciones/*.parquet'
    GROUP BY gestion
)
SELECT 
    e.gestion,
    ROUND(e.total_exportaciones_fob_usd / 1e6, 2) AS exp_fob_millones_usd,
    ROUND(i.total_importaciones_cif_usd / 1e6, 2) AS imp_cif_millones_usd,
    ROUND((e.total_exportaciones_fob_usd - i.total_importaciones_cif_usd) / 1e6, 2) AS saldo_comercial_millones_usd,
    CASE 
        WHEN (e.total_exportaciones_fob_usd - i.total_importaciones_cif_usd) >= 0 THEN 'SUPERAVIT'
        ELSE 'DEFICIT'
    END AS estado_balanza
FROM exportaciones_anuales e
JOIN importaciones_anuales i ON e.gestion = i.gestion
ORDER BY e.gestion DESC;
```

## Relación con otros Conceptos

- [Exportaciones](exportaciones.md): Flujo agregador de valores FOB.
- [Importaciones](importaciones.md): Flujo agregador de valores CIF.
- [Nomenclatura NANDINA](nandina.md): Desagregación a nivel de producto.
