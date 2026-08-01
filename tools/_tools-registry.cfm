<cfscript>
// Single source of truth for the Tools section: categories + per-tool metadata.
// Consumed by: Application.cfc (per-page <title>/canonical/robots), _sidebar.cfm, tools_en.cfm/tools_es.cfm, _tool-page.cfm.
request.toolCategories = [
  {slug: "marketing-seo-social", labelEn: "Marketing, SEO & Social", labelEs: "Marketing, SEO y Social", icon: "fa-bullhorn"},
  {slug: "diseno-frontend-css", labelEn: "Design & Frontend CSS", labelEs: "Diseño y Frontend CSS", icon: "fa-palette"},
  {slug: "desarrollo-datos", labelEn: "Development, Programming & Data", labelEs: "Desarrollo, Programación y Datos", icon: "fa-laptop-code"},
  {slug: "utilidades-productividad", labelEn: "General Utilities & Productivity", labelEs: "Utilidades Generales y Productividad", icon: "fa-toolbox"}
];

request.toolsRegistry = {
  "meta-tags-extractor": {category: "marketing-seo-social", icon: "fa-tags", iconPrefix: "fas", built: true,
    titleEn: "Meta Tags & Keyword Extractor", titleEs: "Extractor de Meta Tags y Keywords",
    descEn: "Extract title, description, meta tags, and keywords from any URL.",
    descEs: "Extraer título, descripción, meta tags y palabras clave introduciendo una URL."},

  "whatsapp-link-generator": {category: "marketing-seo-social", icon: "fa-whatsapp", iconPrefix: "fab", built: true,
    titleEn: "WhatsApp Link Generator", titleEs: "Generador de Enlaces de WhatsApp",
    descEn: "Create direct WhatsApp links with pre-filled messages for instant contact.",
    descEs: "Crear links directos con mensajes predefinidos para contacto instantáneo."},

  "email-signature-generator": {category: "marketing-seo-social", icon: "fa-envelope", iconPrefix: "fas", built: true,
    titleEn: "Email Signature Generator", titleEs: "Generador de Firmas de Correo Electrónico",
    descEn: "Customizable HTML templates for professional e-mail signatures.",
    descEs: "Plantillas HTML personalizables para firmas de e-mail profesionales."},

  "qr-code-generator": {category: "marketing-seo-social", icon: "fa-qrcode", iconPrefix: "fas", built: true, featured: true,
    titleEn: "QR Code Generator", titleEs: "Generador de Códigos QR",
    descEn: "Create custom QR codes (colors, styles, PNG/SVG download).",
    descEs: "Creación de QR personalizados (colores, estilos, descarga en PNG/SVG)."},

  "image-editor": {category: "diseno-frontend-css", icon: "fa-image", iconPrefix: "fas", built: true, featured: true,
    titleEn: "Interactive Image Editor", titleEs: "Editor de Imágenes Interactivo",
    descEn: "Quick editing and export/conversion across multiple formats (WebP, PNG, JPG, etc.).",
    descEs: "Edición rápida y exportación/conversión en múltiples formatos (WebP, PNG, JPG, etc.)."},

  "css-effects-generator": {category: "diseno-frontend-css", icon: "fa-magic", iconPrefix: "fas", built: true,
    titleEn: "CSS Effects Generator", titleEs: "Generador de Efectos CSS con Previsualización",
    descEn: "Live-preview generator for shadows, rounded corners, transitions, animations, and gradients.",
    descEs: "Sombras, bordes redondeados, transiciones, animaciones y degradados con vista previa en tiempo real."},

  "color-converter": {category: "diseno-frontend-css", icon: "fa-palette", iconPrefix: "fas", built: true,
    titleEn: "Color Picker & Converter", titleEs: "Selector y Convertidor de Colores",
    descEn: "Convert between HEX, RGB, HSL, and build/extract color palettes.",
    descEs: "Conversión entre HEX, RGB, HSL y creación/extracción de paletas de colores."},

  "css-minifier": {category: "desarrollo-datos", icon: "fa-file-code", iconPrefix: "fas", built: true,
    titleEn: "CSS Minifier & Formatter", titleEs: "Minificador y Formateador de CSS",
    descEn: "Clean up, indent, and minify stylesheets.",
    descEs: "Limpieza, sangrado y minificación de hojas de estilo."},

  "json-formatter": {category: "desarrollo-datos", icon: "fa-code", iconPrefix: "fas", built: true, featured: true,
    titleEn: "JSON Minifier & Formatter", titleEs: "Minificador y Formateador de JSON",
    descEn: "Format, validate, and minify JSON structures.",
    descEs: "Formatear, validar y minificar estructuras JSON."},

  "base64-encoder": {category: "desarrollo-datos", icon: "fa-lock", iconPrefix: "fas", built: true,
    titleEn: "Base64 Encoder / Decoder", titleEs: "Codificador y Decodificador Base64",
    descEn: "Two-way conversion of text and images to/from Base64.",
    descEs: "Conversión bidireccional de texto e imágenes a Base64."},

  "json-yaml-converter": {category: "desarrollo-datos", icon: "fa-exchange-alt", iconPrefix: "fas", built: true,
    titleEn: "JSON &harr; YAML Converter", titleEs: "Conversor de Formatos de Datos (JSON a YAML / YAML a JSON)",
    descEn: "Quick conversion between configuration formats.",
    descEs: "Conversión rápida entre formatos de configuración."},

  "hash-generator": {category: "desarrollo-datos", icon: "fa-hashtag", iconPrefix: "fas", built: true,
    titleEn: "Security Hash Generator", titleEs: "Generador de Hashes de Seguridad",
    descEn: "Generate MD5, SHA-256, and more.",
    descEs: "Generación de MD5, SHA-256, etc."},

  "uuid-generator": {category: "desarrollo-datos", icon: "fa-fingerprint", iconPrefix: "fas", built: true,
    titleEn: "UUID / GUID Generator", titleEs: "Generador de UUID / GUID",
    descEn: "Generate unique identifiers for development.",
    descEs: "Generación de identificadores únicos para desarrollo."},

  "http-status-codes": {category: "desarrollo-datos", icon: "fa-server", iconPrefix: "fas", built: true,
    titleEn: "HTTP Status Code Reference", titleEs: "Buscador / Referencia de Códigos de Estado HTTP",
    descEn: "Interactive guide to HTTP codes (200, 301, 404, 500, etc.).",
    descEs: "Guía interactiva de códigos HTTP (200, 301, 404, 500, etc.)."},

  "ip-lookup": {category: "utilidades-productividad", icon: "fa-network-wired", iconPrefix: "fas", built: false, featured: true,
    titleEn: "IP Address Lookup & Diagnostics", titleEs: "Consulta y Diagnóstico de Dirección IP",
    descEn: "View your public IP, approximate geolocation, HTTP headers, and User-Agent.",
    descEs: "Visualización de IP pública, geolocalización aproximada, cabeceras HTTP y User-Agent."},

  "timezone-converter": {category: "utilidades-productividad", icon: "fa-clock", iconPrefix: "fas", built: false,
    titleEn: "Time Zone Converter", titleEs: "Conversor de Zonas Horarias",
    descEn: "Convert times across time zones - ideal for tourism and scheduling sites.",
    descEs: "Herramienta de conversión de horarios (ideal para sitios de turismo y coordinación)."},

  "currency-converter": {category: "utilidades-productividad", icon: "fa-coins", iconPrefix: "fas", built: false,
    titleEn: "Currency Converter", titleEs: "Conversor de Monedas",
    descEn: "Real-time conversion between currencies.",
    descEs: "Cálculo de conversión entre distintas divisas en tiempo real."},

  "password-generator": {category: "utilidades-productividad", icon: "fa-key", iconPrefix: "fas", built: false,
    titleEn: "Secure Password Generator", titleEs: "Generador de Contraseñas Seguras",
    descEn: "Configurable length, special characters, numbers, and uppercase.",
    descEs: "Configuración de longitud, caracteres especiales, números y mayúsculas."},

  "word-counter": {category: "utilidades-productividad", icon: "fa-font", iconPrefix: "fas", built: false,
    titleEn: "Word & Character Counter", titleEs: "Contador de Palabras y Caracteres",
    descEn: "Word, character, and paragraph metrics, plus a reading-time estimate.",
    descEs: "Métricas de palabras, caracteres y párrafos, y estimación de tiempo de lectura."},

  "text-case-converter": {category: "utilidades-productividad", icon: "fa-text-height", iconPrefix: "fas", built: false,
    titleEn: "Text Case Converter", titleEs: "Conversor de Formato de Texto",
    descEn: "UPPERCASE / lowercase, Title Case, camelCase, snake_case, kebab-case.",
    descEs: "Mayúsculas/minúsculas, Title Case, camelCase, snake_case, kebab-case."},

  "percentage-calculator": {category: "utilidades-productividad", icon: "fa-percentage", iconPrefix: "fas", built: false,
    titleEn: "Percentage Calculator", titleEs: "Calculadora de Porcentajes",
    descEn: "Quick calculation of discounts, increases, and percentage changes.",
    descEs: "Cálculo rápido de descuentos, aumentos e incrementos porcentuales."},

  "date-difference-calculator": {category: "utilidades-productividad", icon: "fa-calendar-alt", iconPrefix: "fas", built: false,
    titleEn: "Date Difference Calculator", titleEs: "Calculadora de Diferencia Entre Fechas",
    descEn: "Exact calculation of days, months, and years between two dates.",
    descEs: "Cálculo exacto de días, meses y años entre dos fechas."},

  "todo-list": {category: "utilidades-productividad", icon: "fa-tasks", iconPrefix: "fas", built: false,
    titleEn: "Simple To-Do List", titleEs: "Gestor de Lista de Tareas",
    descEn: "Interactive task organizer with local storage (localStorage).",
    descEs: "Organizador interactivo con almacenamiento local (localStorage)."}
};

// Explicit display order (struct key order isn't guaranteed) - sidebar/landing loop over this, grouped by category.
request.toolOrder = [
  "meta-tags-extractor", "whatsapp-link-generator", "email-signature-generator", "qr-code-generator",
  "image-editor", "css-effects-generator", "color-converter",
  "css-minifier", "json-formatter", "base64-encoder", "json-yaml-converter", "hash-generator", "uuid-generator", "http-status-codes",
  "ip-lookup", "timezone-converter", "currency-converter", "password-generator", "word-counter", "text-case-converter", "percentage-calculator", "date-difference-calculator", "todo-list"
];
</cfscript>
