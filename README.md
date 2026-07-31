# ColdFusion Expert — coldfusionexpert.ar

Personal site, CV/portfolio, and consulting landing page for Flavio Di Virgilio, plus a growing section of free online tools. Built in **ColdFusion/CFML**, running on **Lucee**.

## Stack

- ColdFusion/CFML (Lucee), no framework — plain `.cfm` templates + one `Application.cfc`.
- Bootstrap, jQuery, Owl Carousel, Font Awesome (all vendored under `vendor/` / `assets/`).
- No build step — everything is served as-is.

## Structure

```
Application.cfc          Bilingual routing, per-page SEO, auto header/footer injection
index.cfm                Homepage router (EN/ES)
index_en.cfm / index_es.cfm    Homepage content
header_en.cfm / header_es.cfm  <head> + top nav (injected on every request)
footer_en.cfm / footer_es.cfm  Footer + scripts (injected on every request)

tools.cfm                 Tools landing router (EN/ES)
tools_en.cfm / tools_es.cfm    Tools landing content (cards grouped by category)
tools/
  _tools-registry.cfm     All tool metadata (categories, titles, descriptions, icons, flags)
  _sidebar.cfm            Persistent left nav for the Tools section
  _tool-page.cfm          Shared skeleton layout for one tool
  {slug}.cfm               One file per tool (currently placeholders)

assets/                   CSS, JS, images
vendor/                   Third-party libraries (Bootstrap, jQuery)
checklist.md + checklist/ Tools backlog, split by category for parallel work
sitemap.xml, robots.txt   SEO
```

## Bilingual content

Language is stored in `session.lan` (`en` default, `es` via `?lan=es`). Set once in `Application.cfc`, read everywhere (`session.lan eq "es"`). Most content-heavy pages ship as an `_en`/`_es` pair; simpler pages (like individual tool pages) branch inline instead of duplicating files.

## Tools section

Free browser-based tools live under `/tools/`. See [CLAUDE.md](CLAUDE.md) for the internal architecture (registry pattern, shared includes, SEO handling) and `checklist.md` for the current backlog of tools to build out.

## Local development

Point a Lucee/ColdFusion server's web root at this folder. The site expects to be served from the domain root (asset paths are root-relative, e.g. `/assets/...`).

## Contact

flavio.di.virgilio@gmail.com
