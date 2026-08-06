<div class="tool-widget widget-meta-tags-extractor">
  <label for="mte-url"><cfif local.isEs>URL a analizar<cfelse>URL to analyze</cfif></label>
  <input id="mte-url" type="text" placeholder="https://ejemplo.com">
  <button type="button" class="btn-social btn-upwork" id="mte-run"><i class="fas fa-search"></i> <cfif local.isEs>Extraer<cfelse>Extract</cfif></button>
  <p class="tool-message" id="mte-status" aria-live="polite"></p>

  <div class="mte-results" id="mte-results" style="display:none;">
    <table>
      <tbody>
        <tr><th><cfif local.isEs>Título<cfelse>Title</cfif></th><td id="mte-title"></td></tr>
        <tr><th><cfif local.isEs>Descripción<cfelse>Description</cfif></th><td id="mte-description"></td></tr>
        <tr><th><cfif local.isEs>Palabras clave<cfelse>Keywords</cfif></th><td id="mte-keywords"></td></tr>
        <tr><th>Canonical</th><td id="mte-canonical"></td></tr>
        <tr><th>og:title</th><td id="mte-og-title"></td></tr>
        <tr><th>og:description</th><td id="mte-og-description"></td></tr>
        <tr><th>og:image</th><td id="mte-og-image"></td></tr>
      </tbody>
    </table>
  </div>
</div>
<style>
  .widget-meta-tags-extractor table { width: 100%; border-collapse: collapse; margin-top: 15px; }
  .widget-meta-tags-extractor th, .widget-meta-tags-extractor td { border-bottom: 1px solid #edf0f2; padding: 10px; text-align: left; vertical-align: top; }
  .widget-meta-tags-extractor th { color: #168fc5; width: 160px; white-space: nowrap; }
  .widget-meta-tags-extractor td:empty::after { content: "-"; color: #b0b8bd; }
  .widget-meta-tags-extractor td img { max-width: 220px; max-height: 120px; display: block; margin-top: 6px; border-radius: 6px; }
</style>
<script>
(function () {
  var isEs = <cfif local.isEs>true<cfelse>false</cfif>;
  var urlEl = document.getElementById('mte-url');
  var statusEl = document.getElementById('mte-status');
  var resultsEl = document.getElementById('mte-results');

  var errorMessages = {
    invalid_url: isEs ? 'Ingresá una URL válida que empiece con http:// o https://.' : 'Enter a valid URL starting with http:// or https://.',
    blocked_host: isEs ? 'Esa URL no está permitida.' : 'That URL is not allowed.',
    fetch_failed: isEs ? 'No se pudo acceder a esa URL (puede estar caída o bloquear el acceso automático).' : 'Could not reach that URL (it may be down or blocking automated access).',
    invalid_response: isEs ? 'La respuesta del sitio no pudo leerse.' : 'The site\'s response could not be read.',
    network: isEs ? 'Error de red al consultar la herramienta.' : 'Network error while calling the tool.'
  };

  function setField(id, value, isImage) {
    var el = document.getElementById(id);
    if (!value) {
      el.textContent = '';
      return;
    }
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

    statusEl.textContent = isEs ? 'Consultando...' : 'Fetching...';
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
        setField('mte-title', d.title);
        setField('mte-description', d.description);
        setField('mte-keywords', d.keywords);
        setField('mte-canonical', d.canonical);
        setField('mte-og-title', d.ogtitle);
        setField('mte-og-description', d.ogdescription);
        setField('mte-og-image', d.ogimage, true);
        statusEl.textContent = '';
        resultsEl.style.display = 'block';
      })
      .catch(function () {
        statusEl.textContent = errorMessages.network;
        statusEl.className = 'tool-message is-error';
      });
  });
}());
</script>
