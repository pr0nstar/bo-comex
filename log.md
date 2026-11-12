# Bundle Changelog

Este libro de contabilidad cronológico registra la trazabilidad, actualizaciones, saneamientos y linaje del paquete de conocimiento `bo-comex` conforme a OKF v0.2 §9.

## 2026-11-12
- **Incorporación de Marco Legal, Provenance y Términos de Atribución INE:**
  - Registro formal de la URL fuente original: `http://web2.ine.gob.bo:8081/IneComex/BasesComex.aspx`.
  - Creación del concepto de gobernanza `concepts/terminos_y_marco_legal.md` con los antecedentes del Decreto Ley Nº 14100 (Arts. 8r y 24), CPE (Arts. 8 y 232) y D.S. Nº 23318-A (Art. 5).
  - Documentación del compromiso de uso responsable y la cláusula formal de atribución obligatoria del INE (*“Elaboración propia con Base de Datos de Comercio Exterior del Instituto Nacional de Estadística”*).
  - Actualización de `index.md`, `datapackage.json` y `README.md` con referencias cruzadas al marco normativo y términos institucionales.

- **Ajuste y Conformidad OKF v0.2 / ODKF v0.2:**
  - Creación del contrato de datos Frictionless `datapackage.json` con tipado semántico, sumas de verificación SHA-256 e interoperabilidad ontológica (SKOS, Wikidata, QUDT).
  - Creación del manifiesto raíz `index.md` con metadatos W3C DCAT v3 (`type: dcat:Dataset`), descripción de alcance, advertencias metodológicas y ejemplos ejecutables.
  - Creación del árbol de conceptos en `concepts/` con documentos para `exportaciones`, `importaciones`, `nandina`, `balanza_comercial` y `clasificaciones_economicas`.
  - Creación del directorio analítico `queries/` con scripts SQL parametrizados para DuckDB y DataMesh.
  - Normalización de `README.md` con frontmatter YAML compatible.
  - Configuración de exclusiones en `.gitignore` para cachés de `.datamesh` y motores analíticos locales.

## 2026-11-11
- **Ingesta y Particionamiento Inicial:**
  - Descarga y compilación de microdatos aduaneros desde las bases oficiales del Instituto Nacional de Estadística (INE) y Aduana Nacional de Bolivia.
  - Conversión de series históricas anuales a particiones columnares Apache Parquet (`1992.parquet` a `2026.parquet`) optimizadas con compresión Snappy en `exportaciones/` e `importaciones/`.
