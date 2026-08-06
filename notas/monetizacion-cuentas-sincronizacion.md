# Monetización: cuentas y sincronización (para tener en cuenta, no implementar aún)

> Nota guardada como referencia futura. No es un plan aprobado ni un checklist de tareas.

La idea es buena, pero no cobraría por "usar las herramientas". Cobraría por la **cuenta y la sincronización**.

Actualmente, al guardar en `localStorage`, los datos quedan asociados a ese navegador y a ese dominio; no se comparten automáticamente con otro navegador o dispositivo. Para sincronizarlos hace falta identificar al usuario y guardar su información en una base de datos en la nube. ([MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API))

## Modelo que usaría

### Gratis, sin registro

- Todas las herramientas disponibles.
- Datos guardados localmente.
- Sin límites artificiales.
- Aviso claro:

```text
Tus datos se guardan únicamente en este navegador.
Creá una cuenta para sincronizarlos entre dispositivos.
```

### Cuenta gratuita

Antes de lanzar una membresía, permitiría registro gratuito con:

- Google y correo.
- Sincronización limitada.
- Por ejemplo, hasta 3 herramientas con datos guardados.
- Copia de seguridad básica.
- Importar y exportar información.

Esto permite comprobar si realmente existe interés por la sincronización.

### Membresía Pro

La membresía podría incluir:

- Sincronización ilimitada entre navegadores y dispositivos.
- Historial y copias de seguridad.
- Restauración de datos.
- Más capacidad de almacenamiento.
- Exportaciones avanzadas.
- Sin publicidad, en caso de agregarla.
- Acceso anticipado a nuevas herramientas.
- Espacios o perfiles separados.

## Precio

No empezaría únicamente con un pago anual obligatorio. Mostraría ambas opciones:

```text
Pro mensual: USD 2,99
Pro anual: USD 24,99
```

El anual representa aproximadamente dos meses gratis y reduce la fricción de alguien que no quiere comprometerse directamente por un año. Las plataformas de suscripciones permiten trabajar tanto con cobros mensuales como anuales. ([Stripe](https://stripe.com/billing/pricing))

También se podría lanzar una oferta inicial:

```text
Precio fundador: USD 14,99 por el primer año
```

## El punto importante

La sincronización sola puede no ser suficiente para justificar una membresía anual. Conviene sumar valor progresivamente:

- panel personal;
- favoritos;
- configuraciones compartidas;
- historial de trabajos;
- plantillas;
- automatizaciones;
- uso conjunto entre herramientas.

Por ejemplo, que una tarea creada en la lista pueda utilizarse en el contador de tiempo y después aparecer en un reporte de horas. Ahí se deja de ofrecer herramientas aisladas y se empieza a construir una **suite de productividad**.

## Recomendación concreta

Implementar primero **registro gratuito + sincronización limitada**, medir cuántos usuarios lo utilizan y recién después activar el plan Pro. Es una evolución lógica para el sitio, no algo para hacer ahora.

## ¿Convivir marca personal + producto en el mismo dominio?

Sí, y en este caso tiene bastante sentido. El sitio puede cumplir dos funciones:

- **marca personal y captación de clientes**;
- **plataforma de herramientas gratuitas**.

La clave es que una función no confunda a la otra. Estructura a mantener:

```text
Inicio
Servicios
Experiencia
Herramientas
Acerca de
Contacto
```

Y dentro de **Herramientas**, la parte más "producto":

```text
/tools
/tools/categoria
/tools/nombre-herramienta
/login
/account
/pricing
```

La portada sigue vendiendo al profesional. La sección Tools atrae tráfico, genera autoridad y puede convertirse después en una suite con cuentas y sincronización.

La combinación beneficia a ambos lados:

- las herramientas demuestran capacidad de desarrollo;
- atraen visitas orgánicas;
- diferencian de otros freelancers;
- pueden generar usuarios recurrentes;
- más adelante permiten ofrecer una membresía.

Lo único a evitar: que la home se transforme en un catálogo de herramientas. En la página principal, mostrar una selección breve + botón "Ver todas las herramientas". El catálogo completo vive en `/tools`.

**Recomendación**: mantener todo en coldfusionexpert.ar por ahora. Separar la plataforma en otro dominio solo si las herramientas crecen hasta convertirse en un producto con identidad y audiencia propias.

## ¿Sumar herramientas tipo Monday o control de presupuesto?

Ojo con el salto de escala: un sistema tipo Monday es multiusuario, colaborativo y en tiempo real — es un producto completo que compite con Monday/Trello/Asana/ClickUp, no algo que se suma como "una herramienta más" al catálogo actual. Construir y mantener eso es un negocio aparte, no un side-project.

Lo que sí encaja con el patrón que ya existe en el sitio (herramienta de navegador con `localStorage`, sync opcional más adelante) es la versión **personal/single-user**:

- un kanban simple para uso individual (sin colaboración en equipo, sin permisos, sin tiempo real);
- un control de gastos personal (ingresos, categorías, gráficos básicos).

Mismo modelo que `time-tracker` y `todo-list`, sin la complejidad de un producto colaborativo. Si el objetivo es darle más peso a la futura membresía Pro, conviene ir por acá primero: son herramientas de productividad personal que refuerzan el ejemplo de la sección anterior (tarea → timer → reporte), y quedan mucho más cerca de lo que un freelancer solo puede construir y mantener que un clon de Monday.

## ¿Herramientas con automatización de IA?

Sí es viable un nivel básico — no hace falta un "sistema groso". La complejidad real está en quién paga la llamada a la API, no en la IA en sí.

**Nivel básico (encaja con el stack actual)**: una herramienta que hace una sola llamada a OpenAI/Claude/Gemini vía `cfhttp` desde CFML — sin memoria, sin RAG, sin agentes. Ejemplos: generador de meta-descripciones SEO con IA, explicador de código, generador de regex a partir de lenguaje natural, reescritor de textos para newsletters. Misma complejidad que las herramientas ya existentes, más una llamada HTTP. Además encaja con el servicio de "AI Automation" que ya se promociona en el schema/JSON-LD de la home, así que sirve como vidriera de esa capacidad.

**El problema real a resolver antes de construirlo**: si la herramienta es gratis y pública, cualquiera puede scriptear pedidos contra la API key sin parar y comerse el presupuesto. Dos salidas:

- **BYOK** (bring your own key): el usuario pega su propia key de OpenAI/Claude, sin costo para el sitio — mismo mensaje de "privacidad, no se guarda en servidor" que ya usa el editor de imágenes.
- **Key propia con límite estricto** (por IP o por sesión, X requests/día) — gasto chico y controlado, asumido como costo de marketing.

**Lo que sí sería "sistema groso"** (no meter en el catálogo de tools todavía): RAG con vector DB, agentes que ejecutan acciones multi-paso, o un builder de automatizaciones tipo Zapier (trigger→acción). Eso es infraestructura aparte (cola de jobs, orquestación, posiblemente otro stack fuera de CFML), un producto distinto en sí mismo.

[Fuente 1]: https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API
[Fuente 2]: https://stripe.com/billing/pricing
