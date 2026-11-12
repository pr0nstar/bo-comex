-- Importaciones por Medio de Transporte Internacional (Gestión 2024)
-- Logística de internación de mercancías
SELECT 
    desmed AS medio_transporte,
    COUNT(*) AS total_despachos_aduaneros,
    ROUND(SUM(valor_cif_sus) / 1e6, 2) AS valor_cif_millones_usd,
    ROUND(SUM(peso_bruto_kg) / 1e6, 2) AS peso_bruto_miles_toneladas,
    ROUND(SUM(gravamen_aduanero_bs) / 1e6, 2) AS recaudacion_ga_millones_bs
FROM 'importaciones/2024.parquet'
GROUP BY desmed
ORDER BY valor_cif_millones_usd DESC;
