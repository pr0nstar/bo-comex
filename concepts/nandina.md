---
type: reference
title: Nomenclatura Arancelaria Común (NANDINA)
description: Estructura, metodología y jerarquía de 10 dígitos del clasificador arancelario utilizado en la Comunidad Andina y Bolivia.
license: CC-BY-4.0
tags:
  - nandina
  - arancel
  - clasificacion
  - can
  - aduana
  - comercio-exterior
generated:
  by: "process:okf-cli"
  at: "2026-11-12T00:00:00Z"
status: active
---

# Nomenclatura Arancelaria Común de la Comunidad Andina (NANDINA)

## Description & Domain Context

La **NANDINA** es la nomenclatura arancelaria común adoptada por los Países Miembros de la Comunidad Andina (Bolivia, Colombia, Ecuador y Perú), sustentada jurídicamente en las Decisiones de la Comisión de la CAN. Está basada íntegramente en la versión del **Sistema Armonizado de Designación y Codificación de Mercancías (SA)** elaborado por la Organización Mundial de Aduanas (OMA).

En Bolivia, el Ministerio de Economía y Finanzas Públicas y la Aduana Nacional promulgan anualmente el *Arancel Aduanero de Importaciones del Estado Plurinacional de Bolivia*, el cual implementa las subpartidas nacionales a diez (10) dígitos.

## Jerarquía de Codificación

La estructura numérica de cada código de 10 dígitos se descompone jerárquicamente de la siguiente forma:

| Posición de Dígitos | Nivel Jerárquico | Origen Normativo | Ejemplo (`1212991000`: Caña de azúcar) |
| :--- | :--- | :--- | :--- |
| **Dígitos 1-2** | Capítulo | Sistema Armonizado (Internacional) | `12`: Semillas y frutos oleaginosos... |
| **Dígitos 1-4** | Partida Arancelaria | Sistema Armonizado (Internacional) | `1212`: Algarrobas, algas, remolacha azucarera y caña de azúcar... |
| **Dígitos 1-6** | Subpartida del SA | Sistema Armonizado (Internacional) | `121299`: Las demás |
| **Dígitos 1-8** | Subpartida NANDINA | Comunidad Andina (Regional CAN) | `12129910`: Caña de azúcar |
| **Dígitos 1-10** | Apertura Nacional | Bolivia (Aduana Nacional / MEFP) | `1212991000`: Subpartida nacional específica |

Adicionalmente, los 97 capítulos del arancel se agrupan en **21 Secciones** (`secc`, `dessec`), las cuales abarcan desde animales vivos y productos agrícolas hasta material de transporte, óptica, armas y obras de arte.

## Rol en el Ecosistema OKF de bo-comex

La NANDINA actúa como el **eje vertebrador de enlace semántico** entre los conjuntos de exportaciones e importaciones. Permite realizar consultas de correspondencia exacta de productos, evaluar dependencias de insumos importados versus materias primas exportadas y analizar cadenas de valor.

## Relación con otros Conceptos

- Exportaciones: Clasificación a nivel de 10 dígitos de bienes exportados.
- Importaciones: Clasificación y cálculo arancelario de bienes importados.
- Clasificaciones Económicas: Equivalencias hacia CUCI, GCE y CIIU.
