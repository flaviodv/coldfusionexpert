<div class="tool-widget widget-image-editor">
  <div id="img-dropzone" class="dropzone">
    <i class="fas fa-cloud-upload-alt"></i>
    <p>
      <cfif local.isEs>
        <strong>Arrastrá y soltá una imagen acá</strong> o hacé clic para seleccionar
      <cfelse>
        <strong>Drag &amp; drop an image here</strong> or click to browse
      </cfif>
    </p>
    <input type="file" id="img-input" accept="image/*" style="display:none;">
  </div>

  <div id="img-workspace" class="editor-workspace" style="display:none;">
    <div class="editor-toolbar">
      <div class="tool-group">
        <button type="button" class="btn-social btn-upwork" id="btn-rotate-left" title="<cfif local.isEs>Rotar -90°<cfelse>Rotate -90°</cfif>">
          <i class="fas fa-undo"></i> -90°
        </button>
        <button type="button" class="btn-social btn-upwork" id="btn-rotate-right" title="<cfif local.isEs>Rotar +90°<cfelse>Rotate +90°</cfif>">
          <i class="fas fa-redo"></i> +90°
        </button>
        <button type="button" class="btn-social btn-upwork" id="btn-flip-h" title="<cfif local.isEs>Voltear horizontal<cfelse>Flip Horizontal</cfif>">
          <i class="fas fa-arrows-alt-h"></i>
        </button>
        <button type="button" class="btn-social btn-upwork" id="btn-flip-v" title="<cfif local.isEs>Voltear vertical<cfelse>Flip Vertical</cfif>">
          <i class="fas fa-arrows-alt-v"></i>
        </button>
      </div>

      <div class="tool-group">
        <label for="slider-brightness"><cfif local.isEs>Brillo<cfelse>Brightness</cfif></label>
        <input type="range" id="slider-brightness" min="0" max="200" value="100">
        <span id="val-brightness" style="font-size:0.8rem; font-family:monospace;">100%</span>
      </div>

      <div class="tool-group">
        <label for="slider-contrast"><cfif local.isEs>Contraste<cfelse>Contrast</cfif></label>
        <input type="range" id="slider-contrast" min="0" max="200" value="100">
        <span id="val-contrast" style="font-size:0.8rem; font-family:monospace;">100%</span>
      </div>

      <div class="tool-group">
        <label for="slider-saturate"><cfif local.isEs>Saturación<cfelse>Saturation</cfif></label>
        <input type="range" id="slider-saturate" min="0" max="200" value="100">
        <span id="val-saturate" style="font-size:0.8rem; font-family:monospace;">100%</span>
      </div>

      <div class="tool-group">
        <button type="button" class="btn-social btn-linkedin" id="btn-reset">
          <i class="fas fa-sync-alt"></i> <cfif local.isEs>Restablecer<cfelse>Reset</cfif>
        </button>
      </div>
    </div>

    <div class="canvas-container">
      <canvas id="editor-canvas"></canvas>
    </div>

    <div class="export-panel">
      <div class="tool-group">
        <label for="export-format"><cfif local.isEs>Formato:<cfelse>Format:</cfif></label>
        <select id="export-format">
          <option value="image/png">PNG</option>
          <option value="image/jpeg" selected>JPG / JPEG</option>
          <option value="image/webp">WebP</option>
        </select>
      </div>

      <div class="tool-group" id="quality-group">
        <label for="export-quality"><cfif local.isEs>Calidad:<cfelse>Quality:</cfif></label>
        <input type="range" id="export-quality" min="10" max="100" value="90">
        <span id="val-quality" style="font-size:0.8rem; font-family:monospace;">90%</span>
      </div>

      <div class="tool-group">
        <span id="img-info" style="font-size:0.85rem; color:#64748b; font-weight:600;"></span>
      </div>

      <button type="button" class="btn-social btn-upwork" id="btn-download">
        <i class="fas fa-download"></i> <cfif local.isEs>Descargar Imagen<cfelse>Download Image</cfif>
      </button>
    </div>
  </div>
</div>

