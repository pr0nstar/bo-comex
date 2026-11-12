-- Top 10 Productos de Exportación (Gestión 2025)
-- Clasificación NANDINA a 10 dígitos y sector analítico
SELECT 
    nandina,
    desnan,
    cltnt AS sector_analitico,
    ROUND(SUM(valor) / 1e6, 2) AS total_fob_millones_usd,
    ROUND(SUM(peso_neto_kg) / 1e3, 2) AS volumen_toneladas
FROM 'exportaciones/2025.parquet'
GROUP BY nandina, desnan, cltnt
ORDER BY total_fob_millones_usd DESC
LIMIT 10;
