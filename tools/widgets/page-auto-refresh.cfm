<div class="tool-widget widget-page-auto-refresh">
  <div class="refresh-controls">
    <label for="refresh-url"><cfif local.isEs>URL de la página<cfelse>Page URL</cfif></label>
    <div class="refresh-row">
      <input type="url" id="refresh-url" placeholder="https://example.com" inputmode="url" autocomplete="url">
      <select id="refresh-mode" aria-label="<cfif local.isEs>Destino de la página<cfelse>Page destination</cfif>">
        <option value="iframe"><cfif local.isEs>Vista previa integrada<cfelse>In-page preview</cfif></option>
        <option value="external"><cfif local.isEs>Pestaña externa<cfelse>External tab</cfif></option>
      </select>
      <label class="refresh-interval-label" for="refresh-interval"><cfif local.isEs>Cada<cfelse>Every</cfif></label>
      <input type="number" id="refresh-interval" value="60" min="10" max="3600" step="1">
      <span><cfif local.isEs>segundos<cfelse>seconds</cfif></span>
      <label class="refresh-height-label" for="refresh-height"><cfif local.isEs>Alto<cfelse>Height</cfif></label>
      <input type="number" id="refresh-height" value="620" min="300" max="2000" step="10">
      <span>px</span>
      <button type="button" class="btn-social btn-upwork" id="refresh-load"><i class="fas fa-play"></i> <cfif local.isEs>Iniciar<cfelse>Start</cfif></button>
      <button type="button" class="btn-social btn-upwork refresh-stop" id="refresh-stop" disabled><i class="fas fa-stop"></i> <cfif local.isEs>Detener<cfelse>Stop</cfif></button>
    </div>
    <p class="refresh-status" id="refresh-status" aria-live="polite"><cfif local.isEs>Ingresá una URL para comenzar.<cfelse>Enter a URL to begin.</cfif></p>
  </div>

  <div class="refresh-notice">
    <i class="fas fa-info-circle"></i>
    <span><cfif local.isEs>Elegí “Vista previa integrada” para usarla dentro de esta página, o “Pestaña externa” para abrir y actualizar una única pestaña del navegador. Algunos sitios pueden bloquear la vista previa integrada.<cfelse>Choose “In-page preview” to use it here, or “External tab” to open and refresh one browser tab. Some sites may block the in-page preview.</cfif></span>
  </div>

  <div class="refresh-frame-wrap" id="refresh-frame-wrap" hidden>
    <iframe id="refresh-frame" title="<cfif local.isEs>Vista previa de la página<cfelse>Page preview</cfif>" sandbox="allow-forms allow-scripts allow-same-origin allow-popups"></iframe>
  </div>
</div>

