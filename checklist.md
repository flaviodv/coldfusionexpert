# Checklist de Proyecto: Sección de Herramientas Web Gratuitas

Documento de referencia y lista de tareas extraído de la conversación sobre el desarrollo de la sección de herramientas gratuitas para el sitio web personal/CV.

---

## 🏛️ 1. Arquitectura y Estructura General del Sitio Web

- [ ] **Integración en la Web Personal (CV / Portfolio)**:
  - [ ] Crear la sección principal de "Herramientas" en la web.
  - [ ] Diseñar el menú de navegación para incluir el acceso a la sección de herramientas.
  - [ ] Crear una página de aterrizaje (Landing) que presente todas las categorías y herramientas disponibles.
- [ ] **Estructura de Páginas Individuales (Página por Herramienta)**:
  - [ ] Cada herramienta debe contar con su propia URL/Página independiente para optimización SEO.
  - [ ] **Layout de Página**:
    - [ ] **Parte Superior**: Widget / Interfaz interactiva de la herramienta principal.
    - [ ] **Parte Inferior**: Sección de ayuda, instrucciones de uso y contenido SEO informativo.
- [ ] **Categorización**:
  - [ ] Organizar las herramientas en categorías claras y profesionales.
- [ ] **Privacidad y Rendimiento**:
  - [ ] Procesar la lógica preferentemente en el cliente (Browser-side / JS) cuando sea posible (ej. conversiones, minificadores, formateadores, manipulación de imágenes).

---

## 🛠️ 2. Checklist de Herramientas por Categoría

### 📢 Marketing, SEO y Social
- [ ] **Extractor de Meta Tags y Keywords**: Extraer título, descripción, meta tags y palabras clave introduciendo una URL.
- [ ] **Generador de Enlaces de WhatsApp**: Crear links directos con mensajes predefinidos para contacto instantáneo.
- [ ] **Generador de Firmas de Correo Electrónico**: Plantillas HTML personalizables para firmas de e-mail profesionales.
- [ ] **Generador de Códigos QR**: Creación de QR personalizados (colores, estilos, descarga en PNG/SVG).

### 🎨 Diseño y Frontend CSS
- [ ] **Editor de Imágenes Interactivo**: Edición rápida y exportación/conversión en múltiples formatos (WebP, PNG, JPG, etc.).
- [ ] **Generador de Efectos CSS con Previsualización**:
  - [ ] Sombras (`box-shadow` / `text-shadow`).
  - [ ] Bordes redondeados (`border-radius`).
  - [ ] Transiciones y animaciones.
  - [ ] Generador de degradados CSS (`linear-gradient` / `radial-gradient`).
  - [ ] Previsualización en tiempo real y botón para copiar código listo para usar.
- [ ] **Selector y Convertidor de Colores**:
  - [ ] Conversión entre HEX, RGB, HSL.
  - [ ] Creador/Extractor de paletas de colores.

### 💻 Desarrollo, Programación y Datos
- [ ] **Minificador y Formateador de CSS**: Limpieza, sangrado y minificación de hojas de estilo.
- [ ] **Minificador y Formateador de JSON**: Formatear, validar y minificar estructuras JSON.
- [ ] **Codificador y Decodificador Base64**: Conversión bidireccional de texto e imágenes a Base64.
- [ ] **Conversor de Formatos de Datos (JSON a YAML / YAML a JSON)**: Conversión rápida entre formatos de configuración.
- [ ] **Generador de Hashes de Seguridad**: Generación de MD5, SHA-256, etc.
- [ ] **Generador de UUID / GUID**: Generación de identificadores únicos para desarrollo.
- [ ] **Buscador / Referencia de Códigos de Estado HTTP**: Guía interactiva de códigos HTTP (200, 301, 404, 500, etc.).

### 🧰 Utilidades Generales y Productividad
- [ ] **Consulta y Diagnóstico de Dirección IP**:
  - [ ] Visualización de IP pública.
  - [ ] Geolocalización aproximada, cabeceras HTTP y User-Agent.
- [ ] **Conversor de Zonas Horarias**: Herramienta de conversión de horarios (ideal para sitios de turismo y coordinación).
- [ ] **Conversor de Monedas**: Cálculo de conversión entre distintas divisas en tiempo real.
- [ ] **Generador de Contraseñas Seguras**: Configuración de longitud, caracteres especiales, números y mayúsculas.
- [ ] **Contador de Palabras y Caracteres**:
  - [ ] Métricas de palabras, caracteres y párrafos.
  - [ ] Estimación de tiempo de lectura.
- [ ] **Conversor de Formato de Texto**:
  - [ ] Mayúsculas / Minúsculas.
  - [ ] Capitalización de palabras (Title Case).
  - [ ] `camelCase`, `snake_case`, `kebab-case`.
- [ ] **Calculadora de Porcentajes**: Cálculo rápido de descuentos, aumentos e incrementos porcentuales.
- [ ] **Calculadora de Diferencia Entre Fechas**: Cálculo exacto de días, meses y años entre dos fechas.
- [ ] **Gestor de Lista de Tareas (To-Do App Sencilla)**: Organizador interactivo con almacenamiento local (`localStorage`).

---

## 🎨 3. Próximos Pasos de Diseño e Implementación

- [ ] Definir el sistema de diseño visual unificado (paleta de colores, tipografías, componentes UI).
- [ ] Maquetar la navegación y la página de catálogo de herramientas.
- [ ] Desarrollar los primeros componentes reutilizables (inputs, botones de copiar al portapapeles, vistas previas).
- [ ] Implementar la primera suite de herramientas prioridad alta (Detector IP, Editor de Imágenes, Generador QR, Conversor de Texto).
