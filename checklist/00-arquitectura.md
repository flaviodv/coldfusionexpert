# 🏛️ Arquitectura y Estructura General del Sitio Web

> Base común para toda la sección de Herramientas. Conviene resolver esto antes (o en paralelo coordinado) porque el resto de los checklists de categoría (`01`–`04`) dependen de estas decisiones: layout de página, navegación y convención de URLs.

- [x] **Integración en la Web Personal (CV / Portfolio)**:
  - [x] Crear la sección principal de "Herramientas" en la web. → `tools.cfm` + `tools_en.cfm` / `tools_es.cfm`.
  - [x] Diseñar el menú de navegación para incluir el acceso a la sección de herramientas. → ítem "Herramientas"/"Tools" en `header_en.cfm` / `header_es.cfm`, + menú lateral izquierdo siempre presente (`tools/_sidebar.cfm`) dentro de la sección.
  - [x] Crear una página de aterrizaje (Landing) que presente todas las categorías y herramientas disponibles. → landing con cards agrupadas por categoría.
- [x] **Estructura de Páginas Individuales (Página por Herramienta)**:
  - [x] Cada herramienta debe contar con su propia URL/Página independiente para optimización SEO. → 23 páginas en `tools/*.cfm`, `<title>`/canonical únicos por página vía `Application.cfc` + `tools/_tools-registry.cfm` (marcadas `noindex` hasta que tengan contenido real).
  - [x] **Layout de Página** (esqueleto listo, falta la lógica funcional de cada herramienta):
    - [x] **Parte Superior**: placeholder de widget en `tools/_tool-page.cfm` (a reemplazar por la interfaz real de cada herramienta).
    - [x] **Parte Inferior**: párrafo de descripción/SEO base (a expandir con contenido real por herramienta).
- [x] **Categorización**:
  - [x] Organizar las herramientas en categorías claras y profesionales. → 4 categorías definidas en `tools/_tools-registry.cfm`.
- [ ] **Privacidad y Rendimiento**:
  - [ ] Procesar la lógica preferentemente en el cliente (Browser-side / JS) cuando sea posible (ej. conversiones, minificadores, formateadores, manipulación de imágenes).

## Convenciones para los demás checklists

Estas reglas aplican a todas las herramientas listadas en `01`–`04`, sea cual sea el agente que las implemente:

- Página propia por herramienta (no todo en una SPA), para SEO.
- Layout: widget arriba, contenido de ayuda/SEO abajo.
- Preferir procesamiento 100% client-side (JS) sobre llamadas al servidor, salvo que la herramienta lo requiera explícitamente (ej. datos en tiempo real como cotizaciones de moneda).
- Reutilizar el header/footer del sitio (`header_en.cfm` / `header_es.cfm` / `footer_en.cfm` / `footer_es.cfm`, incluidos automáticamente vía `Application.cfc`).
