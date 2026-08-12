# 🌐 Migración de idioma: `?lan=` → subdirectorio (`/es/...`)

> **Implementado y verificado en `coldfusionexpert.localhost` (2026-08-08).** Motivo original: Google Search Console reporta como "Página alternativa con etiqueta canónica adecuada" casi todas las URLs limpias del sitio (`/`, `/tools`, `/tools/{slug}`), porque su propio `<link rel="canonical">` apunta a la variante `?lan=en`/`?lan=es` en vez de a sí mismas. La causa raíz: **`tools/_sidebar.cfm`, `tools/_tool-page.cfm`, `index_en.cfm`/`index_es.cfm` y `tools_en.cfm` enlazan internamente con URLs limpias sin `?lan=`**, mientras que `Application.cfc` y `sitemap.xml` declaran como canonical la versión con `?lan=`. Un parámetro de query es "opcional" para Google (se puede perder en shares/backlinks); una ruta (`/es/...`) es una URL estable en sí misma y es el patrón recomendado por Google para variantes de idioma. Con el sitio todavía en autoridad casi nula (39 consultas / 3 meses a agosto 2026) es el momento más barato para hacer este cambio.

**Decisión de esquema**: inglés sin prefijo (default, como hoy: `/`, `/tools`, `/tools/{slug}`), español con prefijo `/es/` (`/es/`, `/es/tools`, `/es/tools/{slug}`). `x-default` hreflang apunta a la versión sin prefijo (inglés), igual que ahora.

## 1. `web.config` — rutas y redirects

- [x] Agregar reglas de rewrite (antes de las reglas de redirect `.cfm`, incluir `<conditions>` con `IsFile`/`IsDirectory` negados igual que la regla existente para `/tools/{slug}`) que enruten internamente:
  - `^es/?$` → `index.cfm?lan=es`
  - `^es/tools/?$` → `tools.cfm?lan=es`
  - `^es/tools/([a-z0-9-]+)/?$` → `tools/{R:1}.cfm?lan=es`
- [x] Agregar reglas de **redirect 301** (deben evaluarse antes que las de rewrite de arriba) que capturen el patrón viejo y lo lleven a la URL nueva sin query string, para no perder lo que Google ya indexó:
  - request con `?lan=es` en `/`, `/tools`, `/tools/{slug}` → 301 a `/es/`, `/es/tools`, `/es/tools/{slug}` (usar `<conditions><add input="{QUERY_STRING}" pattern="(^|&)lan=es(&|$)" />`)
  - request con `?lan=en` en cualquiera de esos → 301 a la misma ruta sin el parámetro (limpieza, ya no hace falta)
- [x] Probar en un tool de bajo tráfico primero (ej. `page-auto-refresh`) antes de confiar en el patrón para los 23 archivos.

## 2. `Application.cfc`

- [x] `onRequestStart`: el rewrite interno de arriba ya inyecta `url.lan=es` para las rutas `/es/...`, así que la detección de idioma (línea 17-20 actual, `param session.lan default="en"` + `if(isDefined(url.lan))`) **no debería necesitar cambios de fondo** — solo verificar que sigue funcionando con el rewrite nuevo en vez del query string público.
- [x] Agregar una variable de request para el prefijo, calculada una sola vez: `request.langPrefix = (session.lan eq "es") ? "/es" : ""`. La van a consumir todos los templates del punto 3.
- [x] Reescribir la construcción de `request.pageCanonical` / `pageAlternateEs` / `pageAlternateEn` / `pageOgUrl` (líneas ~79-90 y ~130-132) para que usen la ruta limpia con el prefijo, **sin** `?lan=`:
  - EN: `https://coldfusionexpert.ar/tools/` & slug
  - ES: `https://coldfusionexpert.ar/es/tools/` & slug
  - Mismo criterio para home (`/` y `/es/`) y para `/tools` (`/tools` y `/es/tools`).
- [x] Revisar el JSON-LD (`pageSchemaJson`, breadcrumb `itemListElement`, líneas ~117-119): hoy arma `item` con `"https://coldfusionexpert.ar/tools?lan=" & session.lan` — pasa a `https://coldfusionexpert.ar" & request.langPrefix & "/tools"`.

## 3. Templates con links internos hardcodeados

Reemplazar cada href por la versión con `#request.langPrefix#` delante (recordar el convenio de prefijos únicos por partial, `local.sb*`, `local.ft*`, etc. — no crear colisiones nuevas):

