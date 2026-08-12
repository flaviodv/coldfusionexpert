# Checklist de herramientas pendientes

Hoja de ruta para ampliar la sección de herramientas, ordenada por utilidad, potencial SEO y esfuerzo de implementación.

## Estado actual

- [x] **Doctor de Código CFML** — primera herramienta de la categoría **CFML y Servidores**. Revisión heurística básica; mejorar más adelante.

## Prioridad alta — publicar primero

- [x] **Generador de Schema JSON-LD**
  - [ ] Organización, persona, artículo, producto, servicio, FAQ y breadcrumbs.
  - [ ] Validación de campos obligatorios y vista previa.
  - [ ] Botón para copiar el JSON-LD y FAQ indexable.

- [x] **Diff Checker de Código y Texto**
  - [ ] Comparación línea por línea.
  - [ ] Resaltado de agregados, eliminados y modificados.
  - [ ] Opciones para ignorar espacios y mayúsculas.
  - [ ] Procesamiento local, sin subir el contenido.

- [x] **Generador de Tablas desde CSV**
  - [ ] Pegado de CSV con detección de separador.
  - [ ] Salida Markdown y HTML.
  - [ ] Encabezados, alineación, escape de caracteres e importación de `.csv`.

- [x] **Generador de `Application.cfc`**
  - [ ] Lucee y Adobe ColdFusion.
  - [ ] Sesión, ORM, datasource, mappings y timeouts.
  - [ ] Comentarios explicativos y descarga como `.cfc`.

## Prioridad media — núcleo CFML

- [x] **Conversor CFML Tag ↔ Script**
  - [ ] Soporte para `cfset`, `cfif`, `cfloop`, `cfquery`, `cfoutput` y `cfinclude`.
  - [ ] Preservar indentación y comentarios.
  - [ ] Advertencias cuando la conversión no sea segura.

- [x] **Analizador avanzado de CFML y SQL**
  - [x] Línea, columna y fragmento exacto del problema.
  - [x] Reglas para `cfqueryparam`, scopes, SQL dentro de loops y `SELECT *`.
  - [x] Severidad y sugerencias de código corregido.

- [x] **Conversor SQL ↔ JSON / Struct / Query CFML**
  - [ ] Generar `queryNew()`, arrays de structs y JSON.
  - [ ] Inferir tipos básicos y crear datos mock.
  - [ ] Transformación exclusivamente local, sin ejecutar consultas.

- [x] **Generador de Entidades ORM CFML**
  - [ ] Entrada SQL o JSON de estructura de tabla.
  - [ ] Propiedades, tipos, claves, relaciones y restricciones.
  - [ ] Opciones para Lucee ORM y Adobe ColdFusion ORM.

- [x] **Generador de `server.json` para CommandBox**
  - [ ] Motor CFML, versión, puerto, host y mappings.
  - [ ] Datasources, variables de entorno, SSL y deploy.
  - [ ] Validación del JSON generado.

## Prioridad media — servidores y servicios

- [x] **Estimador de Heap Memory JVM**
  - [ ] RAM, cantidad de instancias, tráfico y carga estimada.
  - [ ] Recomendación inicial de `-Xms`, `-Xmx` y Metaspace.
  - [ ] Advertencia visible de que es una estimación.

- [x] **Calculadora de Hosting y Migración CFML**
  - [ ] Tráfico, almacenamiento, base de datos y cantidad de sitios.
  - [ ] Comparación VPS, dedicado y nube.
  - [ ] Recursos, complejidad, resumen descargable y CTA de consultoría.

## Requisitos para marcar cada herramienta como terminada

- [ ] Versión en español e inglés.
- [ ] Registro en `tools/_tools-registry.cfm`.
- [ ] Widget funcional en `tools/widgets/`.
- [ ] Guía y FAQ en `tools/docs/`.
- [ ] Título, descripción, canonical y datos estructurados.
- [ ] URLs de ambos idiomas en `sitemap.xml`.
- [ ] Prueba responsive y revisión de errores ColdFusion.
- [ ] Mensaje de privacidad cuando el procesamiento sea local.

## Orden recomendado

1. Schema JSON-LD.
2. Diff Checker.
3. CSV a Markdown/HTML.
4. Generador `Application.cfc`.
5. SQL a estructuras CFML.
6. CFML Tag ↔ Script.
7. ORM y `server.json`.
8. Estimadores de JVM y hosting.