<script>
(function () {
  var urlInput = document.getElementById('refresh-url');
  var intervalInput = document.getElementById('refresh-interval');
  var heightInput = document.getElementById('refresh-height');
  var modeInput = document.getElementById('refresh-mode');
  var loadButton = document.getElementById('refresh-load');
  var stopButton = document.getElementById('refresh-stop');
  var status = document.getElementById('refresh-status');
  var frame = document.getElementById('refresh-frame');
  var frameWrap = document.getElementById('refresh-frame-wrap');
  var refreshTimer = null;
  var activeUrl = '';
  var activeMode = 'iframe';
  var hasLoaded = false;
  var externalWindow = null;
  var externalWindowName = 'coldfusionExpertPageAutoRefresh';

  function setStatus(message, isError) {
    status.textContent = message;
    status.className = 'refresh-status' + (isError ? ' is-error' : '');
  }

  function stopRefresh(message) {
    if (refreshTimer) window.clearInterval(refreshTimer);
    refreshTimer = null;
    loadButton.disabled = false;
    stopButton.disabled = true;
    if (message) setStatus(message);
  }

  function applyFrameHeight() {
    var height = Number(heightInput.value);
    if (!Number.isFinite(height) || height < 300 || height > 2000) return false;
    frameWrap.style.height = height + 'px';
    return true;
  }

  heightInput.addEventListener('change', applyFrameHeight);

  function getExternalWindow() {
    if (!externalWindow || externalWindow.closed) return null;
    return externalWindow;
  }

  function loadExternalWindow() {
    var targetWindow = getExternalWindow();
    if (!targetWindow) {
      setStatus('<cfif local.isEs>La pestaña externa fue cerrada. Presioná Iniciar para abrirla de nuevo.<cfelse>The external tab was closed. Press Start to open it again.</cfif>', true);
      stopRefresh();
      return false;
    }
    try {
      targetWindow.location.href = activeUrl;
      setStatus('<cfif local.isEs>Última actualización de la pestaña externa: <cfelse>Last external-tab refresh: </cfif>' + new Date().toLocaleTimeString());
      return true;
    } catch (error) {
      setStatus('<cfif local.isEs>No se pudo actualizar la pestaña externa.<cfelse>The external tab could not be refreshed.</cfif>', true);
      stopRefresh();
      return false;
    }
  }

  function refreshFrame() {
    if (activeMode === 'external') {
      loadExternalWindow();
      return;
    }
    var sameSite = activeMode === 'iframe' && new URL(activeUrl, window.location.href).origin === window.location.origin;
    if (sameSite && hasLoaded) {
      // Same-origin pages can refresh the page currently displayed after a
      // visitor navigates within the frame.
      frame.contentWindow.location.reload();
    } else {
      // Reassigning src is permitted for cross-origin frames, but can only
      // reload the original address because browsers hide their current URL.
      frame.src = activeUrl;
    }
    hasLoaded = true;
    setStatus('<cfif local.isEs>Última actualización: <cfelse>Last refresh: </cfif>' + new Date().toLocaleTimeString());
  }

  loadButton.addEventListener('click', function () {
    var candidate = urlInput.value.trim();
    var seconds = Number(intervalInput.value);
    var wasActive = !!refreshTimer;
    if (candidate && !/^https?:\/\//i.test(candidate)) {
      candidate = 'https://' + candidate;
      urlInput.value = candidate;
    }
    if (!/^https?:\/\//i.test(candidate)) {
      setStatus('<cfif local.isEs>Ingresá una URL válida que comience con http:// o https://.<cfelse>Enter a valid URL beginning with http:// or https://.</cfif>', true);
      return;
    }
    if (!Number.isFinite(seconds) || seconds < 10 || seconds > 3600) {
      setStatus('<cfif local.isEs>Elegí un intervalo entre 10 y 3600 segundos.<cfelse>Choose an interval between 10 and 3600 seconds.</cfif>', true);
      return;
    }
    if (modeInput.value === 'iframe' && !applyFrameHeight()) {
      setStatus('<cfif local.isEs>Elegí un alto entre 300 y 2000 px.<cfelse>Choose a height between 300 and 2000 px.</cfif>', true);
      return;
    }
    activeUrl = candidate;
    activeMode = modeInput.value;
    hasLoaded = false;
    if (activeMode === 'external') {
      // Open synchronously from this click so browsers do not treat it as a popup.
      externalWindow = window.open(activeUrl, externalWindowName);
      if (!externalWindow) {
        setStatus('<cfif local.isEs>El navegador bloqueó la pestaña externa. Permití las ventanas emergentes e intentá otra vez.<cfelse>Your browser blocked the external tab. Allow pop-ups and try again.</cfif>', true);
        return;
      }
      try { externalWindow.focus(); } catch (error) {}
      frameWrap.hidden = true;
    } else {
      frameWrap.hidden = false;
      frame.setAttribute('sandbox', 'allow-forms allow-scripts allow-same-origin allow-popups');
      refreshFrame();
    }
    if (refreshTimer) window.clearInterval(refreshTimer);
    refreshTimer = window.setInterval(refreshFrame, seconds * 1000);
    stopButton.disabled = false;
    setStatus((wasActive
      ? '<cfif local.isEs>Actualización reiniciada. Nuevo intervalo: <cfelse>Refresh restarted. New interval: </cfif>'
      : '<cfif local.isEs>Actualización automática activa cada <cfelse>Auto-refresh active every </cfif>') + seconds + ' <cfif local.isEs>segundos.<cfelse>seconds.</cfif>');
  });

  stopButton.addEventListener('click', function () {
    stopRefresh('<cfif local.isEs>Actualización automática detenida.<cfelse>Auto-refresh stopped.</cfif>');
  });
}());
</script>
