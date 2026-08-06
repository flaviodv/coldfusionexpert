<script src="/assets/js/vendor/qrcode.min.js"></script>
<div class="tool-widget widget-qr-code-generator">
  <label for="qr-text"><cfif local.isEs>Texto o URL a codificar<cfelse>Text or URL to encode</cfif></label>
  <textarea id="qr-text" rows="3" placeholder="https://coldfusionexpert.ar"></textarea>

  <div class="qr-options-grid">
    <div>
      <label for="qr-fg"><cfif local.isEs>Color<cfelse>Foreground color</cfif></label>
      <input id="qr-fg" type="color" value="#000000">
    </div>
    <div>
      <label for="qr-bg"><cfif local.isEs>Fondo<cfelse>Background color</cfif></label>
      <input id="qr-bg" type="color" value="#ffffff">
    </div>
    <div>
      <label for="qr-size"><cfif local.isEs>Tamaño<cfelse>Size</cfif></label>
      <select id="qr-size">
        <option value="200">200x200</option>
        <option value="300" selected>300x300</option>
        <option value="500">500x500</option>
        <option value="800">800x800</option>
      </select>
    </div>
    <div>
      <label for="qr-ec"><cfif local.isEs>Corrección de errores<cfelse>Error correction</cfif></label>
      <select id="qr-ec">
        <option value="L"><cfif local.isEs>Baja (L)<cfelse>Low (L)</cfif></option>
        <option value="M" selected><cfif local.isEs>Media (M)<cfelse>Medium (M)</cfif></option>
        <option value="Q"><cfif local.isEs>Alta (Q)<cfelse>Quartile (Q)</cfif></option>
        <option value="H"><cfif local.isEs>Máxima (H)<cfelse>High (H)</cfif></option>
      </select>
    </div>
  </div>

  <button type="button" class="btn-social btn-upwork" id="qr-generate"><i class="fas fa-qrcode"></i> <cfif local.isEs>Generar código QR<cfelse>Generate QR code</cfif></button>
  <p class="tool-message" id="qr-status" aria-live="polite"></p>

  <div class="qr-preview-wrap" id="qr-preview-wrap" style="display:none;">
    <canvas id="qr-canvas"></canvas>
    <div class="widget-buttons">
      <button type="button" class="btn-social btn-linkedin" id="qr-download-png"><i class="fas fa-download"></i> PNG</button>
      <button type="button" class="btn-social btn-linkedin" id="qr-download-svg"><i class="fas fa-download"></i> SVG</button>
    </div>
  </div>
</div>
<style>
  .qr-options-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 0 15px; }
  @media (max-width: 700px) { .qr-options-grid { grid-template-columns: 1fr 1fr; } }
  .qr-options-grid input[type="color"] { height: 42px; padding: 4px; cursor: pointer; }
  .qr-options-grid select {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    width: 100%;
    height: 42px;
    padding: 0 38px 0 14px;
    border: 1px solid #dfe5e8;
    border-radius: 10px;
    background-color: #fff;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' viewBox='0 0 12 8'%3E%3Cpath d='M1 1l5 5 5-5' fill='none' stroke='%2364748b' stroke-width='1.6' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 16px center;
    background-size: 11px 7px;
    font-size: 0.9rem;
    color: #334155;
    cursor: pointer;
    transition: border-color 0.2s ease, box-shadow 0.2s ease, background-position 0.2s ease;
  }
  .qr-options-grid select:hover {
    border-color: #13aff0;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' viewBox='0 0 12 8'%3E%3Cpath d='M1 1l5 5 5-5' fill='none' stroke='%2313aff0' stroke-width='1.6' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E");
  }
  .qr-options-grid select:focus {
    outline: none;
    border-color: #13aff0;
    box-shadow: 0 0 0 3px rgba(19, 175, 240, 0.15);
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' viewBox='0 0 12 8'%3E%3Cpath d='M1 1l5 5 5-5' fill='none' stroke='%2313aff0' stroke-width='1.6' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E");
  }
  .qr-preview-wrap { margin-top: 20px; text-align: center; }
  #qr-canvas { max-width: 100%; border: 1px solid #dfe5e8; border-radius: 8px; }