- [x] `header_en.cfm` / `header_es.cfm`: línea 59, el toggle de idioma hoy es `<a href="?lan=es">` (relativo, agrega el query a la URL actual). Reemplazar por un link absoluto calculado en `Application.cfc` (ej. `request.langSwitchUrl`) que arme la ruta equivalente en el otro idioma agregando/quitando `/es`. Revisar también los links de nav (`/`, `/#top`, etc. líneas ~656-668, ~685-695) para anteponer el prefijo cuando corresponda.
- [x] `footer_en.cfm` / `footer_es.cfm`: mismo toggle de idioma si existe ahí también (verificar, apareció en el grep inicial).
- [x] `tools/_sidebar.cfm`: línea 21 (`/tools`) y línea 35 (`/tools/#local.sbSlug#`) → anteponer `#request.langPrefix#`.
- [x] `tools/_tool-page.cfm`: línea 20-21 (breadcrumb, hoy usa `?lan=#session.lan#`) y línea 51 ("Volver a Herramientas") → anteponer `#request.langPrefix#`, sacar el `?lan=`.
- [x] `index_en.cfm` (línea 608) / `index_es.cfm` (línea 605): el link "View all"/"Ver todas" hoy es `/tools?lan=en` / `/tools?lan=es` → pasa a `/tools` / `/es/tools`.
- [x] `index_en.cfm` / `index_es.cfm`: cards de tools destacadas (`href="/tools/#local.ftCard.slug#"`) → anteponer prefijo.
- [x] `tools_en.cfm` / `tools_es.cfm`: cards de la landing (`href="/tools/#local.slug#"`) → anteponer prefijo.

## 4. `sitemap.xml`

- [x] Regenerar a mano (es estático, no se genera en request-time — ver gotcha en `CLAUDE.md`) reemplazando cada `<loc>` y cada `xhtml:link hreflang` por la forma limpia con prefijo, sin `?lan=`.
- [x] Evaluar si conviene aprovechar esta migración para pasar a un sitemap generado dinámicamente (requiere que IIS rutee `.xml` al motor CFML, hoy no está configurado — ver nota en `CLAUDE.md`), así no vuelve a desincronizarse la próxima vez que se agregue una herramienta.

## 5. Rollout y verificación

- [x] Deploy fuera de horas pico; probar a mano `/es/`, `/es/tools`, `/es/tools/meta-tags-extractor` y confirmar que sirven contenido en español con status 200.
- [x] Confirmar que las URLs viejas con `?lan=` devuelven 301 (no 200) hacia la nueva ruta.
- [ ] **Pendiente (acción manual de Flavio):** enviar el `sitemap.xml` actualizado en Search Console y usar "Inspección de URLs" para pedir reindexado de `/`, `/tools`, `/es/`, `/es/tools` y 2-3 tools con impresiones (`meta-tags-extractor`, `ip-lookup`, `date-difference-calculator`).
- [ ] **Pendiente:** a las 2-3 semanas, revisar de nuevo "Indexación de páginas" → debería desaparecer el bulto de "Página alternativa con etiqueta canónica adecuada", reemplazado por indexación limpia de `/tools/...` y `/es/tools/...`.
- [x] Riesgo esperado: caída temporal de impresiones/posiciones mientras Google re-rastrea (normal en cualquier cambio de estructura de URLs). Con el volumen actual del sitio el impacto real es mínimo.

## Bugs encontrados y corregidos durante la implementación (2026-08-08)

- **`web.config` con XML inválido**: los patrones de regex `pattern="(^|&)lan=es(&|$)"` tienen un `&` suelto dentro de un atributo XML — hay que escaparlo como `&amp;`. Un `&` sin escapar ahí tira **todo el sitio** con un 500.19 ("El archivo de configuración no es un código XML correcto"), no solo las rutas nuevas. Se detectó recién al verificar contra `coldfusionexpert.localhost` (IIS local) — el fetch al dominio público `coldfusionexpert.ar` no lo mostraba porque ese dominio no apunta a esta misma carpeta/config.
- **Redirects 301 con `appendQueryString` por defecto en `true`**: las reglas de redirect de `?lan=es` → `/es/...` arrastraban el `?lan=es` original al final de la URL nueva (`/es/tools/x?lan=es`), que después el rewrite de `/es/...` volvía a concatenar, generando `?lan=es&lan=es` y rompiendo el `eq "es"` en CFML. Hay que poner `appendQueryString="false"` explícito en esas 6 reglas de redirect.
- **`session.lan` con memoria pegajosa (sticky) entre requests**: con el esquema viejo (`?lan=` opcional) tenía sentido que el idioma "quedara pegado" a la sesión. Con rutas limpias, una URL sin prefijo *tiene* que ser inglés siempre, sin importar qué idioma se navegó antes en esa sesión — si no, Google (o cualquier visitante) puede ver contenido en español en una URL sin `/es/`, con el canonical apuntando a otro lado. Se cambió `Application.cfc` para que el idioma sea 100% derivado de la URL en cada request de página (`session.lan = isDefined(url.lan) ? url.lan : "en"`), dejando el comportamiento viejo (sticky) solo para las llamadas a `tools-api.cfm`/`tools-proxy.cfm`/`*.cfc`, que no deben perder idioma a mitad de una página ya renderizada.
- **Verificar siempre contra `coldfusionexpert.localhost` (IIS local), no solo contra el dominio público** — fueron necesarias varias rondas de fetch al dominio público que devolvían contenido viejo sin explicar por qué, hasta confirmar con el navegador contra el host local que el sitio público no sirve desde esta misma carpeta/config (o hay otra capa de caché de por medio). El local es el que refleja los cambios de archivo al instante.
