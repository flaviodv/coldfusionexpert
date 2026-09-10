<cfprocessingdirective pageencoding="utf-8">
<cfscript>
// Single source of truth for the Tools section: categories + per-tool metadata.
// Consumed by: Application.cfc (per-page <title>/canonical/robots), _sidebar.cfm, tools_en.cfm/tools_es.cfm, _tool-page.cfm.
request.toolCategories = [
  {slug: "redes-sociales-contenido", labelEn: "Social Media & Content", labelEs: "Redes Sociales y Contenido", icon: "fa-share-alt"},
  {slug: "marketing-seo-social", labelEn: "SEO & GEO", labelEs: "SEO y GEO", icon: "fa-search"},
  {slug: "diseno-frontend-css", labelEn: "Design & Frontend", labelEs: "Diseño y Frontend", icon: "fa-palette"},
  {slug: "desarrollo-datos", labelEn: "Development & Data", labelEs: "Desarrollo y Datos", icon: "fa-laptop-code"},
  {slug: "gestion-tiempo-productividad", labelEn: "Time & Productivity", labelEs: "Tiempo y Productividad", icon: "fa-stopwatch"},
  {slug: "utilidades-productividad", labelEn: "General Utilities", labelEs: "Utilidades Generales", icon: "fa-toolbox"},
  {slug: "cfml-servidores", labelEn: "CFML & Servers", labelEs: "CFML y Servidores", icon: "fa-server"}
];

