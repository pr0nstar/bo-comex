---
type: reference
title: Clasificaciones Económicas Internacionales
description: Mapeo y descripción de los clasificadores económicos CUCI, GCE, CIIU y CUODE integrados en los microdatos de bo-comex.
license: CC-BY-4.0
tags:
  - cuci
  - gce
  - ciiu
  - cuode
  - onu
  - clasificaciones
  - comercio-exterior
generated:
  by: "process:okf-cli"
  at: "2026-11-12T00:00:00Z"
status: active
---

# Clasificaciones Económicas Internacionales en bo-comex

## Description & Domain Context

Para permitir análisis económicos estructurados sin depender exclusivamente de los 10 dígitos de la [NANDINA](nandina.md), las bases de datos de exportaciones e importaciones integran clasificaciones macroeconómicas estandarizadas por la Organización de las Naciones Unidas (ONU) y organismos regionales.

## Clasificadores Incorporados

### 1. Clasificación Uniforme para el Comercio Internacional (CUCI Rev. 3 / SITC)
- **Campos:** `cuci3`, `descuci3` (en exportaciones); `cucir3`, `descuci` (en importaciones).
- **Propósito:** Clasificación estadística de mercancías por etapas de elaboración y clases de productos para comparabilidad histórica internacional.
- **Secciones Principales:** Alimentos y animales vivos (0), Bebidas y tabaco (1), Materiales crudos no comestibles (2), Combustibles y lubricantes (3), Aceites y grasas (4), Productos químicos (5), Artículos manufacturados (6), Maquinaria y equipo de transporte (7), Artículos manufacturados diversos (8), Mercancías no clasificadas (9).

### 2. Clasificación por Grandes Categorías Económicas (GCE Rev. 3 / BEC)
- **Campos:** `gce3`, `desgce3` (en exportaciones); `gcer3`, `desgce` (en importaciones).
- **Propósito:** Vincula las estadísticas de comercio exterior con el Sistema de Cuentas Nacionales (SCN), agrupando los bienes según su uso final principal.
- **Categorías:** Alimentos y bebidas, Suministros industriales, Combustibles y lubricantes, Bienes de capital (excepto equipo de transporte), Equipo de transporte y sus piezas, Bienes de consumo no especificados en otra parte.

### 3. Clasificación Industrial Internacional Uniforme (CIIU Rev. 3 / ISIC)
- **Campos:** `ciiur3`, `desciiu3` (en exportaciones); `ciiur3`, `desciiu` (en importaciones).
- **Propósito:** Asocia el producto con la rama de actividad económica de origen o producción (Agricultura, Silvicultura, Pesca, Explotación de Minas y Canteras, Industrias Manufactureras, etc.).

### 4. Clasificación según Uso o Destino Económico (CUODE)
- **Campos:** `cuode`, `descuo` (específico de importaciones).
- **Propósito:** Utilizado por analistas y bancos centrales para estudiar la composición de la demanda interna agregada (Bienes de Consumo no duradero/duradero, Materias Primas para la agricultura e industria, Bienes de Capital para la agricultura, industria y transporte).

## Relación con otros Conceptos

- Exportaciones: Cruce de bienes con CUCI, GCE y CIIU.
- Importaciones: Cruce de bienes con CUCI, GCE, CIIU y CUODE.
- [Nomenclatura NANDINA](nandina.md): Nivel arancelario base.
- Balanza Comercial: Indicador agregado resultante.
