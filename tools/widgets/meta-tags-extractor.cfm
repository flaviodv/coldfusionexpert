<cfprocessingdirective pageencoding="utf-8">
<div class="tool-widget widget-meta-tags-extractor">
  <label for="mte-url"><cfif local.isEs>URL a analizar<cfelse>URL to analyze</cfif></label>
  <div class="mte-controls">
    <div class="mte-input-row">
      <input id="mte-url" type="text" placeholder="https://ejemplo.com" autocomplete="url" spellcheck="false">
      <button type="button" class="btn-social btn-upwork" id="mte-run"><i class="fas fa-search"></i> <cfif local.isEs>Extraer<cfelse>Extract</cfif></button>
    </div>
    <div class="mte-actions-row">
      <button type="button" class="tool-copy" id="mte-copy-url"><i class="far fa-copy"></i> <cfif local.isEs>Copiar<cfelse>Copy</cfif></button>
      <button type="button" class="tool-copy" id="mte-paste"><i class="fas fa-paste"></i> <cfif local.isEs>Pegar<cfelse>Paste</cfif></button>
      <button type="button" class="tool-copy" id="mte-clear"><i class="fas fa-trash-alt"></i> <cfif local.isEs>Limpiar<cfelse>Clear</cfif></button>
      <a id="mte-open-url" class="tool-copy mte-btn-open" href="#" target="_blank" rel="noopener noreferrer" style="display:none;" title="<cfif local.isEs>Abrir URL en nueva pesta&ntilde;a<cfelse>Open URL in new tab</cfif>"><i class="fas fa-external-link-alt"></i> <cfif local.isEs>Abrir<cfelse>Open</cfif></a>
    </div>
  </div>
  <p class="tool-message" id="mte-status" aria-live="polite"></p>

  <div class="mte-results" id="mte-results" style="display:none;">
    <!-- Navigation Tabs -->
    <div class="mte-tabs-nav" role="tablist">
      <button type="button" class="mte-tab-btn active" data-tab="mte-tab-meta" role="tab" aria-selected="true">
        <i class="fas fa-tags"></i> <cfif local.isEs>Meta Tags SEO<cfelse>SEO Meta Tags</cfif>
      </button>
      <button type="button" class="mte-tab-btn" data-tab="mte-tab-social" role="tab" aria-selected="false">
        <i class="fas fa-share-alt"></i> <cfif local.isEs>Open Graph &amp; Social<cfelse>Open Graph &amp; Social</cfif>
      </button>
      <button type="button" class="mte-tab-btn" data-tab="mte-tab-schema" role="tab" aria-selected="false">
        <i class="fas fa-cubes"></i> <cfif local.isEs>Datos Estructurados<cfelse>Structured Data</cfif>
        <span class="mte-tab-badge" id="mte-badge-schema">0</span>
      </button>
      <button type="button" class="mte-tab-btn" data-tab="mte-tab-raw" role="tab" aria-selected="false">
        <i class="fas fa-code"></i> <cfif local.isEs>JSON-LD Raw<cfelse>Raw JSON-LD</cfif>
        <span class="mte-tab-badge" id="mte-badge-raw">0</span>
      </button>
    </div>

    <!-- Tab 1: Meta Tags SEO -->
    <div class="mte-tab-pane active" id="mte-tab-meta" role="tabpanel">
      <table class="mte-table">
        <tbody>
          <tr>
            <th><cfif local.isEs>T&iacute;tulo (&lt;title&gt;)<cfelse>Title (&lt;title&gt;)</cfif></th>
            <td>
              <div id="mte-title" class="mte-val-text"></div>
              <div id="mte-title-len" class="mte-len-indicator"></div>
            </td>
          </tr>
          <tr>
            <th><cfif local.isEs>Meta Descripci&oacute;n<cfelse>Meta Description</cfif></th>
            <td>
              <div id="mte-description" class="mte-val-text"></div>
              <div id="mte-description-len" class="mte-len-indicator"></div>
            </td>
          </tr>
          <tr>
            <th><cfif local.isEs>Palabras clave (Keywords)<cfelse>Keywords</cfif></th>
            <td id="mte-keywords"></td>
          </tr>
          <tr>
            <th>Canonical URL</th>
            <td id="mte-canonical"></td>
          </tr>
          <tr>
            <th>Robots</th>
            <td id="mte-robots"></td>
          </tr>
          <tr>
            <th>Viewport</th>
            <td id="mte-viewport"></td>
          </tr>
          <tr>
            <th><cfif local.isEs>Autor<cfelse>Author</cfif></th>
            <td id="mte-author"></td>
          </tr>
          <tr>
            <th><cfif local.isEs>Idioma / Charset<cfelse>Language / Charset</cfif></th>
            <td id="mte-lang-charset"></td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- Tab 2: Open Graph & Social -->
    <div class="mte-tab-pane" id="mte-tab-social" role="tabpanel">
      <!-- Social snippet preview card -->
      <div class="mte-preview-section">
        <h4 class="mte-preview-heading"><i class="fas fa-eye"></i> <cfif local.isEs>Vista previa en redes sociales (Facebook / LinkedIn)<cfelse>Social Media Preview (Facebook / LinkedIn)</cfif></h4>
        <div class="mte-social-card-preview">
          <div class="mte-preview-image-wrap" id="mte-preview-img-wrap">
            <img id="mte-preview-img" src="" alt="OpenGraph preview image">
          </div>
          <div class="mte-preview-body">
            <div class="mte-preview-host" id="mte-preview-host"></div>
            <div class="mte-preview-title" id="mte-preview-title"></div>
            <div class="mte-preview-desc" id="mte-preview-desc"></div>
          </div>
        </div>
      </div>

      <table class="mte-table">
        <tbody>
          <tr><th>og:title</th><td id="mte-og-title"></td></tr>
          <tr><th>og:description</th><td id="mte-og-description"></td></tr>
          <tr><th>og:image</th><td id="mte-og-image"></td></tr>
          <tr><th>og:type</th><td id="mte-og-type"></td></tr>
          <tr><th>og:url</th><td id="mte-og-url"></td></tr>
          <tr><th>og:site_name</th><td id="mte-og-site-name"></td></tr>
          <tr><th>og:locale</th><td id="mte-og-locale"></td></tr>
          <tr><th>twitter:card</th><td id="mte-tw-card"></td></tr>
          <tr><th>twitter:title</th><td id="mte-tw-title"></td></tr>
          <tr><th>twitter:description</th><td id="mte-tw-description"></td></tr>
          <tr><th>twitter:image</th><td id="mte-tw-image"></td></tr>
          <tr><th>twitter:site</th><td id="mte-tw-site"></td></tr>
        </tbody>
      </table>
    </div>

    <!-- Tab 3: Datos Estructurados (Schema.org / JSON-LD) -->
    <div class="mte-tab-pane" id="mte-tab-schema" role="tabpanel">
      <div class="mte-schema-header">
        <div class="mte-schema-summary" id="mte-schema-summary"></div>
        <a id="mte-google-test" href="#" target="_blank" rel="noopener noreferrer" class="btn-social btn-upwork mte-btn-test">
          <i class="fas fa-external-link-alt"></i> <cfif local.isEs>Probar en Rich Results Test (Google)<cfelse>Google Rich Results Test</cfif>
        </a>
      </div>
      <div id="mte-schema-items" class="mte-schema-list"></div>
      <div id="mte-schema-empty" class="mte-empty-state" style="display:none;">
        <i class="fas fa-info-circle"></i>
        <p><cfif local.isEs>No se detectaron etiquetas de datos estructurados Schema.org (JSON-LD) en esta p&aacute;gina.<cfelse>No Schema.org (JSON-LD) structured data tags were detected on this page.</cfif></p>
        <a href="/tools/schema-json-ld-generator" class="tool-copy"><i class="fas fa-wand-magic-sparkles"></i> <cfif local.isEs>Crear Schema con nuestro Generador<cfelse>Create Schema with our Generator</cfif></a>
      </div>
    </div>

    <!-- Tab 4: JSON-LD Raw -->
    <div class="mte-tab-pane" id="mte-tab-raw" role="tabpanel">
      <div class="mte-raw-actions">
        <button type="button" class="tool-copy" id="mte-copy-raw-all"><i class="far fa-copy"></i> <cfif local.isEs>Copiar todo el JSON-LD<cfelse>Copy all JSON-LD</cfif></button>
        <a id="mte-schema-org-val" href="#" target="_blank" rel="noopener noreferrer" class="tool-copy">
          <i class="fas fa-check-double"></i> Schema.org Validator
        </a>
      </div>
      <div id="mte-raw-blocks" class="mte-raw-list"></div>
      <div id="mte-raw-empty" class="mte-empty-state" style="display:none;">
        <i class="fas fa-code"></i>
        <p><cfif local.isEs>No hay scripts JSON-LD disponibles para mostrar.<cfelse>No JSON-LD scripts available to display.</cfif></p>
      </div>
    </div>
  </div>
