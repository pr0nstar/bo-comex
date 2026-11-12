-- Principales Socios Comerciales de Bolivia (2020 - 2025)
-- Destino de Exportaciones vs. Origen de Importaciones
WITH top_destinos AS (
    SELECT 
        despais AS pais,
        ROUND(SUM(valor) / 1e6, 2) AS exp_millones_usd
    FROM 'exportaciones/*.parquet'
    WHERE gestion >= 2020 AND gestion <= 2025
    GROUP BY despais
),
top_origenes AS (
    SELECT 
        despai AS pais,
        ROUND(SUM(valor_cif_sus) / 1e6, 2) AS imp_cif_millones_usd
    FROM 'importaciones/*.parquet'
    WHERE gestion >= 2020 AND gestion <= 2025
    GROUP BY despai
)
SELECT 
    COALESCE(d.pais, o.pais) AS socio_comercial,
    COALESCE(d.exp_millones_usd, 0) AS exportaciones_fob_millones,
    COALESCE(o.imp_cif_millones_usd, 0) AS importaciones_cif_millones,
    ROUND(COALESCE(d.exp_millones_usd, 0) - COALESCE(o.imp_cif_millones_usd, 0), 2) AS saldo_bilateral_millones
FROM top_destinos d
FULL OUTER JOIN top_origenes o ON d.pais = o.pais
ORDER BY (COALESCE(d.exp_millones_usd, 0) + COALESCE(o.imp_cif_millones_usd, 0)) DESC
LIMIT 15;
