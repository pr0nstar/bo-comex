---
type: dataset
title: Importaciones de Bolivia
description: Registro histórico mensual de importaciones de mercancías de Bolivia (1992-2026) valoradas en dólares CIF y FOB con liquidación arancelaria.
license: CC-BY-4.0
tags:
  - importaciones
  - bolivia
  - comercio-exterior
  - cif
  - fob
  - aranceles
  - ine
  - aduana
skos:
  - "http://www.wikidata.org/entity/Q166548"
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

# Importaciones de Bolivia (1992–2026)

## Description & Domain Context

El conjunto de datos de importaciones compila la entrada definitiva de bienes y suministros provenientes del mercado internacional a territorio aduanero boliviano, tramitadas a través de declaraciones aduaneras de importación (DUI / DIM).

Constituye una serie de alta granularidad (>9.6 millones de registros), registrando no solo los montos financieros en divisas extranjeras (**$us CIF** y **$us FOB**), sino también su liquidación en moneda nacional (**Bs. CIF**) y el monto recaudado por concepto de **Gravamen Arancelario (GA)**.

## Methodology, Scope & Biases

1. **Métricas de Valuación:**
   - **Valor CIF ($us):** Costo de la mercancía más seguros y fletes hasta la aduana nacional de ingreso. Es el valor de referencia estándar para la balanza comercial y la base imponible aduanera.
   - **Valor FOB ($us):** Costo de la mercancía en el puerto de embarque original.
   - **Gravamen Arancelario (Bs.):** Impuesto directo a la importación liquidado por la Aduana Nacional de acuerdo a la alícuota fijada en el Arancel Aduanero de Importaciones de Bolivia.
2. **Clasificación por Uso o Destino Económico (CUODE):**
   - *Bienes de Consumo:* Alimentos, bebidas, manufacturas de consumo duradero y no duradero.
   - *Materias Primas y Productos Intermedios:* Insumos para la agricultura, industria manufacturera y construcción.
   - *Bienes de Capital:* Maquinaria y equipos industriales, equipo de transporte y herramientas de producción.
   - *Combustibles y Lubricantes:* Diésel oíl, gasolina y aditivos importados.
3. **Aduanas de Ingreso y Geografía:**
   - Desglose por aduanas interiores, fronterizas, aeroportuarias y de zonas francas (`desadu`).
   - Departamento de radicación aduanera / destino (`desdepto`).
   - País de procedencia y origen (`despai`).

## Operational Interaction & Example Queries

```sql
-- Principales categorías de importación por CUODE en la gestión 2024
SELECT 
    descuo AS clasificacion_cuode,
    COUNT(*) AS total_despachos,
    ROUND(SUM(valor_cif_sus) / 1e6, 2) AS total_cif_millones_usd,
    ROUND(SUM(gravamen_aduanero_bs) / 1e6, 2) AS gravamen_millones_bs
FROM 'importaciones/2024.parquet'
GROUP BY descuo
ORDER BY total_cif_millones_usd DESC;
```

## Relación con otros Conceptos

- Exportaciones: Flujo de salida para el contraste de balanza de pagos.
- Balanza Comercial: Medición sintética de la brecha comercial.
- [Nomenclatura NANDINA](nandina.md): Clasificación a 10 dígitos.
- Clasificaciones Económicas: Agrupaciones CUODE, GCE, CIIU y CUCI.
