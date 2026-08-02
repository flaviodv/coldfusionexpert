# CLAUDE.md

Guidance for Claude Code (or any agent) working in this repository.

## What this is

Personal site + CV + consulting landing page for Flavio Di Virgilio (`coldfusionexpert.ar`), built in **ColdFusion/CFML** (Lucee). Bilingual (English/Spanish). Also hosts a growing **free tools** section (`/tools/`).

## Architecture

- **Bilingual routing**: language lives in `session.lan` (`"en"` or `"es"`), set in `Application.cfc`'s `onRequestStart` from `url.lan` if present. Content-switch pages follow the pattern:
  - `index.cfm` → includes `index_en.cfm` or `index_es.cfm` based on `session.lan`.
  - `tools.cfm` → includes `tools_en.cfm` or `tools_es.cfm`.
  - Individual tool pages under `tools/*.cfm` read `session.lan` directly (no separate `_en`/`_es` files — see below).
- **Header/footer are injected automatically** by `Application.cfc`:
  - `onRequestStart` includes `header_en.cfm` or `header_es.cfm` before the page runs.
  - `onRequestEnd` includes `footer_en.cfm` or `footer_es.cfm` after.
  - **Do not** `cfinclude` header/footer manually in a page — it happens for every non-`.cfc` request already.
- **Per-page SEO**: `Application.cfc` resolves `request.pageTitle` / `request.pageDescription` / `request.pageKeywords` / `request.pageCanonical` / `request.pageAlternateEs` / `request.pageAlternateEn` / `request.pageOgTitle` / `request.pageOgDescription` / `request.pageOgUrl` / `request.pageSchemaJson` / `request.pageNoindex` by matching the requested filename against `tools/_tools-registry.cfm` *before* including the header. `header_en.cfm`/`header_es.cfm` use those if defined, otherwise fall back to the homepage's hardcoded defaults (including the default Person/ProfessionalService/Course JSON-LD graph). If you add a new top-level page that needs its own title/schema, extend this lookup (don't hardcode more titles into the header partials).
- **Clean URLs via `web.config` rewrite** (IIS URL Rewrite module): the public URL scheme has no `.cfm` extension — `/`, `/tools`, `/tools/{slug}`. The physical files are still `index.cfm`, `tools.cfm`, `tools/{slug}.cfm`; `web.config` 301-redirects any `.cfm` request to the clean equivalent, then internally rewrites the clean URL back to the physical file (see the `<rewrite>` rules). **Always write internal links, canonical/hreflang tags, and JSON-LD `item`/`url` values using the clean form** (`/tools/{slug}`, `/tools`) — never re-introduce `.cfm` into an `href` or a schema URL, since that now just adds an avoidable redirect hop instead of pointing straight at the canonical URL. Adding a new tool needs no rewrite-rule changes — the pattern (`^tools/([a-z0-9-]+)/?$`) is generic.

## Tools section (`/tools/`)

- `tools/_tools-registry.cfm` — **single source of truth** for every tool: slug, category, icon, EN/ES title & description, `built` (false = still a skeleton, gets `noindex`). The homepage `#tools` carousel shows the first 2 **built** tools per category in `request.toolOrder`, computed fresh on every request — no manual flag to maintain. `tools/_tools-registry.cfm` also defines `request.toolCategories`; add a category there before assigning tools to it.
- `tools/_sidebar.cfm` — persistent left nav, grouped by category, reused on the landing page and every individual tool page.
- `tools/_tool-page.cfm` — shared skeleton layout (breadcrumb, placeholder box, description, WhatsApp CTA) for a single tool. Each `tools/{slug}.cfm` file is ~2 lines: set `local.slug`, then `<cfinclude template="_tool-page.cfm">`.
- To add a new tool: add one entry to the registry, create one `tools/{slug}.cfm` file, done — sidebar and landing pick it up automatically.
- To make a tool "live": build the real widget inside its `_tool-page.cfm`-rendered placeholder area (or give it its own markup) and flip `built: true` in the registry so it stops being `noindex`.

## Hard-learned gotchas

- **Asset paths must be root-relative.** Everything in `header_en.cfm`/`header_es.cfm`/`footer_en.cfm`/`footer_es.cfm` (CSS, JS, images, the logo link) uses a leading `/` (e.g. `/assets/css/...`, not `assets/css/...`). These partials are shared by pages at different folder depths (root pages vs. `/tools/*.cfm`); a relative path silently 404s once a page isn't at the site root.
- **`cfinclude` shares scope with the caller.** Plain `.cfm` pages have no automatic function-local scoping — a loop variable named `local.tool` in an included partial will clobber a same-named variable in the including template. Convention used here: give each partial's loop variables a short unique prefix (sidebar uses `local.sb*`, the homepage's featured-tools loop uses `local.ft*`, etc.). Follow this when adding new includes that loop.
- **Design convention**: all pages under the Tools section (landing + every individual tool page) are **full-width** — `.tools-layout` in `assets/css/tools.css` intentionally has no `max-width` cap, unlike the rest of the site which sits inside Bootstrap's `.container`. Keep new tool-related markup inside `.tools-layout` / `.tools-main` rather than reintroducing a `.container` wrapper.
- **`sitemap.xml` is a static file, not generated at request time.** Adding/removing a tool or flipping `built` does not update it automatically — it must be regenerated by hand (loop `request.toolOrder` for `built: true` entries, clean-URL form, ES/EN + hreflang alternates for each). If this becomes frequent, consider serving it dynamically instead, but that requires IIS routing `.xml` through the CFML engine, which isn't currently configured.
- **CFScript string escaping is CFML-style, not JS-style.** A literal `"` inside a double-quoted cfscript string must be doubled (`""`), not backslash-escaped (`\"`) — the latter throws `ParseException` on Adobe ColdFusion. Also, inside `<cfoutput>`, a lone `#` in plain text (e.g. a hex color like `#13AFF0`) must be escaped as `##`, or it silently breaks parsing of every `<cfif>` after it in the same template.

## Multi-agent coordination

`checklist.md` (index) + `checklist/*.md` (one file per tool category) track the tools backlog so multiple agents/sessions can pick up a category each without stepping on one another. `checklist/00-arquitectura.md` covers the shared architecture decisions (already implemented).