<script>
(function() {
  var dropzone = document.getElementById('img-dropzone');
  var fileInput = document.getElementById('img-input');
  var workspace = document.getElementById('img-workspace');
  var canvas = document.getElementById('editor-canvas');
  var ctx = canvas.getContext('2d');

  var sliderBrightness = document.getElementById('slider-brightness');
  var sliderContrast = document.getElementById('slider-contrast');
  var sliderSaturate = document.getElementById('slider-saturate');

  var valBrightness = document.getElementById('val-brightness');
  var valContrast = document.getElementById('val-contrast');
  var valSaturate = document.getElementById('val-saturate');

  var exportFormat = document.getElementById('export-format');
  var exportQuality = document.getElementById('export-quality');
  var valQuality = document.getElementById('val-quality');
  var qualityGroup = document.getElementById('quality-group');

  var btnRotateLeft = document.getElementById('btn-rotate-left');
  var btnRotateRight = document.getElementById('btn-rotate-right');
  var btnFlipH = document.getElementById('btn-flip-h');
  var btnFlipV = document.getElementById('btn-flip-v');
  var btnReset = document.getElementById('btn-reset');
  var btnDownload = document.getElementById('btn-download');
  var imgInfo = document.getElementById('img-info');

  var originalImg = new Image();
  var state = {
    rotation: 0, // 0, 90, 180, 270
    flipH: false,
    flipV: false,
    brightness: 100,
    contrast: 100,
    saturate: 100
  };

  dropzone.addEventListener('click', function() { fileInput.click(); });
  dropzone.addEventListener('dragover', function(e) { e.preventDefault(); dropzone.classList.add('dragover'); });
  dropzone.addEventListener('dragleave', function() { dropzone.classList.remove('dragover'); });
  dropzone.addEventListener('drop', function(e) {
    e.preventDefault();
    dropzone.classList.remove('dragover');
    if (e.dataTransfer.files && e.dataTransfer.files[0]) {
      loadImage(e.dataTransfer.files[0]);
    }
  });

  fileInput.addEventListener('change', function() {
    if (this.files && this.files[0]) {
      loadImage(this.files[0]);
    }
  });

  function loadImage(file) {
    if (!file.type.match(/^image\//)) return;
    var reader = new FileReader();
    reader.onload = function(e) {
      originalImg = new Image();
      originalImg.onload = function() {
        resetState();
        workspace.style.display = 'flex';
        renderCanvas();
      };
      originalImg.src = e.target.result;
    };
    reader.readAsDataURL(file);
  }

  function resetState() {
    state.rotation = 0;
    state.flipH = false;
    state.flipV = false;
    state.brightness = 100;
    state.contrast = 100;
    state.saturate = 100;

    sliderBrightness.value = 100;
    sliderContrast.value = 100;
    sliderSaturate.value = 100;

    valBrightness.textContent = '100%';
    valContrast.textContent = '100%';
    valSaturate.textContent = '100%';
  }

  function renderCanvas() {
    if (!originalImg.src) return;

    var isVertical = (state.rotation % 180 !== 0);
    var targetWidth = isVertical ? originalImg.height : originalImg.width;
    var targetHeight = isVertical ? originalImg.width : originalImg.height;

    canvas.width = targetWidth;
    canvas.height = targetHeight;

    ctx.save();
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    // Apply CSS Filters directly on Canvas context
    ctx.filter = 'brightness(' + state.brightness + '%) contrast(' + state.contrast + '%) saturate(' + state.saturate + '%)';

    // Move to canvas center for transformations
    ctx.translate(canvas.width / 2, canvas.height / 2);
    ctx.rotate((state.rotation * Math.PI) / 180);
    ctx.scale(state.flipH ? -1 : 1, state.flipV ? -1 : 1);

    ctx.drawImage(
      originalImg,
      -originalImg.width / 2,
      -originalImg.height / 2
    );

    ctx.restore();

    imgInfo.textContent = canvas.width + ' × ' + canvas.height + ' px';
  }

  // Event Listeners for Controls
  sliderBrightness.addEventListener('input', function() {
    state.brightness = this.value;
    valBrightness.textContent = this.value + '%';
    renderCanvas();
  });

  sliderContrast.addEventListener('input', function() {
    state.contrast = this.value;
    valContrast.textContent = this.value + '%';
    renderCanvas();
  });

  sliderSaturate.addEventListener('input', function() {
    state.saturate = this.value;
    valSaturate.textContent = this.value + '%';
    renderCanvas();
  });

  btnRotateLeft.addEventListener('click', function() {
    state.rotation = (state.rotation - 90 + 360) % 360;
    renderCanvas();
  });

  btnRotateRight.addEventListener('click', function() {
    state.rotation = (state.rotation + 90) % 360;
    renderCanvas();
  });

  btnFlipH.addEventListener('click', function() {
    state.flipH = !state.flipH;
    renderCanvas();
  });

  btnFlipV.addEventListener('click', function() {
    state.flipV = !state.flipV;
    renderCanvas();
  });

  btnReset.addEventListener('click', function() {
    resetState();
    renderCanvas();
  });

  exportFormat.addEventListener('change', function() {
    qualityGroup.style.display = (this.value === 'image/png') ? 'none' : 'flex';
  });

  exportQuality.addEventListener('input', function() {
    valQuality.textContent = this.value + '%';
  });

  btnDownload.addEventListener('click', function() {
    var mimeType = exportFormat.value;
    var quality = parseFloat(exportQuality.value) / 100;
    var ext = mimeType === 'image/png' ? 'png' : (mimeType === 'image/webp' ? 'webp' : 'jpg');

    if (canvas.toBlob) {
      canvas.toBlob(function(blob) {
        var url = URL.createObjectURL(blob);
        var a = document.createElement('a');
        a.href = url;
        a.download = 'edited-image.' + ext;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        URL.revokeObjectURL(url);
      }, mimeType, quality);
    } else {
      var dataUrl = canvas.toDataURL(mimeType, quality);
      var a = document.createElement('a');
      a.href = dataUrl;
      a.download = 'edited-image.' + ext;
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
    }
  });
})();
</script>