</style>
<script>
(function () {
  var isEs = <cfif local.isEs>true<cfelse>false</cfif>;
  qrcode.stringToBytes = qrcode.stringToBytesFuncs['UTF-8'];

  var textEl = document.getElementById('qr-text');
  var fgEl = document.getElementById('qr-fg');
  var bgEl = document.getElementById('qr-bg');
  var sizeEl = document.getElementById('qr-size');
  var ecEl = document.getElementById('qr-ec');
  var statusEl = document.getElementById('qr-status');
  var wrapEl = document.getElementById('qr-preview-wrap');
  var canvas = document.getElementById('qr-canvas');

  var current = null; // { qr, cell, count, fg, bg }

  function drawCanvas(qr, cell, fg, bg) {
    var count = qr.getModuleCount();
    var size = cell * count;
    canvas.width = size;
    canvas.height = size;
    var ctx = canvas.getContext('2d');
    ctx.fillStyle = bg;
    ctx.fillRect(0, 0, size, size);
    ctx.fillStyle = fg;
    for (var r = 0; r < count; r++) {
      for (var c = 0; c < count; c++) {
        if (qr.isDark(r, c)) {
          ctx.fillRect(c * cell, r * cell, cell, cell);
        }
      }
    }
  }

  function buildSvg(qr, cell, fg, bg) {
    var count = qr.getModuleCount();
    var size = cell * count;
    var rects = '';
    for (var r = 0; r < count; r++) {
      for (var c = 0; c < count; c++) {
        if (qr.isDark(r, c)) {
          rects += '<rect x="' + (c * cell) + '" y="' + (r * cell) + '" width="' + cell + '" height="' + cell + '"/>';
        }
      }
    }
    return '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ' + size + ' ' + size + '" width="' + size + '" height="' + size + '">' +
      '<rect width="100%" height="100%" fill="' + bg + '"/><g fill="' + fg + '">' + rects + '</g></svg>';
  }

  function downloadBlob(blob, filename) {
    var url = URL.createObjectURL(blob);
    var a = document.createElement('a');
    a.href = url;
    a.download = filename;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    setTimeout(function () { URL.revokeObjectURL(url); }, 1000);
  }

  document.getElementById('qr-generate').addEventListener('click', function () {
    var text = textEl.value.trim();
    if (!text) {
      statusEl.textContent = isEs ? 'Escribí un texto o URL primero.' : 'Enter some text or a URL first.';
      statusEl.className = 'tool-message is-error';
      wrapEl.style.display = 'none';
      return;
    }
    try {
      var qr = qrcode(0, ecEl.value);
      qr.addData(text);
      qr.make();
      var count = qr.getModuleCount();
      var targetSize = parseInt(sizeEl.value, 10);
      var cell = Math.max(1, Math.floor(targetSize / count));
      var fg = fgEl.value;
      var bg = bgEl.value;
      drawCanvas(qr, cell, fg, bg);
      current = { qr: qr, cell: cell, fg: fg, bg: bg };
      wrapEl.style.display = 'block';
      statusEl.textContent = '';
      statusEl.className = 'tool-message';
    } catch (e) {
      wrapEl.style.display = 'none';
      statusEl.textContent = isEs ? 'No se pudo generar el QR (texto demasiado largo).' : 'Could not generate the QR code (text too long).';
      statusEl.className = 'tool-message is-error';
    }
  });

  document.getElementById('qr-download-png').addEventListener('click', function () {
    if (!canvas.toBlob) return;
    canvas.toBlob(function (blob) {
      downloadBlob(blob, 'qrcode.png');
    }, 'image/png');
  });

  document.getElementById('qr-download-svg').addEventListener('click', function () {
    if (!current) return;
    var svg = buildSvg(current.qr, current.cell, current.fg, current.bg);
    downloadBlob(new Blob([svg], { type: 'image/svg+xml' }), 'qrcode.svg');
  });
}());
</script>