</div>
<style>
  /* Controls & Layout */
  .widget-meta-tags-extractor .mte-controls {
    display: flex;
    flex-direction: column;
    gap: 8px;
    margin-bottom: 14px;
  }
  .widget-meta-tags-extractor .mte-input-row {
    display: flex;
    gap: 10px;
    align-items: center;
  }
  .widget-meta-tags-extractor .mte-input-row input {
    flex: 1;
    min-width: 180px;
    margin: 0 !important;
  }
  .widget-meta-tags-extractor .mte-input-row .btn-social {
    margin: 0 !important;
    white-space: nowrap;
  }
  .widget-meta-tags-extractor .mte-actions-row {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    align-items: center;
  }
  .widget-meta-tags-extractor .mte-actions-row .tool-copy {
    margin: 0 !important;
    white-space: nowrap;
    display: inline-flex;
    align-items: center;
    gap: 6px;
    text-decoration: none;
    font-size: 0.82rem;
    padding: 5px 12px;
  }
  @media (max-width: 520px) {
    .widget-meta-tags-extractor .mte-input-row {
      flex-direction: column;
      align-items: stretch;
    }
  }

  /* Navigation Tabs */
  .widget-meta-tags-extractor .mte-tabs-nav {
    display: flex;
    flex-wrap: wrap;
    gap: 6px;
    border-bottom: 2px solid #e2e8f0;
    margin-top: 20px;
    margin-bottom: 18px;
  }
  .widget-meta-tags-extractor .mte-tab-btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 9px 16px;
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    border-bottom: none;
    border-radius: 8px 8px 0 0;
    color: #475569;
    font-size: 0.88rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.15s ease-in-out;
  }
  .widget-meta-tags-extractor .mte-tab-btn:hover {
    background: #f1f5f9;
    color: #0f172a;
  }
  .widget-meta-tags-extractor .mte-tab-btn.active {
    background: #ffffff;
    color: #168fc5;
    border-color: #168fc5 #e2e8f0 #ffffff #e2e8f0;
    border-top: 3px solid #168fc5;
    margin-bottom: -2px;
  }
  .widget-meta-tags-extractor .mte-tab-badge {
    background: #e2e8f0;
    color: #475569;
    font-size: 0.72rem;
    font-weight: 700;
    padding: 2px 7px;
    border-radius: 999px;
  }
  .widget-meta-tags-extractor .mte-tab-btn.active .mte-tab-badge {
    background: #e0f2fe;
    color: #0369a1;
  }

  /* Panes */
  .widget-meta-tags-extractor .mte-tab-pane { display: none; }
  .widget-meta-tags-extractor .mte-tab-pane.active { display: block; }

  /* Tables */
  .widget-meta-tags-extractor .mte-table { width: 100%; border-collapse: collapse; margin-top: 6px; }
  .widget-meta-tags-extractor .mte-table th, .widget-meta-tags-extractor .mte-table td {
    border-bottom: 1px solid #edf0f2;
    padding: 10px 12px;
    text-align: left;
    vertical-align: top;
  }
  .widget-meta-tags-extractor .mte-table th {
    color: #168fc5;
    width: 170px;
    font-size: 0.88rem;
    white-space: nowrap;
  }
  .widget-meta-tags-extractor .mte-table td {
    font-size: 0.9rem;
    color: #1e293b;
    overflow-wrap: anywhere;
  }
  .widget-meta-tags-extractor .mte-table td:empty::after { content: "-"; color: #b0b8bd; }
  .widget-meta-tags-extractor td img { max-width: 220px; max-height: 120px; display: block; margin-top: 6px; border-radius: 6px; border: 1px solid #e2e8f0; }

  /* Mismatch & Missing Canonical */
  .widget-meta-tags-extractor tr.mte-mismatch-row { background: #fdf2f1; }
  .widget-meta-tags-extractor td.mte-mismatch { color: #c0392b; font-weight: 600; }
  .widget-meta-tags-extractor .mte-mismatch-note { display: flex; align-items: center; gap: 6px; color: #c0392b; font-weight: 600; font-size: .82rem; margin-top: 6px; }
  .widget-meta-tags-extractor tr.mte-missing-row { background: #fff8ec; }
  .widget-meta-tags-extractor td.mte-missing { color: #9a6400; }
  .widget-meta-tags-extractor .mte-missing-note { display: flex; align-items: center; gap: 6px; color: #9a6400; font-weight: 600; font-size: .82rem; }

  /* Indicators */
  .widget-meta-tags-extractor .mte-len-indicator {
    font-size: 0.78rem;
    color: #64748b;
    margin-top: 4px;
    font-weight: 500;
  }
  .widget-meta-tags-extractor .mte-len-indicator.is-good { color: #16a34a; }
  .widget-meta-tags-extractor .mte-len-indicator.is-warn { color: #d97706; }

  /* Social Preview Card */
  .widget-meta-tags-extractor .mte-preview-section {
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    padding: 14px;
    margin-bottom: 16px;
  }
  .widget-meta-tags-extractor .mte-preview-heading {
    font-size: 0.88rem;
    color: #475569;
    margin: 0 0 10px;
    display: flex;
    align-items: center;
    gap: 6px;
  }
  .widget-meta-tags-extractor .mte-social-card-preview {
    max-width: 480px;
    border: 1px solid #cbd5e1;
    border-radius: 8px;
    overflow: hidden;
    background: #ffffff;
    box-shadow: 0 2px 4px rgba(0,0,0,0.04);
  }
  .widget-meta-tags-extractor .mte-preview-image-wrap {
    width: 100%;
    height: 180px;
    background: #e2e8f0;
    overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .widget-meta-tags-extractor .mte-preview-image-wrap img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
    border: none;
    margin: 0;
  }
  .widget-meta-tags-extractor .mte-preview-body { padding: 10px 12px; }
  .widget-meta-tags-extractor .mte-preview-host { font-size: 0.75rem; text-transform: uppercase; color: #64748b; font-weight: 600; letter-spacing: 0.5px; }
  .widget-meta-tags-extractor .mte-preview-title { font-size: 0.95rem; font-weight: 700; color: #0f172a; margin: 3px 0; line-height: 1.3; }
  .widget-meta-tags-extractor .mte-preview-desc { font-size: 0.8rem; color: #475569; line-height: 1.4; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; }

  /* Schema Items */
  .widget-meta-tags-extractor .mte-schema-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 10px;
    margin-bottom: 14px;
  }
  .widget-meta-tags-extractor .mte-schema-summary {
    font-size: 0.92rem;
    font-weight: 600;
    color: #1e293b;
  }
  .widget-meta-tags-extractor .mte-btn-test { font-size: 0.82rem; padding: 6px 12px; }
  .widget-meta-tags-extractor .mte-schema-card {
    border: 1px solid #e2e8f0;
    border-left: 4px solid #168fc5;
    border-radius: 8px;
    background: #ffffff;
    margin-bottom: 16px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.03);
    overflow: hidden;
  }
  .widget-meta-tags-extractor .mte-schema-card-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 8px;
    padding: 10px 14px;
    background: #f8fafc;
    border-bottom: 1px solid #edf0f2;
  }
  .widget-meta-tags-extractor .mte-schema-title-wrap {
    display: flex;
    align-items: center;
    gap: 8px;
  }
  .widget-meta-tags-extractor .mte-schema-badge {
    background: #168fc5;
    color: #ffffff;
    font-weight: 700;
    font-size: 0.78rem;
    padding: 3px 8px;
    border-radius: 6px;
    display: inline-flex;
    align-items: center;
    gap: 4px;
  }
  .widget-meta-tags-extractor .mte-schema-entity-name {
    font-weight: 700;
    font-size: 0.95rem;
    color: #0f172a;
  }
  .widget-meta-tags-extractor .mte-schema-card-body { padding: 12px 14px; }
  .widget-meta-tags-extractor .mte-schema-copy-btn {
    font-size: 0.76rem;
    padding: 4px 9px;
    border-radius: 4px;
    background: #ffffff;
    border: 1px solid #cbd5e1;
    color: #334155;
    cursor: pointer;
  }
  .widget-meta-tags-extractor .mte-schema-copy-btn:hover { background: #f1f5f9; color: #0f172a; }

  /* Nested Schema Tables */
  .widget-meta-tags-extractor .mte-nested-table {
    width: 100%;
    border-collapse: collapse;
    margin: 4px 0;
    background: #fafbfc;
    border: 1px solid #edf0f2;
    border-radius: 6px;
  }
  .widget-meta-tags-extractor .mte-nested-table th, .widget-meta-tags-extractor .mte-nested-table td {
    padding: 7px 10px;
    border-bottom: 1px solid #edf0f2;
    text-align: left;
    vertical-align: top;
    font-size: 0.84rem;
  }
  .widget-meta-tags-extractor .mte-nested-key {
    color: #0369a1;
    font-weight: 600;
    width: 140px;
    white-space: nowrap;
    background: #f1f5f9;
  }
  .widget-meta-tags-extractor .mte-nested-val {
    color: #1e293b;
    overflow-wrap: anywhere;
  }
  .widget-meta-tags-extractor .mte-val-image {
    display: flex;
    flex-direction: column;
    gap: 4px;
  }
  .widget-meta-tags-extractor .mte-val-image img {
    max-width: 180px;
    max-height: 90px;
    border-radius: 4px;
    border: 1px solid #cbd5e1;
  }
  .widget-meta-tags-extractor .mte-val-list {
    display: flex;
    flex-direction: column;
    gap: 6px;
  }
  .widget-meta-tags-extractor .mte-val-list-item {
    padding: 4px 8px;
    background: #ffffff;
    border: 1px solid #e2e8f0;
    border-radius: 4px;
  }

  /* Raw JSON-LD */
  .widget-meta-tags-extractor .mte-raw-actions {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    margin-bottom: 12px;
  }
  .widget-meta-tags-extractor .mte-raw-block-card {
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    background: #ffffff;
    margin-bottom: 16px;
    overflow: hidden;
  }
  .widget-meta-tags-extractor .mte-raw-block-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 8px 12px;
    background: #f8fafc;
    border-bottom: 1px solid #e2e8f0;
    font-size: 0.82rem;
    font-weight: 600;
    color: #475569;
  }
  .widget-meta-tags-extractor .mte-raw-code {
    margin: 0;
    padding: 12px;
    background: #0f172a;
    color: #e2e8f0;
    font-family: Consolas, "Courier New", monospace;
    font-size: 0.82rem;
    line-height: 1.5;
    max-height: 380px;
    overflow: auto;
    tab-size: 2;
    white-space: pre;
  }

  /* Empty state */
  .widget-meta-tags-extractor .mte-empty-state {
    text-align: center;
    padding: 32px 20px;
    background: #f8fafc;
    border: 1px dashed #cbd5e1;
    border-radius: 8px;
    color: #64748b;
    margin-top: 10px;
  }
  .widget-meta-tags-extractor .mte-empty-state i { font-size: 1.8rem; color: #94a3b8; margin-bottom: 8px; display: block; }
  .widget-meta-tags-extractor .mte-empty-state p { margin: 0 0 12px; font-size: 0.9rem; }
</style>
<script>
(function () {
  var isEs = <cfif local.isEs>true<cfelse>false</cfif>;
  var urlEl = document.getElementById('mte-url');
  var openUrlBtn = document.getElementById('mte-open-url');
  var statusEl = document.getElementById('mte-status');
  var resultsEl = document.getElementById('mte-results');

  function updateOpenUrlButton() {
    if (!openUrlBtn) return;
    var raw = (urlEl.value || '').trim();
    if (!raw) {
      openUrlBtn.style.display = 'none';
      openUrlBtn.href = '#';
      return;
    }
    var cleaned = cleanPastedUrl(raw) || raw;
    var hasProtocol = /^https?:\/\//i.test(cleaned);
    var hasDomain = /^([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}(:\d+)?(\/.*)?$/i.test(cleaned);
    if (hasProtocol || hasDomain) {
      var targetUrl = hasProtocol ? cleaned : ('https://' + cleaned);
      openUrlBtn.href = targetUrl;
      openUrlBtn.style.display = 'inline-flex';
    } else {
      openUrlBtn.style.display = 'none';
      openUrlBtn.href = '#';
    }
  }

  if (urlEl) {
    urlEl.addEventListener('input', updateOpenUrlButton);
    urlEl.addEventListener('change', updateOpenUrlButton);
    urlEl.addEventListener('keyup', updateOpenUrlButton);
    urlEl.addEventListener('paste', function () { setTimeout(updateOpenUrlButton, 30); });
    urlEl.addEventListener('keydown', function (e) {
      if (e.key === 'Enter') {
        e.preventDefault();
        var runBtn = document.getElementById('mte-run');
        if (runBtn) runBtn.click();
      }
    });
  }

  var errorMessages = {
    invalid_url: isEs ? 'Ingres\u00E1 una URL v\u00E1lida que empiece con http:// o https://.' : 'Enter a valid URL starting with http:// or https://.',
    blocked_host: isEs ? 'Esa URL no est\u00E1 permitida.' : 'That URL is not allowed.',
    fetch_failed: isEs ? 'No se pudo acceder a esa URL (puede estar ca\u00EDda o bloquear el acceso autom\u00E1tico).' : 'Could not reach that URL (it may be down or blocking automated access).',
    invalid_response: isEs ? 'La respuesta del sitio no pudo leerse.' : 'The site\'s response could not be read.',
    network: isEs ? 'Error de red al consultar la herramienta.' : 'Network error while calling the tool.',
    clipboard_denied: isEs ? 'No se pudo acceder al portapapeles. Revis\u00E1 los permisos del navegador.' : 'Could not access the clipboard. Check your browser permissions.',
    clipboard_empty: isEs ? 'El portapapeles no contiene una URL v\u00E1lida.' : 'The clipboard does not contain a valid URL.',
    clipboard_unsupported: isEs ? 'Tu navegador no permite pegar autom\u00E1ticamente en este contexto. Peg\u00E1 manualmente con Ctrl+V.' : 'Your browser does not support automatic paste in this context. Paste manually with Ctrl+V.'
  };

  // Tab switching logic
  var tabButtons = document.querySelectorAll('.widget-meta-tags-extractor .mte-tab-btn');
  var tabPanes = document.querySelectorAll('.widget-meta-tags-extractor .mte-tab-pane');

  tabButtons.forEach(function (btn) {
    btn.addEventListener('click', function () {
      var targetId = btn.getAttribute('data-tab');
      tabButtons.forEach(function (b) {
        b.classList.remove('active');
        b.setAttribute('aria-selected', 'false');
      });
      tabPanes.forEach(function (p) { p.classList.remove('active'); });

      btn.classList.add('active');
      btn.setAttribute('aria-selected', 'true');
      var targetPane = document.getElementById(targetId);
      if (targetPane) targetPane.classList.add('active');
    });
  });

  function setField(id, value, isImage) {
    var el = document.getElementById(id);
    if (!el) return;
    el.textContent = '';
    if (!value) return;

    if (isImage) {
      el.textContent = value;
      var img = document.createElement('img');
      img.src = value;
      img.alt = '';
      el.appendChild(img);
    } else {
      el.textContent = value;
    }
  }

  function setLengthIndicator(id, value, minOpt, maxOpt) {
    var el = document.getElementById(id);
    if (!el) return;
    el.textContent = '';
    el.className = 'mte-len-indicator';
    if (!value) return;
    var len = value.length;
    var text = len + ' ' + (isEs ? 'caracteres' : 'characters');
    if (minOpt && maxOpt) {
      if (len >= minOpt && len <= maxOpt) {
        text += ' - ' + (isEs ? 'Longitud \u00F3ptima (' + minOpt + '-' + maxOpt + ')' : 'Optimal length (' + minOpt + '-' + maxOpt + ')');
        el.classList.add('is-good');
      } else if (len < minOpt) {
        text += ' - ' + (isEs ? 'Algo corto (recomendado ' + minOpt + '-' + maxOpt + ')' : 'Slightly short (recommended ' + minOpt + '-' + maxOpt + ')');
        el.classList.add('is-warn');
      } else {
        text += ' - ' + (isEs ? 'Extenso, podr\u00EDa truncarse en Google (recomendado ' + minOpt + '-' + maxOpt + ')' : 'Long, may be truncated in search results');
        el.classList.add('is-warn');
      }
    }
    el.textContent = text;
  }

  function normalizeUrlForCompare(u) {
    if (!u) return '';
    var s = String(u).trim();
    s = s.replace(/^https?:\/\//i, '');
    s = s.replace(/^www\./i, '');
    s = s.split('#')[0];
    s = s.replace(/\/$/, '');
    return s.toLowerCase();
  }

  function resolveAgainst(value, base) {
    try {
      return new URL(value, base).href;
    } catch (e) {
      return value;
    }
  }

  function setCanonicalField(value, queriedUrl) {
    var el = document.getElementById('mte-canonical');
    var row = el ? el.closest('tr') : null;
    if (!el) return;
    el.textContent = '';
    el.classList.remove('mte-mismatch', 'mte-missing');
    if (row) row.classList.remove('mte-mismatch-row', 'mte-missing-row');

    if (!value) {
      el.classList.add('mte-missing');
      if (row) row.classList.add('mte-missing-row');
      var missingNote = document.createElement('div');
      missingNote.className = 'mte-missing-note';
      missingNote.innerHTML = '<i class="fas fa-exclamation-circle"></i> ' + (isEs ? 'No se encontr\u00F3 la etiqueta canonical (recomendado para SEO).' : 'No canonical tag found (recommended for SEO).');
      el.appendChild(missingNote);
      return;
    }

    var textNode = document.createElement('span');
    textNode.textContent = value;
    el.appendChild(textNode);

    var resolvedCanonical = resolveAgainst(value, queriedUrl);
    var mismatch = normalizeUrlForCompare(resolvedCanonical) !== normalizeUrlForCompare(queriedUrl);
    if (mismatch) {
      el.classList.add('mte-mismatch');
      if (row) row.classList.add('mte-mismatch-row');
      var note = document.createElement('div');
      note.className = 'mte-mismatch-note';
      note.innerHTML = '<i class="fas fa-exclamation-triangle"></i> ' + (isEs ? 'No coincide con la URL analizada.' : 'Does not match the analyzed URL.');
      el.appendChild(note);
    }
  }

  function renderSocialPreview(d, currentUrl) {
    var previewWrap = document.getElementById('mte-preview-img-wrap');
    var previewImg = document.getElementById('mte-preview-img');
    var hostEl = document.getElementById('mte-preview-host');
    var titleEl = document.getElementById('mte-preview-title');
    var descEl = document.getElementById('mte-preview-desc');

    var imgUrl = d.ogimage || d.twitterimage || '';
    if (imgUrl) {
      previewImg.src = imgUrl;
      previewWrap.style.display = 'flex';
    } else {
      previewWrap.style.display = 'none';
    }

    var hostname = '';
    try {
      hostname = new URL(currentUrl).hostname.replace(/^www\./i, '');
    } catch (e) {
      hostname = currentUrl;
    }
    hostEl.textContent = d.ogsitename || hostname || '';
    titleEl.textContent = d.ogtitle || d.twittertitle || d.title || (isEs ? 'Sin t\u00EDtulo Open Graph' : 'No Open Graph title');
    descEl.textContent = d.ogdescription || d.twitterdescription || d.description || '';
  }

  // Extract nested typed schema entities from parsed JSON nodes
  function extractEntitiesFromNode(node, items) {
    if (!node) return;
    if (Array.isArray(node)) {
      node.forEach(function (item) { extractEntitiesFromNode(item, items); });
      return;
    }
    if (typeof node !== 'object') return;

    if (node['@type']) {
      var typeVal = node['@type'];
      var typeStr = Array.isArray(typeVal) ? typeVal.join(', ') : String(typeVal);
      items.push({
        type: typeStr,
        name: typeof node.name === 'string' ? node.name : '',
        url: typeof node.url === 'string' ? node.url : '',
        description: typeof node.description === 'string' ? node.description : '',
        id: typeof node['@id'] === 'string' ? node['@id'] : '',
        data: node,
        raw: node
      });
    }

    Object.keys(node).forEach(function (k) {
      if (typeof node[k] === 'object' && node[k] !== null) {
        extractEntitiesFromNode(node[k], items);
      }
    });
  }

  function getClientParsedSchemaItems(rawBlocks) {
    var items = [];
    if (!Array.isArray(rawBlocks)) return items;
    rawBlocks.forEach(function (raw) {
      try {
        var parsed = JSON.parse(raw);
        extractEntitiesFromNode(parsed, items);
      } catch (e) {}
    });
    return items;
  }

  // Recursive renderer for schema node values
  function renderSchemaNode(node, depth) {
    depth = depth || 0;
    if (node === null || node === undefined) return document.createTextNode('-');
    if (typeof node === 'string') {
      var sTrim = node.trim();
      if (/^https?:\/\/.+\.(webp|png|jpg|jpeg|gif|svg|avif)(\?.*)?$/i.test(sTrim)) {
        var wrap = document.createElement('div');
        wrap.className = 'mte-val-image';
        var img = document.createElement('img');
        img.src = sTrim;
        img.alt = '';
        var link = document.createElement('a');
        link.href = sTrim;
        link.target = '_blank';
        link.rel = 'noopener noreferrer';
        link.textContent = sTrim;
        wrap.appendChild(img);
        wrap.appendChild(link);
        return wrap;
      }
      if (/^https?:\/\//i.test(sTrim)) {
        var a = document.createElement('a');
        a.href = sTrim;
        a.target = '_blank';
        a.rel = 'noopener noreferrer';
        a.textContent = sTrim;
        return a;
      }
      var span = document.createElement('span');
      span.textContent = sTrim;
      return span;
    }
    if (typeof node === 'number' || typeof node === 'boolean') {
      var lit = document.createElement('span');
      lit.textContent = String(node);
      return lit;
    }
    if (Array.isArray(node)) {
      if (!node.length) return document.createTextNode('[]');
      var list = document.createElement('div');
      list.className = 'mte-val-list';
      node.forEach(function (item) {
        var itemEl = document.createElement('div');
        itemEl.className = 'mte-val-list-item';
        itemEl.appendChild(renderSchemaNode(item, depth + 1));
        list.appendChild(itemEl);
      });
      return list;
    }
    if (typeof node === 'object') {
      var table = document.createElement('table');
      table.className = 'mte-nested-table';
      var tbody = document.createElement('tbody');
      var keys = Object.keys(node);
      keys.sort(function (a, b) {
        if (a === '@type') return -1;
        if (b === '@type') return 1;
        if (a === 'name') return -1;
        if (b === 'name') return 1;
        return a.localeCompare(b);
      });
      keys.forEach(function (k) {
        if (k.toLowerCase() === '@context' && depth > 0) return;
        var tr = document.createElement('tr');
        var th = document.createElement('th');
        th.className = 'mte-nested-key';
        th.textContent = k;
        var td = document.createElement('td');
        td.className = 'mte-nested-val';
        td.appendChild(renderSchemaNode(node[k], depth + 1));
        tr.appendChild(th);
        tr.appendChild(td);
        tbody.appendChild(tr);
      });
      table.appendChild(tbody);
      return table;
    }
    return document.createTextNode(String(node));
  }

  function renderSchemaItems(items, url) {
    var container = document.getElementById('mte-schema-items');
    var emptyEl = document.getElementById('mte-schema-empty');
    var badgeEl = document.getElementById('mte-badge-schema');
    var summaryEl = document.getElementById('mte-schema-summary');
    var googleTestLink = document.getElementById('mte-google-test');

    container.innerHTML = '';
    var count = Array.isArray(items) ? items.length : 0;
    badgeEl.textContent = count;

    if (googleTestLink) {
      googleTestLink.href = 'https://search.google.com/test/rich-results?url=' + encodeURIComponent(url);
    }

    if (!count) {
      emptyEl.style.display = 'block';
      summaryEl.textContent = isEs ? '0 entidades detectadas' : '0 entities detected';
      return;
    }
    emptyEl.style.display = 'none';
    summaryEl.textContent = count + ' ' + (count === 1 ? (isEs ? 'entidad detectada' : 'entity detected') : (isEs ? 'entidades detectadas' : 'entities detected'));

    items.forEach(function (item) {
      var card = document.createElement('div');
      card.className = 'mte-schema-card';

      var header = document.createElement('div');
      header.className = 'mte-schema-card-header';

      var titleWrap = document.createElement('div');
      titleWrap.className = 'mte-schema-title-wrap';

      var badge = document.createElement('span');
      badge.className = 'mte-schema-badge';
      badge.innerHTML = '<i class="fas fa-cube"></i> ' + (item.type || 'Schema.org');

      titleWrap.appendChild(badge);

      if (item.name) {
        var entityName = document.createElement('span');
        entityName.className = 'mte-schema-entity-name';
        entityName.textContent = item.name;
        titleWrap.appendChild(entityName);
      }

      var copyBtn = document.createElement('button');
      copyBtn.type = 'button';
      copyBtn.className = 'mte-schema-copy-btn';
      copyBtn.innerHTML = '<i class="far fa-copy"></i> ' + (isEs ? 'Copiar JSON' : 'Copy JSON');
      copyBtn.addEventListener('click', function () {
        var jsonStr = JSON.stringify(item.data || item.raw || item, null, 2);
        navigator.clipboard.writeText(jsonStr).then(function () {
          copyBtn.innerHTML = '<i class="fas fa-check"></i> ' + (isEs ? '\u00A1Copiado!' : 'Copied!');
          setTimeout(function () { copyBtn.innerHTML = '<i class="far fa-copy"></i> ' + (isEs ? 'Copiar JSON' : 'Copy JSON'); }, 2000);
        });
      });

      header.appendChild(titleWrap);
      header.appendChild(copyBtn);
      card.appendChild(header);

      var body = document.createElement('div');
      body.className = 'mte-schema-card-body';
      var dataObj = item.data || item.raw || {
        '@type': item.type,
        'name': item.name,
        'url': item.url,
        'description': item.description,
        '@id': item.id
      };
      body.appendChild(renderSchemaNode(dataObj, 0));
      card.appendChild(body);

      container.appendChild(card);
    });
  }

  function renderRawBlocks(rawBlocks, url) {
    var container = document.getElementById('mte-raw-blocks');
    var emptyEl = document.getElementById('mte-raw-empty');
    var badgeEl = document.getElementById('mte-badge-raw');
    var schemaOrgVal = document.getElementById('mte-schema-org-val');
    var copyAllBtn = document.getElementById('mte-copy-raw-all');

    container.innerHTML = '';
    var count = Array.isArray(rawBlocks) ? rawBlocks.length : 0;
    badgeEl.textContent = count;

    if (schemaOrgVal) {
      schemaOrgVal.href = 'https://validator.schema.org/#url=' + encodeURIComponent(url);
    }

    if (!count) {
      emptyEl.style.display = 'block';
      copyAllBtn.style.display = 'none';
      return;
    }
    emptyEl.style.display = 'none';
    copyAllBtn.style.display = 'inline-flex';

    var allFormatted = [];

    rawBlocks.forEach(function (raw, index) {
      var formatted = '';
      try {
        formatted = JSON.stringify(JSON.parse(raw), null, 2);
      } catch (e) {
        formatted = raw;
      }
      allFormatted.push(formatted);

      var card = document.createElement('div');
      card.className = 'mte-raw-block-card';

      var header = document.createElement('div');
      header.className = 'mte-raw-block-header';
      header.innerHTML = '<span><i class="fas fa-file-code"></i> Block #' + (index + 1) + ' (&lt;script type="application/ld+json"&gt;)</span>';

      var blockCopyBtn = document.createElement('button');
      blockCopyBtn.type = 'button';
      blockCopyBtn.className = 'tool-copy';
      blockCopyBtn.style.margin = '0';
      blockCopyBtn.style.padding = '3px 8px';
      blockCopyBtn.style.fontSize = '0.78rem';
      blockCopyBtn.innerHTML = '<i class="far fa-copy"></i> ' + (isEs ? 'Copiar' : 'Copy');
      blockCopyBtn.addEventListener('click', function () {
        navigator.clipboard.writeText(formatted).then(function () {
          blockCopyBtn.innerHTML = '<i class="fas fa-check"></i> ' + (isEs ? '\u00A1Copiado!' : 'Copied!');
          setTimeout(function () { blockCopyBtn.innerHTML = '<i class="far fa-copy"></i> ' + (isEs ? 'Copiar' : 'Copy'); }, 2000);
        });
      });
      header.appendChild(blockCopyBtn);
      card.appendChild(header);

      var pre = document.createElement('pre');
      pre.className = 'mte-raw-code';
      pre.textContent = formatted;
      card.appendChild(pre);

      container.appendChild(card);
    });

    copyAllBtn.onclick = function () {
      var combined = allFormatted.join('\n\n');
      navigator.clipboard.writeText(combined).then(function () {
        copyAllBtn.innerHTML = '<i class="fas fa-check"></i> ' + (isEs ? '\u00A1Todo copiado!' : 'All copied!');
        setTimeout(function () { copyAllBtn.innerHTML = '<i class="far fa-copy"></i> ' + (isEs ? 'Copiar todo el JSON-LD' : 'Copy all JSON-LD'); }, 2000);
      });
    };
  }

  document.getElementById('mte-run').addEventListener('click', function () {
    var url = urlEl.value.trim();
    if (!url) {
      statusEl.textContent = errorMessages.invalid_url;
      statusEl.className = 'tool-message is-error';
      resultsEl.style.display = 'none';
      return;
    }
    if (!/^https?:\/\//i.test(url)) {
      url = 'https://' + url;
    }

    statusEl.textContent = isEs ? 'Consultando y analizando p\u00E1gina...' : 'Fetching and analyzing page...';
    statusEl.className = 'tool-message';
    resultsEl.style.display = 'none';

    fetch('/tools-api.cfm?method=extractMetaTags&url=' + encodeURIComponent(url))
      .then(function (r) { return r.json(); })
      .then(function (data) {
        if (!data.SUCCESS && !data.success) {
          var code = data.ERROR || data.error || 'fetch_failed';
          statusEl.textContent = errorMessages[code] || errorMessages.fetch_failed;
          statusEl.className = 'tool-message is-error';
          return;
        }
        var d = {};
        Object.keys(data).forEach(function (k) { d[k.toLowerCase()] = data[k]; });

        // Tab 1: Meta Tags
        setField('mte-title', d.title);
        setLengthIndicator('mte-title-len', d.title, 50, 60);
        setField('mte-description', d.description);
        setLengthIndicator('mte-description-len', d.description, 120, 160);
        setField('mte-keywords', d.keywords);
        setCanonicalField(d.canonical, url);
        setField('mte-robots', d.robots);
        setField('mte-viewport', d.viewport);
        setField('mte-author', d.author);

        var langCharset = [];
        if (d.language) langCharset.push((isEs ? 'Idioma: ' : 'Lang: ') + d.language);
        if (d.charset) langCharset.push('Charset: ' + d.charset);
        setField('mte-lang-charset', langCharset.join(' | '));

        // Tab 2: Open Graph & Social
        setField('mte-og-title', d.ogtitle);
        setField('mte-og-description', d.ogdescription);
        setField('mte-og-image', d.ogimage, true);
        setField('mte-og-type', d.ogtype);
        setField('mte-og-url', d.ogurl);
        setField('mte-og-site-name', d.ogsitename);
        setField('mte-og-locale', d.oglocale);
        setField('mte-tw-card', d.twittercard);
        setField('mte-tw-title', d.twittertitle);
        setField('mte-tw-description', d.twitterdescription);
        setField('mte-tw-image', d.twitterimage, true);
        setField('mte-tw-site', d.twittersite);

        renderSocialPreview(d, url);

        // Tab 3: Structured Data (Schema.org)
        var rawBlocks = d.schemarawblocks || [];
        var schemaItems = (Array.isArray(d.schemaitems) && d.schemaitems.length)
          ? d.schemaitems
          : getClientParsedSchemaItems(rawBlocks);

        renderSchemaItems(schemaItems, url);

        // Tab 4: Raw JSON-LD
        renderRawBlocks(rawBlocks, url);

        statusEl.textContent = '';
        resultsEl.style.display = 'block';
      })
      .catch(function () {
        statusEl.textContent = errorMessages.network;
        statusEl.className = 'tool-message is-error';
      });
  });

  function cleanPastedUrl(raw) {
    var text = (raw || '').trim();
    if (!text) return '';
    var md = text.match(/\[[^\]]*\]\((https?:\/\/[^\s)]+)\)/i);
    if (md) return md[1].trim();
    var anchor = text.match(/href\s*=\s*["']([^"']+)["']/i);
    if (anchor) return anchor[1].trim();
    text = text.replace(/^[\s"'\u201C\u201D\u2018\u2019<(\[]+|[\s"'\u201C\u201D\u2018\u2019>)\]]+$/g, '');
    var urlMatch = text.match(/(https?:\/\/[^\s"'<>()]+|www\.[^\s"'<>()]+)/i);
    if (urlMatch) text = urlMatch[0];
    text = text.replace(/[.,;:!?]+$/, '');
    return text.trim();
  }

  var copyUrlBtn = document.getElementById('mte-copy-url');
  if (copyUrlBtn) {
    copyUrlBtn.addEventListener('click', function () {
      var val = (urlEl ? urlEl.value : '').trim();
      if (!val) {
        statusEl.textContent = isEs ? 'No hay ninguna URL para copiar.' : 'No URL to copy.';
        statusEl.className = 'tool-message is-error';
        return;
      }
      navigator.clipboard.writeText(val).then(function () {
        copyUrlBtn.innerHTML = '<i class="fas fa-check"></i> ' + (isEs ? '\u00A1Copiado!' : 'Copied!');
        setTimeout(function () {
          copyUrlBtn.innerHTML = '<i class="far fa-copy"></i> ' + (isEs ? 'Copiar' : 'Copy');
        }, 2000);
      }).catch(function () {
        statusEl.textContent = errorMessages.clipboard_denied;
        statusEl.className = 'tool-message is-error';
      });
    });
  }

  var pasteBtn = document.getElementById('mte-paste');
  if (pasteBtn) {
    pasteBtn.addEventListener('click', function () {
      if (!navigator.clipboard || !navigator.clipboard.readText) {
        statusEl.textContent = errorMessages.clipboard_unsupported;
        statusEl.className = 'tool-message is-error';
        return;
      }
      navigator.clipboard.readText().then(function (text) {
        var cleaned = cleanPastedUrl(text);
        if (!cleaned) {
          statusEl.textContent = errorMessages.clipboard_empty;
          statusEl.className = 'tool-message is-error';
          return;
        }
        urlEl.value = cleaned;
        updateOpenUrlButton();
        urlEl.focus();
        statusEl.textContent = isEs ? 'URL pegada y limpiada desde el portapapeles.' : 'URL pasted and cleaned from the clipboard.';
        statusEl.className = 'tool-message';
      }).catch(function () {
        statusEl.textContent = errorMessages.clipboard_denied;
        statusEl.className = 'tool-message is-error';
      });
    });
  }

  var clearBtn = document.getElementById('mte-clear');
  if (clearBtn) {
    clearBtn.addEventListener('click', function () {
      if (urlEl) {
        urlEl.value = '';
        urlEl.focus();
      }
      updateOpenUrlButton();
      if (statusEl) {
        statusEl.textContent = '';
        statusEl.className = 'tool-message';
      }
      if (resultsEl) {
        resultsEl.style.display = 'none';
      }
    });
  }
}());
</script>
