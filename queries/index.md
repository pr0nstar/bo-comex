---
type: index
title: Consultas Analíticas de Comercio Exterior
description: Directorio de consultas analíticas SQL preconstruidas para DuckDB y DataMesh.
status: active
generated:
  by: "process:okf-cli"
  at: "2026-11-12T00:00:00Z"
---

# Consultas Analíticas SQL de bo-comex

Este directorio almacena scripts SQL de referencia, probados con **DuckDB** y ejecutables tanto en scripts de Python como a través de la interfaz de **DataMesh CLI**:

1. **[Balanza Comercial Histórica](balanza_comercial_historica.sql):** Cómputo anual agregado (1992-2026) del saldo comercial de Bolivia ($FOB_{exp} - CIF_{imp}$).
2. **[Top 10 Exportaciones Recientes](top_10_exportaciones_recientes.sql):** Ranking de principales partidas NANDINA exportadas en la última gestión anual completa.
3. **[Socios Comerciales Históricos](socios_comerciales_historicos.sql):** Principales países de destino de exportaciones y origen de importaciones acumulados.
4. **[Importaciones por Medio de Transporte](importaciones_por_medio_transporte.sql):** Distribución de valor y volumen físico de importaciones según modo logístico (carretera, aéreo, ductos, férreo, fluvial).