request.toolsRegistry = {
  "social-media-font-generator": {category: "redes-sociales-contenido", icon: "fa-font", iconPrefix: "fas", built: true, featured: true,
    titleEn: "Social Media Font Generator", titleEs: "Generador de Fuentes para Redes Sociales",
    descEn: "Turn plain text into copy-ready Unicode styles for posts, bios, captions, and comments across social platforms.",
    descEs: "Transformá texto común en estilos Unicode listos para copiar en posts, bios, captions y comentarios de redes sociales."},

  "meta-tags-extractor": {category: "marketing-seo-social", icon: "fa-tags", iconPrefix: "fas", built: true,
    titleEn: "Meta Tags & Structured Data Extractor", titleEs: "Extractor de Meta Tags y Datos Estructurados",
    descEn: "Analyze any URL's meta tags, Open Graph signals, and Schema.org JSON-LD structured data in seconds.",
    descEs: "Analizá en segundos los meta tags, señales Open Graph y datos estructurados Schema.org (JSON-LD) de cualquier URL."},

  "whatsapp-link-generator": {category: "redes-sociales-contenido", icon: "fa-whatsapp", iconPrefix: "fab", built: true,
    titleEn: "WhatsApp Link Generator", titleEs: "Generador de Enlaces de WhatsApp",
    descEn: "Create click-to-chat WhatsApp links with ready-to-send messages for faster conversations.",
    descEs: "Creá enlaces de WhatsApp con mensajes listos para enviar y agilizar cada conversación."},

  "email-signature-generator": {category: "redes-sociales-contenido", icon: "fa-envelope", iconPrefix: "fas", built: true,
    titleEn: "Email Signature Generator", titleEs: "Generador de Firmas de Correo Electrónico",
    descEn: "Design a polished HTML email signature that keeps every professional detail consistent.",
    descEs: "Diseñá una firma HTML profesional y mantené todos tus datos de contacto consistentes."},

  "qr-code-generator": {category: "redes-sociales-contenido", icon: "fa-qrcode", iconPrefix: "fas", built: true, featured: true,
    titleEn: "QR Code Generator", titleEs: "Generador de Códigos QR",
    descEn: "Generate branded QR codes with custom colors, styles, and PNG or SVG downloads.",
    descEs: "Generá códigos QR con tu estilo, colores personalizados y descarga en PNG o SVG."},

  "newsletter-html-previewer": {category: "redes-sociales-contenido", icon: "fa-envelope-open-text", iconPrefix: "fas", built: true,
    titleEn: "Newsletter HTML Previewer", titleEs: "Previsualizador de HTML para Newsletters",
    descEn: "Preview newsletter HTML before sending and catch layout issues in your email campaign.",
    descEs: "Previsualizá el HTML de tu newsletter antes de enviarla y detectá problemas de diseño a tiempo."},

  "schema-json-ld-generator": {category: "marketing-seo-social", icon: "fa-code-branch", iconPrefix: "fas", built: true, featured: true,
    titleEn: "Schema JSON-LD Generator", titleEs: "Generador de Schema JSON-LD",
    descEn: "Create valid Schema.org structured data for organizations, articles, products, services, FAQs, and breadcrumbs.",
    descEs: "Creá datos estructurados Schema.org para organizaciones, artículos, productos, servicios, FAQs y breadcrumbs."},

  "image-editor": {category: "diseno-frontend-css", icon: "fa-image", iconPrefix: "fas", built: true, featured: true,
    titleEn: "Image Editor", titleEs: "Editor de Imágenes",
    descEn: "Edit, resize, and export images quickly in WebP, PNG, JPG, and other web-ready formats.",
    descEs: "Editá, redimensioná y exportá imágenes en WebP, PNG, JPG y otros formatos listos para la web."},

  "favicon-editor": {category: "diseno-frontend-css", icon: "fa-th", iconPrefix: "fas", built: true,
    titleEn: "Pixel Favicon Editor", titleEs: "Editor de Favicon Pixel a Pixel",
    descEn: "Design pixel-perfect favicons at 16×16, 32×32, 48×48, or 64×64 px and export as .ico or .png.",
    descEs: "Diseñá favicons pixel a pixel en 16×16, 32×32, 48×48 o 64×64 px y exportalos como .ico o .png."},

  "css-effects-generator": {category: "diseno-frontend-css", icon: "fa-magic", iconPrefix: "fas", built: true,
    titleEn: "CSS Effects Generator", titleEs: "Generador de Efectos CSS con Previsualización",
    descEn: "Build shadows, gradients, rounded corners, transitions, and animations with a live CSS preview.",
    descEs: "Creá sombras, degradados, bordes redondeados, transiciones y animaciones con vista previa en vivo."},

  "color-converter": {category: "diseno-frontend-css", icon: "fa-palette", iconPrefix: "fas", built: true,
    titleEn: "Color Picker & Converter", titleEs: "Selector y Convertidor de Colores",
    descEn: "Pick, convert, and organize colors across HEX, RGB, HSL, and practical palettes.",
    descEs: "Elegí, convertí y organizá colores en HEX, RGB, HSL y paletas prácticas."},

  "favicon-editor": {category: "diseno-frontend-css", icon: "fa-th", iconPrefix: "fas", built: true,
    titleEn: "Favicon & Icon Editor", titleEs: "Editor de Favicon e Íconos",
    descEn: "Design favicons and pixel art icons from scratch with a pixel editor, then export as PNG or ICO.",
    descEs: "Diseñá favicons e íconos pixel art desde cero con editor de píxeles y exportá como PNG o ICO."},

  "css-minifier": {category: "desarrollo-datos", icon: "fa-file-code", iconPrefix: "fas", built: true,
    titleEn: "CSS Minifier & Formatter", titleEs: "Minificador y Formateador de CSS",
    descEn: "Format readable CSS for editing or minify it for a lighter production stylesheet.",
    descEs: "Formateá CSS para editarlo cómodamente o minificalo para una hoja de estilos más liviana."},

  "json-formatter": {category: "desarrollo-datos", icon: "fa-code", iconPrefix: "fas", built: true, featured: true,
    titleEn: "JSON Minifier & Formatter", titleEs: "Minificador y Formateador de JSON",
    descEn: "Validate, format, and minify JSON so your data is easier to read and ready to use.",
    descEs: "Validá, formateá y minificá JSON para leer mejor tus datos y usarlos enseguida."},

  "base64-encoder": {category: "desarrollo-datos", icon: "fa-lock", iconPrefix: "fas", built: true,
    titleEn: "Base64 Encoder / Decoder", titleEs: "Codificador y Decodificador Base64",
    descEn: "Encode or decode text, files, and images to and from Base64 without leaving your browser.",
    descEs: "Codificá o decodificá texto, archivos e imágenes en Base64 sin salir del navegador."},

  "json-yaml-converter": {category: "desarrollo-datos", icon: "fa-exchange-alt", iconPrefix: "fas", built: true,
    titleEn: "JSON &harr; YAML Converter", titleEs: "Conversor de Formatos de Datos (JSON a YAML / YAML a JSON)",
    descEn: "Switch cleanly between JSON and YAML for configuration files, APIs, and development workflows.",
    descEs: "Convertí entre JSON y YAML para archivos de configuración, APIs y flujos de desarrollo."},

  "hash-generator": {category: "desarrollo-datos", icon: "fa-hashtag", iconPrefix: "fas", built: true,
    titleEn: "Security Hash Generator", titleEs: "Generador de Hashes de Seguridad",
    descEn: "Generate MD5, SHA-1, SHA-256, and other hashes for integrity checks and development.",
    descEs: "Generá hashes MD5, SHA-1, SHA-256 y más para controles de integridad y desarrollo."},

  "uuid-generator": {category: "desarrollo-datos", icon: "fa-fingerprint", iconPrefix: "fas", built: true,
    titleEn: "UUID / GUID Generator", titleEs: "Generador de UUID / GUID",
    descEn: "Create one or many UUIDs instantly for databases, APIs, tests, and development projects.",
    descEs: "Creá uno o varios UUIDs al instante para bases de datos, APIs, pruebas y proyectos."},

  "http-status-codes": {category: "desarrollo-datos", icon: "fa-server", iconPrefix: "fas", built: true,
    titleEn: "HTTP Status Code Reference", titleEs: "Buscador / Referencia de Códigos de Estado HTTP",
    descEn: "Find the meaning and practical use of HTTP status codes, from 200 and 301 to 404 and 500.",
    descEs: "Encontrá el significado y uso práctico de códigos HTTP, desde 200 y 301 hasta 404 y 500."},

  "text-diff-checker": {category: "desarrollo-datos", icon: "fa-not-equal", iconPrefix: "fas", built: true, featured: true,
    titleEn: "Text & Code Diff Checker", titleEs: "Comparador de Texto y Código",
    descEn: "Compare two text or code blocks line by line and see additions, removals, and unchanged content instantly.",
    descEs: "Compará dos bloques de texto o código línea por línea y detectá agregados, eliminaciones y contenido sin cambios."},

  "ip-lookup": {category: "utilidades-productividad", icon: "fa-network-wired", iconPrefix: "fas", built: true, featured: true,
    titleEn: "IP Address Lookup & Diagnostics", titleEs: "Consulta y Diagnóstico de Dirección IP",
    descEn: "Inspect public IPs, domains, DNS, approximate location, network data, and browser diagnostics.",
    descEs: "Consultá IPs y dominios, DNS, ubicación aproximada, datos de red y diagnósticos del navegador."},

  "timezone-converter": {category: "utilidades-productividad", icon: "fa-clock", iconPrefix: "fas", built: true,
    titleEn: "Time Zone Converter", titleEs: "Conversor de Zonas Horarias",
    descEn: "Compare dates and times across world time zones with an interactive map and daylight-saving awareness.",
    descEs: "Compará fechas y horarios entre zonas del mundo con mapa interactivo y horario de verano."},

  "currency-converter": {category: "utilidades-productividad", icon: "fa-coins", iconPrefix: "fas", built: true,
    titleEn: "Currency Converter", titleEs: "Conversor de Monedas",
    descEn: "Convert amounts between major currencies using the latest available reference exchange rate.",
    descEs: "Convertí importes entre las principales monedas con la última tasa de referencia disponible."},

  "password-generator": {category: "utilidades-productividad", icon: "fa-key", iconPrefix: "fas", built: true,
    titleEn: "Secure Password Generator", titleEs: "Generador de Contraseñas Seguras",
    descEn: "Create strong, unique passwords with the length and character types you choose.",
    descEs: "Creá contraseñas fuertes y únicas con la longitud y los tipos de caracteres que elijas."},

  "word-counter": {category: "utilidades-productividad", icon: "fa-font", iconPrefix: "fas", built: true,
    titleEn: "Word & Character Counter", titleEs: "Contador de Palabras y Caracteres",
    descEn: "Measure words, characters, paragraphs, and estimated reading time as you write.",
    descEs: "Medí palabras, caracteres, párrafos y tiempo estimado de lectura mientras escribís."},

  "text-case-converter": {category: "utilidades-productividad", icon: "fa-text-height", iconPrefix: "fas", built: true,
    titleEn: "Text Case Converter", titleEs: "Conversor de Formato de Texto",
    descEn: "Transform text into uppercase, title case, camelCase, snake_case, kebab-case, and more.",
    descEs: "Transformá texto a mayúsculas, título, camelCase, snake_case, kebab-case y más."},

  "percentage-calculator": {category: "utilidades-productividad", icon: "fa-percentage", iconPrefix: "fas", built: true,
    titleEn: "Percentage Calculator", titleEs: "Calculadora de Porcentajes",
    descEn: "Calculate percentages, discounts, markups, and changes between two values in seconds.",
    descEs: "Calculá porcentajes, descuentos, aumentos y variaciones entre dos valores en segundos."},

  "date-difference-calculator": {category: "utilidades-productividad", icon: "fa-calendar-alt", iconPrefix: "fas", built: true,
    titleEn: "Date Difference Calculator", titleEs: "Calculadora de Diferencia Entre Fechas",
    descEn: "See the exact years, months, days, and total days between any two dates.",
    descEs: "Conocé los años, meses, días y días totales exactos entre dos fechas."},

  "csv-table-generator": {category: "utilidades-productividad", icon: "fa-table", iconPrefix: "fas", built: true, featured: true,
    titleEn: "CSV to Markdown / HTML Table", titleEs: "Generador de Tablas desde CSV",
    descEn: "Turn CSV data into clean Markdown or HTML tables with automatic separator detection and safe escaping.",
    descEs: "Convertí datos CSV en tablas Markdown o HTML limpias con detección automática del separador y escape seguro."},

  "todo-list": {category: "gestion-tiempo-productividad", icon: "fa-tasks", iconPrefix: "fas", built: true,
    titleEn: "Simple To-Do List", titleEs: "Gestor de Lista de Tareas",
    descEn: "Organize everyday tasks in a simple list that stays saved locally in your browser.",
    descEs: "Organizá tus tareas diarias en una lista simple que queda guardada localmente en tu navegador."},

  "time-tracker": {category: "gestion-tiempo-productividad", icon: "fa-stopwatch", iconPrefix: "fas", built: true, featured: true,
    titleEn: "Time Tracker & Rate Calculator", titleEs: "Controlador de Tiempo y Tarifas (Time Tracker)",
    descEn: "Track time by task, apply an hourly rate, and see earnings update in real time.",
    descEs: "Registrá tiempo por tarea, aplicá una tarifa por hora y mirá tus ganancias en tiempo real."},

  "page-auto-refresh": {category: "gestion-tiempo-productividad", icon: "fa-sync-alt", iconPrefix: "fas", built: true,
    titleEn: "Page Auto Refresh", titleEs: "Actualizador Automático de Página",
    descEn: "Load an allowed page in a preview and refresh it automatically at the interval you choose.",
    descEs: "Cargá una página compatible en una vista previa y actualizala automáticamente al intervalo que elijas."},

  "site-monitor": {category: "marketing-seo-social", icon: "fa-binoculars", iconPrefix: "fas", built: true,
    titleEn: "Site Monitor", titleEs: "Monitor de Sitios",
    descEn: "Keep a site open and automatically refreshed at the interval you choose to watch for changes.",
    descEs: "Mantené un sitio abierto y actualizalo automáticamente al intervalo que elijas para vigilar cambios."},

  "cfml-code-doctor": {category: "cfml-servidores", icon: "fa-stethoscope", iconPrefix: "fas", built: true, featured: true,
    titleEn: "CFML Code Doctor", titleEs: "Doctor de Código CFML",
    descEn: "Scan CFML and SQL for common security, performance, and scoping issues with practical fixes.",
    descEs: "Analizá CFML y SQL para detectar problemas comunes de seguridad, rendimiento y scopes con correcciones prácticas."}
  ,"cfml-tag-script-converter": {category: "cfml-servidores", icon: "fa-exchange-alt", iconPrefix: "fas", built: true, featured: true,
    titleEn: "CFML Tag / Script Converter", titleEs: "Conversor CFML Tag / Script",
    descEn: "Convert common CFML tag syntax to CFScript and CFScript blocks back to readable CFML tags.",
    descEs: "Convertí sintaxis CFML con tags a CFScript y bloques de CFScript a tags CFML legibles."}
  ,"sql-json-cfml-converter": {category: "cfml-servidores", icon: "fa-database", iconPrefix: "fas", built: true, featured: true,
    titleEn: "SQL / JSON / CFML Converter", titleEs: "Conversor SQL / JSON / CFML",
    descEn: "Convert SQL or JSON data into practical JSON, CFScript structs, and CFML query mock data.",
    descEs: "Convertí SQL o JSON a JSON práctico, structs CFScript y datos mock para queries CFML."}
  ,"cfml-orm-entity-generator": {category: "cfml-servidores", icon: "fa-cubes", iconPrefix: "fas", built: true, featured: true,
    titleEn: "CFML ORM Entity Generator", titleEs: "Generador de Entidades ORM CFML",
    descEn: "Generate a Lucee or Adobe ColdFusion ORM entity CFC from a table definition and optional relationships.",
    descEs: "Generá una entidad ORM CFC para Lucee o Adobe ColdFusion desde una tabla y relaciones opcionales."}
  ,"commandbox-server-json-generator": {category: "cfml-servidores", icon: "fa-terminal", iconPrefix: "fas", built: true, featured: true,
    titleEn: "CommandBox server.json Generator", titleEs: "Generador de server.json para CommandBox",
    descEn: "Build a practical CommandBox server.json with CFML engine, port, SSL, JVM memory, datasources, and extensions.",
    descEs: "Creá un server.json práctico para CommandBox con motor CFML, puerto, SSL, memoria JVM, datasources y extensiones."}
  ,"jvm-heap-estimator": {category: "cfml-servidores", icon: "fa-memory", iconPrefix: "fas", built: true, featured: true,
    titleEn: "JVM Heap Memory Estimator", titleEs: "Estimador de Heap Memory JVM",
    descEn: "Estimate Xms, Xmx, Metaspace, OS reserve, and per-instance memory for Lucee or Adobe ColdFusion servers.",
    descEs: "Estimá Xms, Xmx, Metaspace, reserva del sistema y memoria por instancia para servidores Lucee o Adobe ColdFusion."}
  ,"cfml-hosting-migration-calculator": {category: "cfml-servidores", icon: "fa-cloud-upload-alt", iconPrefix: "fas", built: true, featured: true,
    titleEn: "CFML Hosting & Migration Calculator", titleEs: "Calculadora de Hosting y Migración CFML",
    descEn: "Estimate infrastructure resources, hosting type, monthly cost, and a practical CFML migration checklist.",
    descEs: "Estimá recursos, tipo de hosting, costo mensual y checklist práctico para migrar proyectos CFML."}
  ,"application-cfc-generator": {category: "cfml-servidores", icon: "fa-cogs", iconPrefix: "fas", built: true, featured: true,
    titleEn: "Application.cfc Generator", titleEs: "Generador de Application.cfc",
    descEn: "Build a clean Application.cfc starter file for Lucee or Adobe ColdFusion with sessions, ORM, datasources, and mappings.",
    descEs: "Creá una base limpia de Application.cfc para Lucee o Adobe ColdFusion con sesiones, ORM, datasources y mappings."}
  ,"ai-usage-planner": {category: "gestion-tiempo-productividad", icon: "fa-chart-line", iconPrefix: "fas", built: true, featured: true,
    titleEn: "AI Usage Planner", titleEs: "Planificador de Uso de IA",
    descEn: "Plan usage across unlimited AI tools, track multiple limits, and see a safe pace for every reset window.",
    descEs: "Planificá el uso de múltiples IAs, seguí varios límites y conocé un ritmo seguro para cada ventana de reinicio."}
};

// Explicit display order (struct key order isn't guaranteed) - sidebar/landing loop over this, grouped by category.
request.toolOrder = [
  "social-media-font-generator", "whatsapp-link-generator", "email-signature-generator", "qr-code-generator", "newsletter-html-previewer",
  "meta-tags-extractor", "schema-json-ld-generator", "site-monitor",
  "image-editor", "favicon-editor", "css-effects-generator", "color-converter",
  "css-minifier", "json-formatter", "base64-encoder", "json-yaml-converter", "hash-generator", "uuid-generator", "http-status-codes", "text-diff-checker",
  "todo-list", "time-tracker", "page-auto-refresh", "ai-usage-planner",
  "ip-lookup", "timezone-converter", "currency-converter", "password-generator", "word-counter", "text-case-converter", "percentage-calculator", "date-difference-calculator", "csv-table-generator",
  "cfml-code-doctor", "cfml-tag-script-converter", "sql-json-cfml-converter", "cfml-orm-entity-generator", "commandbox-server-json-generator", "jvm-heap-estimator", "cfml-hosting-migration-calculator", "application-cfc-generator"
];
</cfscript>
