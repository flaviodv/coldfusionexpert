<link rel="stylesheet" href="/assets/css/vendor/cropper.min.css">
<script src="/assets/js/vendor/cropper.min.js"></script>

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
  <div class="image-url-import">
    <label for="img-url"><cfif local.isEs>O cargá una imagen desde una URL<cfelse>Or load an image from a URL</cfif></label>
    <div class="image-url-import-controls">
      <input type="url" id="img-url" placeholder="https://example.com/image.jpg" autocomplete="url">
      <button type="button" class="btn-social btn-upwork" id="btn-load-url"><i class="fas fa-link"></i> <cfif local.isEs>Cargar URL<cfelse>Load URL</cfif></button>
    </div>
    <p id="img-url-message" class="image-url-message" aria-live="polite"></p>
  </div>

  <div id="img-workspace" class="editor-workspace" style="display:none;">
    <!-- Toolbar Top: Aspect Ratios & Transform -->
    <div class="editor-toolbar">
      <div class="tool-group">
        <span class="tool-group-label"><cfif local.isEs>Proporción:<cfelse>Aspect Ratio:</cfif></span>
        <button type="button" class="aspect-btn active" data-ratio="free"><cfif local.isEs>Libre<cfelse>Free</cfif></button>
        <button type="button" class="aspect-btn" data-ratio="1">1:1 (Favicon)</button>
        <button type="button" class="aspect-btn" data-ratio="1.7777777777777777">16:9</button>
        <button type="button" class="aspect-btn" data-ratio="1.3333333333333333">4:3</button>
        <button type="button" class="aspect-btn" data-ratio="0.8">4:5</button>
      </div>

      <div class="tool-group">
        <span class="tool-group-label"><cfif local.isEs>Rotar / Voltear:<cfelse>Rotate / Flip:</cfif></span>
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
        <span class="tool-group-label"><cfif local.isEs>Zoom:<cfelse>Zoom:</cfif></span>
        <button type="button" class="btn-social btn-upwork" id="btn-zoom-in" title="Zoom In"><i class="fas fa-search-plus"></i></button>
        <button type="button" class="btn-social btn-upwork" id="btn-zoom-out" title="Zoom Out"><i class="fas fa-search-minus"></i></button>
      </div>

      <div class="tool-group" style="margin-left:auto;">
        <button type="button" class="btn-social btn-linkedin" id="btn-reset">
          <i class="fas fa-sync-alt"></i> <cfif local.isEs>Restablecer<cfelse>Reset</cfif>
        </button>
      </div>
    </div>

    <!-- Toolbar Filters (Brightness, Contrast, Saturation) -->
    <div class="editor-toolbar">
      <div class="tool-group">
        <label for="slider-brightness"><cfif local.isEs>Brillo:<cfelse>Brightness:</cfif></label>
        <input type="range" id="slider-brightness" min="0" max="200" value="100">
        <span id="val-brightness" style="font-size:0.8rem; font-family:monospace; width:45px;">100%</span>
      </div>

      <div class="tool-group">
        <label for="slider-contrast"><cfif local.isEs>Contraste:<cfelse>Contrast:</cfif></label>
        <input type="range" id="slider-contrast" min="0" max="200" value="100">
        <span id="val-contrast" style="font-size:0.8rem; font-family:monospace; width:45px;">100%</span>
      </div>

      <div class="tool-group">
        <label for="slider-saturate"><cfif local.isEs>Saturación:<cfelse>Saturation:</cfif></label>
        <input type="range" id="slider-saturate" min="0" max="200" value="100">
        <span id="val-saturate" style="font-size:0.8rem; font-family:monospace; width:45px;">100%</span>
      </div>
    </div>

    <!-- Main Cropper Canvas Workspace -->
    <div class="cropper-container-wrapper">
      <img id="cropper-target" src="" alt="Editor Image">
    </div>

    <!-- Export & Resize Panel -->
    <div class="export-panel">
      <!-- Resize Controls -->
      <div class="tool-group">
        <span class="tool-group-label"><cfif local.isEs>Dimensiones (Resize):<cfelse>Dimensions (Resize):</cfif></span>
        <input type="number" id="resize-width" min="1" max="10000" style="width:85px;" placeholder="W">
        <span style="color:#64748b; font-weight:bold;">×</span>
        <input type="number" id="resize-height" min="1" max="10000" style="width:85px;" placeholder="H">
        <span style="font-size:0.8rem; color:#64748b;">px</span>
        <button type="button" class="aspect-btn active" id="btn-lock-aspect" title="<cfif local.isEs>Bloquear proporción<cfelse>Lock aspect ratio</cfif>">
          <i class="fas fa-link"></i>
        </button>
      </div>

      <!-- Format Selection -->
      <div class="tool-group">
        <label for="export-format"><cfif local.isEs>Formato:<cfelse>Format:</cfif></label>
        <select id="export-format">
          <option value="image/png">PNG</option>
          <option value="image/jpeg" selected>JPG / JPEG</option>
          <option value="image/webp">WebP</option>
          <option value="image/x-icon">Favicon (.ico)</option>
        </select>
      </div>

      <!-- ICO Size Option (visible when ICO is selected) -->
      <div class="tool-group" id="ico-size-group" style="display:none;">
        <label for="ico-size"><cfif local.isEs>Tamaño Favicon:<cfelse>Favicon Size:</cfif></label>
        <select id="ico-size">
          <option value="16">16 × 16 px</option>
          <option value="32" selected>32 × 32 px (Standard)</option>
          <option value="48">48 × 48 px</option>
          <option value="64">64 × 64 px</option>
          <option value="128">128 × 128 px</option>
          <option value="256">256 × 256 px</option>
        </select>
      </div>

      <!-- Quality Option -->
      <div class="tool-group" id="quality-group">
        <label for="export-quality"><cfif local.isEs>Calidad:<cfelse>Quality:</cfif></label>
        <input type="range" id="export-quality" min="10" max="100" value="90">
        <span id="val-quality" style="font-size:0.8rem; font-family:monospace; width:40px;">90%</span>
      </div>

      <!-- Download Action -->
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
  var imageUrlInput = document.getElementById('img-url');
  var loadUrlButton = document.getElementById('btn-load-url');
  var imageUrlMessage = document.getElementById('img-url-message');
  var workspace = document.getElementById('img-workspace');
  var targetImg = document.getElementById('cropper-target');

  var sliderBrightness = document.getElementById('slider-brightness');
  var sliderContrast = document.getElementById('slider-contrast');
  var sliderSaturate = document.getElementById('slider-saturate');

  var valBrightness = document.getElementById('val-brightness');
  var valContrast = document.getElementById('val-contrast');
  var valSaturate = document.getElementById('val-saturate');

  var resizeWidth = document.getElementById('resize-width');
  var resizeHeight = document.getElementById('resize-height');
  var btnLockAspect = document.getElementById('btn-lock-aspect');

  var exportFormat = document.getElementById('export-format');
  var exportQuality = document.getElementById('export-quality');
  var valQuality = document.getElementById('val-quality');
  var qualityGroup = document.getElementById('quality-group');
  var icoSizeGroup = document.getElementById('ico-size-group');
  var icoSize = document.getElementById('ico-size');

  var btnRotateLeft = document.getElementById('btn-rotate-left');
  var btnRotateRight = document.getElementById('btn-rotate-right');
  var btnFlipH = document.getElementById('btn-flip-h');
  var btnFlipV = document.getElementById('btn-flip-v');
  var btnZoomIn = document.getElementById('btn-zoom-in');
  var btnZoomOut = document.getElementById('btn-zoom-out');
  var btnReset = document.getElementById('btn-reset');
  var btnDownload = document.getElementById('btn-download');

  var cropper = null;
  var scaleX = 1;
  var scaleY = 1;
  var lockAspect = true;
  var isSyncingResize = false;

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

  loadUrlButton.addEventListener('click', function() {
    var imageUrl = imageUrlInput.value.trim();
    if (!/^https?:\/\//i.test(imageUrl)) {
      showUrlMessage('<cfif local.isEs>Ingresá una URL válida que comience con http:// o https://.<cfelse>Enter a valid URL beginning with http:// or https://.</cfif>', true);
      return;
    }
    loadUrlButton.disabled = true;
    showUrlMessage('<cfif local.isEs>Descargando imagen…<cfelse>Downloading image…</cfif>');
    var requestedUrl = new URL(imageUrl, window.location.href);
    // Same-site images do not need the server proxy. This also supports local
    // development hosts, which deliberately resolve to a blocked loopback IP.
    var imageRequest = requestedUrl.origin === window.location.origin
      ? fetch(requestedUrl.href)
      : fetch('/tools-api.cfm?method=importImage&url=' + encodeURIComponent(imageUrl))
          .then(function(response) { return response.json(); })
          .then(function(data) {
            if (!data.success) throw new Error(data.error || 'fetch_failed');
            return fetch(data.imageUrl);
          });
    imageRequest
      .then(function(response) {
        if (!response.ok) throw new Error('fetch_failed');
        return response.blob();
      })
      .then(function(blob) {
        if (!blob.type.match(/^image\//)) throw new Error('not_an_image');
        loadImage(new File([blob], 'remote-image.' + (blob.type.split('/')[1] || 'jpg'), { type: blob.type }));
        showUrlMessage('<cfif local.isEs>Imagen cargada correctamente.<cfelse>Image loaded successfully.</cfif>');
      })
      .catch(function(error) {
        var messages = {
          invalid_url: '<cfif local.isEs>La URL no es válida.<cfelse>The URL is not valid.</cfif>',
          blocked_host: '<cfif local.isEs>No se permite esa dirección.<cfelse>That address is not allowed.</cfif>',
          not_an_image: '<cfif local.isEs>La URL no contiene una imagen compatible.<cfelse>The URL does not contain a supported image.</cfif>',
          file_too_large: '<cfif local.isEs>La imagen supera el límite de 15 MB.<cfelse>The image exceeds the 15 MB limit.</cfif>'
        };
        showUrlMessage(messages[error.message] || '<cfif local.isEs>No se pudo descargar la imagen. Probá con otra URL.<cfelse>The image could not be downloaded. Try another URL.</cfif>', true);
      })
      .finally(function() { loadUrlButton.disabled = false; });
  });

  function showUrlMessage(message, isError) {
    imageUrlMessage.textContent = message;
    imageUrlMessage.className = 'image-url-message' + (isError ? ' is-error' : '');
  }

  function loadImage(file) {
    if (!file.type.match(/^image\//)) return;
    var reader = new FileReader();
    reader.onload = function(e) {
      if (cropper) {
        cropper.destroy();
        cropper = null;
      }

      workspace.style.display = 'flex';

      // Wait for the image to finish decoding AND for the browser to finish
      // laying out the workspace (just made visible above) before Cropper
      // measures the container — otherwise on some viewports (notably mobile)
      // it sizes its canvas against a stale/zero width and the image renders
      // shrunk into part of the crop area, leaving the checkerboard "empty
      // canvas" background visible next to it.
      targetImg.onload = function() {
        requestAnimationFrame(function() {
          initCropper();
        });
      };
      targetImg.src = e.target.result;
    };
    reader.readAsDataURL(file);
  }

  function initCropper() {
    scaleX = 1;
    scaleY = 1;
    resetFilters();

    cropper = new Cropper(targetImg, {
      viewMode: 1,
      autoCropArea: 0.9,
      responsive: true,
      crop: function(e) {
        if (!isSyncingResize) {
          var data = cropper.getData(true);
          resizeWidth.value = data.width;
          resizeHeight.value = data.height;
        }
      }
    });
  }

  function resetFilters() {
    sliderBrightness.value = 100;
    sliderContrast.value = 100;
    sliderSaturate.value = 100;
    valBrightness.textContent = '100%';
    valContrast.textContent = '100%';
    valSaturate.textContent = '100%';
    applyCanvasFilters();
  }

  function applyCanvasFilters() {
    var b = sliderBrightness.value;
    var c = sliderContrast.value;
    var s = sliderSaturate.value;

    valBrightness.textContent = b + '%';
    valContrast.textContent = c + '%';
    valSaturate.textContent = s + '%';

    // Apply CSS filters to cropper canvas container
    var cropperCanvas = workspace.querySelector('.cropper-container');
    if (cropperCanvas) {
      cropperCanvas.style.filter = 'brightness(' + b + '%) contrast(' + c + '%) saturate(' + s + '%)';
    }
  }

  sliderBrightness.addEventListener('input', applyCanvasFilters);
  sliderContrast.addEventListener('input', applyCanvasFilters);
  sliderSaturate.addEventListener('input', applyCanvasFilters);

  // Aspect ratio preset buttons
  document.querySelectorAll('.widget-image-editor .aspect-btn[data-ratio]').forEach(function(btn) {
    btn.addEventListener('click', function() {
      document.querySelectorAll('.widget-image-editor .aspect-btn[data-ratio]').forEach(function(b) { b.classList.remove('active'); });
      this.classList.add('active');

      if (!cropper) return;
      var ratio = this.dataset.ratio;
      if (ratio === 'free') {
        cropper.setAspectRatio(NaN);
      } else {
        cropper.setAspectRatio(parseFloat(ratio));
      }
    });
  });

  // Rotate & Flip & Zoom
  btnRotateLeft.addEventListener('click', function() { if (cropper) cropper.rotate(-90); });
  btnRotateRight.addEventListener('click', function() { if (cropper) cropper.rotate(90); });
  btnFlipH.addEventListener('click', function() { if (cropper) { scaleX = -scaleX; cropper.scaleX(scaleX); } });
  btnFlipV.addEventListener('click', function() { if (cropper) { scaleY = -scaleY; cropper.scaleY(scaleY); } });
  btnZoomIn.addEventListener('click', function() { if (cropper) cropper.zoom(0.1); });
  btnZoomOut.addEventListener('click', function() { if (cropper) cropper.zoom(-0.1); });

  btnReset.addEventListener('click', function() {
    if (cropper) {
      cropper.reset();
      cropper.setAspectRatio(NaN);
      document.querySelectorAll('.widget-image-editor .aspect-btn[data-ratio]').forEach(function(b) { b.classList.remove('active'); });
      var freeBtn = document.querySelector('.widget-image-editor .aspect-btn[data-ratio="free"]');
      if (freeBtn) freeBtn.classList.add('active');
      scaleX = 1; scaleY = 1;
      resetFilters();
    }
  });

  // Resize dimension inputs sync
  btnLockAspect.addEventListener('click', function() {
    lockAspect = !lockAspect;
    this.classList.toggle('active', lockAspect);
  });

  resizeWidth.addEventListener('input', function() {
    if (!cropper || !lockAspect || isSyncingResize) return;
    var w = parseInt(this.value);
    var data = cropper.getData(true);
    if (w > 0 && data.width > 0) {
      var ratio = data.height / data.width;
      isSyncingResize = true;
      resizeHeight.value = Math.round(w * ratio);
      isSyncingResize = false;
    }
  });

  resizeHeight.addEventListener('input', function() {
    if (!cropper || !lockAspect || isSyncingResize) return;
    var h = parseInt(this.value);
    var data = cropper.getData(true);
    if (h > 0 && data.height > 0) {
      var ratio = data.width / data.height;
      isSyncingResize = true;
      resizeWidth.value = Math.round(h * ratio);
      isSyncingResize = false;
    }
  });

  // Format selection
  exportFormat.addEventListener('change', function() {
    var val = this.value;
    if (val === 'image/x-icon') {
      icoSizeGroup.style.display = 'flex';
      qualityGroup.style.display = 'none';
    } else {
      icoSizeGroup.style.display = 'none';
      qualityGroup.style.display = (val === 'image/png') ? 'none' : 'flex';
    }
  });

  exportQuality.addEventListener('input', function() {
    valQuality.textContent = this.value + '%';
  });

  // ICO Favicon Binary Blob Encoder (client-side)
  function canvasToIcoBlob(srcCanvas, size) {
    return new Promise(function(resolve) {
      size = Math.min(256, parseInt(size) || 32);
      var tmpCanvas = document.createElement('canvas');
      tmpCanvas.width = size;
      tmpCanvas.height = size;
      var ctx = tmpCanvas.getContext('2d');
      ctx.drawImage(srcCanvas, 0, 0, size, size);

      tmpCanvas.toBlob(function(pngBlob) {
        var reader = new FileReader();
        reader.onload = function() {
          var pngArray = new Uint8Array(reader.result);
          var pngSize = pngArray.length;

          // ICO Header (6 bytes) + ICONDIRENTRY (16 bytes)
          var header = new Uint8Array(22);
          header[0] = 0; header[1] = 0; // Reserved
          header[2] = 1; header[3] = 0; // Type: ICO
          header[4] = 1; header[5] = 0; // Count: 1

          header[6] = size >= 256 ? 0 : size; // Width
          header[7] = size >= 256 ? 0 : size; // Height
          header[8] = 0;                       // Color count
          header[9] = 0;                       // Reserved
          header[10] = 1; header[11] = 0;      // Color planes
          header[12] = 32; header[13] = 0;     // Bits per pixel

          // Data size LE
          header[14] = pngSize & 0xFF;
          header[15] = (pngSize >> 8) & 0xFF;
          header[16] = (pngSize >> 16) & 0xFF;
          header[17] = (pngSize >> 24) & 0xFF;

          // Offset LE (22)
          header[18] = 22; header[19] = 0; header[20] = 0; header[21] = 0;

          var icoBuffer = new Uint8Array(22 + pngSize);
          icoBuffer.set(header, 0);
          icoBuffer.set(pngArray, 22);

          resolve(new Blob([icoBuffer], { type: 'image/x-icon' }));
        };
        reader.readAsArrayBuffer(pngBlob);
      }, 'image/png');
    });
  }

  // Export Download Trigger
  btnDownload.addEventListener('click', function() {
    if (!cropper) return;

    var reqW = parseInt(resizeWidth.value);
    var reqH = parseInt(resizeHeight.value);

    // 1. Get Cropped Canvas
    var cropOptions = {};
    if (reqW > 0 && reqH > 0) {
      cropOptions.width = reqW;
      cropOptions.height = reqH;
    }

    var croppedCanvas = cropper.getCroppedCanvas(cropOptions);
    if (!croppedCanvas) return;

    // 2. Create final filtered canvas with brightness/contrast/saturation applied
    var finalCanvas = document.createElement('canvas');
    finalCanvas.width = croppedCanvas.width;
    finalCanvas.height = croppedCanvas.height;
    var ctx = finalCanvas.getContext('2d');

    var b = sliderBrightness.value;
    var c = sliderContrast.value;
    var s = sliderSaturate.value;
    ctx.filter = 'brightness(' + b + '%) contrast(' + c + '%) saturate(' + s + '%)';
    ctx.drawImage(croppedCanvas, 0, 0);

    var format = exportFormat.value;
    var quality = parseFloat(exportQuality.value) / 100;

    // 3. Export according to format
    if (format === 'image/x-icon') {
      canvasToIcoBlob(finalCanvas, icoSize.value).then(function(icoBlob) {
        triggerDownload(icoBlob, 'favicon.ico');
      });
    } else {
      var ext = (format === 'image/png') ? 'png' : ((format === 'image/webp') ? 'webp' : 'jpg');
      if (finalCanvas.toBlob) {
        finalCanvas.toBlob(function(blob) {
          triggerDownload(blob, 'edited-image.' + ext);
        }, format, quality);
      } else {
        var dataUrl = finalCanvas.toDataURL(format, quality);
        var a = document.createElement('a');
        a.href = dataUrl;
        a.download = 'edited-image.' + ext;
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
      }
    }
  });

  function triggerDownload(blob, filename) {
    var url = URL.createObjectURL(blob);
    var a = document.createElement('a');
    a.href = url;
    a.download = filename;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
  }
})();
</script>
