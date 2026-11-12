-- Balanza Comercial Anual Histórica de Bolivia (1992-2026)
-- Cálculo agregado de Exportaciones FOB vs. Importaciones CIF
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
