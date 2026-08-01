<div class="tool-widget widget-color-converter">
  <div class="converter-card">
    <div class="swatch-main" id="swatch-main" style="background-color: #13aff0;">
      <input type="color" id="native-color-picker" class="swatch-picker-btn" value="#13aff0" title="<cfif local.isEs>Hacé clic para abrir el selector nativo<cfelse>Click to open native color picker</cfif>">
      <span style="font-size:0.75rem; color:#fff; background:rgba(0,0,0,0.4); padding:3px 8px; border-radius:4px; pointer-events:none;">
        <i class="fas fa-eye-dropper"></i> <cfif local.isEs>Cambiar<cfelse>Pick</cfif>
      </span>
    </div>

    <div class="inputs-grid">
      <div class="color-input-row">
        <label for="color-hex">HEX</label>
        <input type="text" id="color-hex" value="#13AFF0" placeholder="#13AFF0" spellcheck="false">
        <button type="button" class="btn-copy-sm" data-copy-val="color-hex"><i class="far fa-copy"></i> <cfif local.isEs>Copiar<cfelse>Copy</cfif></button>
      </div>

      <div class="color-input-row">
        <label for="color-rgb">RGB</label>
        <input type="text" id="color-rgb" value="rgb(19, 175, 240)" placeholder="rgb(19, 175, 240)" spellcheck="false">
        <button type="button" class="btn-copy-sm" data-copy-val="color-rgb"><i class="far fa-copy"></i> <cfif local.isEs>Copiar<cfelse>Copy</cfif></button>
      </div>

      <div class="color-input-row">
        <label for="color-hsl">HSL</label>
        <input type="text" id="color-hsl" value="hsl(198, 86%, 51%)" placeholder="hsl(198, 86%, 51%)" spellcheck="false">
        <button type="button" class="btn-copy-sm" data-copy-val="color-hsl"><i class="far fa-copy"></i> <cfif local.isEs>Copiar<cfelse>Copy</cfif></button>
      </div>
    </div>
  </div>

  <!-- Palette Generator Section -->
  <div class="palette-section">
    <div class="palette-header">
      <h4 style="font-size:1.1rem; font-weight:700; color:#2a2a2a; margin:0;">
        <i class="fas fa-swatchbook" style="color:#13aff0;"></i>
        <cfif local.isEs>Generador de Paletas de Colores<cfelse>Color Palette Generator</cfif>
      </h4>
      <div style="display:flex; gap:10px;">
        <button type="button" class="btn-social btn-upwork" id="btn-gen-tints">
          <cfif local.isEs>Variantes (Tints/Shades)<cfelse>Tints &amp; Shades</cfif>
        </button>
        <label for="img-palette-input" class="btn-social btn-linkedin" style="cursor:pointer; margin:0;">
          <i class="fas fa-image"></i> <cfif local.isEs>Extraer de Imagen<cfelse>Extract from Image</cfif>
        </label>
        <input type="file" id="img-palette-input" accept="image/*" style="display:none;">
      </div>
    </div>

    <p id="palette-subtitle" style="font-size:0.85rem; color:#64748b; margin:0;">
      <cfif local.isEs>Variantes generadas a partir del color base actual:<cfelse>Variants generated from current base color:</cfif>
    </p>

    <div class="palette-grid" id="palette-grid">
      <!-- Generated palette items will appear here -->
    </div>
  </div>
</div>

<script>
(function() {
  var swatchMain = document.getElementById('swatch-main');
  var nativePicker = document.getElementById('native-color-picker');

  var inputHex = document.getElementById('color-hex');
  var inputRgb = document.getElementById('color-rgb');
  var inputHsl = document.getElementById('color-hsl');

  var btnGenTints = document.getElementById('btn-gen-tints');
  var imgPaletteInput = document.getElementById('img-palette-input');
  var paletteGrid = document.getElementById('palette-grid');
  var paletteSubtitle = document.getElementById('palette-subtitle');

  var currentRgb = { r: 19, g: 175, b: 240 };

  // --- Conversion Utilities ---
  function rgbToHex(r, g, b) {
    var toH = function(n) { var h = n.toString(16); return h.length === 1 ? '0' + h : h; };
    return '#' + toH(r) + toH(g) + toH(b);
  }

  function hexToRgb(hex) {
    hex = hex.replace(/^#/, '');
    if (hex.length === 3) {
      hex = hex[0] + hex[0] + hex[1] + hex[1] + hex[2] + hex[2];
    }
    if (hex.length !== 6) return null;
    var num = parseInt(hex, 16);
    return { r: (num >> 16) & 255, g: (num >> 8) & 255, b: num & 255 };
  }

  function rgbToHsl(r, g, b) {
    r /= 255; g /= 255; b /= 255;
    var max = Math.max(r, g, b), min = Math.min(r, g, b);
    var h, s, l = (max + min) / 2;

    if (max === min) {
      h = s = 0;
    } else {
      var d = max - min;
      s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
      switch (max) {
        case r: h = (g - b) / d + (g < b ? 6 : 0); break;
        case g: h = (b - r) / d + 2; break;
        case b: h = (r - g) / d + 4; break;
      }
      h /= 6;
    }
    return {
      h: Math.round(h * 360),
      s: Math.round(s * 100),
      l: Math.round(l * 100)
    };
  }

  function hslToRgb(h, s, l) {
    h /= 360; s /= 100; l /= 100;
    var r, g, b;

    if (s === 0) {
      r = g = b = l;
    } else {
      var hue2rgb = function(p, q, t) {
        if (t < 0) t += 1;
        if (t > 1) t -= 1;
        if (t < 1/6) return p + (q - p) * 6 * t;
        if (t < 1/2) return q;
        if (t < 2/3) return p + (q - p) * (2/3 - t) * 6;
        return p;
      };
      var q = l < 0.5 ? l * (1 + s) : l + s - l * s;
      var p = 2 * l - q;
      r = hue2rgb(p, q, h + 1/3);
      g = hue2rgb(p, q, h);
      b = hue2rgb(p, q, h - 1/3);
    }
    return {
      r: Math.round(r * 255),
      g: Math.round(g * 255),
      b: Math.round(b * 255)
    };
  }

  function parseRgbString(str) {
    var match = str.match(/rgba?$$\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)/i);
    if (!match) return null;
    return { r: parseInt(match[1]), g: parseInt(match[2]), b: parseInt(match[3]) };
  }

  function parseHslString(str) {
    var match = str.match(/hsla?$$\s*(\d+)\s*,\s*(\d+)%?\s*,\s*(\d+)%?/i);
    if (!match) return null;
    return { h: parseInt(match[1]), s: parseInt(match[2]), l: parseInt(match[3]) };
  }

  // --- UI Update Pipeline ---
  function updateFromRgb(rgb, ignoreSource) {
    currentRgb = rgb;
    var hex = rgbToHex(rgb.r, rgb.g, rgb.b).toUpperCase();
    var hsl = rgbToHsl(rgb.r, rgb.g, rgb.b);

    swatchMain.style.backgroundColor = hex;
    nativePicker.value = hex;

    if (ignoreSource !== 'hex') inputHex.value = hex;
    if (ignoreSource !== 'rgb') inputRgb.value = 'rgb(' + rgb.r + ', ' + rgb.g + ', ' + rgb.b + ')';
    if (ignoreSource !== 'hsl') inputHsl.value = 'hsl(' + hsl.h + ', ' + hsl.s + '%, ' + hsl.l + '%)';

    generateTintsAndShades();
  }

  inputHex.addEventListener('input', function() {
    var rgb = hexToRgb(this.value);
    if (rgb) updateFromRgb(rgb, 'hex');
  });

  inputRgb.addEventListener('input', function() {
    var rgb = parseRgbString(this.value);
    if (rgb) updateFromRgb(rgb, 'rgb');
  });

  inputHsl.addEventListener('input', function() {
    var hsl = parseHslString(this.value);
    if (hsl) {
      var rgb = hslToRgb(hsl.h, hsl.s, hsl.l);
      updateFromRgb(rgb, 'hsl');
    }
  });

  nativePicker.addEventListener('input', function() {
    var rgb = hexToRgb(this.value);
    if (rgb) updateFromRgb(rgb, null);
  });

  // Copy Buttons for Inputs
  document.querySelectorAll('[data-copy-val]').forEach(function(btn) {
    btn.addEventListener('click', function() {
      var input = document.getElementById(this.dataset.copyVal);
      if (input) {
        navigator.clipboard.writeText(input.value).then(function() {
          var orig = btn.innerHTML;
          btn.innerHTML = '<i class="fas fa-check"></i>';
          setTimeout(function() { btn.innerHTML = orig; }, 1200);
        });
      }
    });
  });

  // --- Palette Generator: Tints & Shades ---
  function generateTintsAndShades() {
    paletteSubtitle.textContent = '<cfif local.isEs>Variantes (tónos y sombras) del color base:<cfelse>Tints & shades of current base color:</cfif>';
    paletteGrid.innerHTML = '';

    var baseHsl = rgbToHsl(currentRgb.r, currentRgb.g, currentRgb.b);
    var lightnesses = [15, 30, 45, 60, 75, 90];

    lightnesses.forEach(function(l) {
      var rgb = hslToRgb(baseHsl.h, baseHsl.s, l);
      var hex = rgbToHex(rgb.r, rgb.g, rgb.b).toUpperCase();
      addPaletteItem(hex);
    });
  }

  function addPaletteItem(hex) {
    var item = document.createElement('div');
    item.className = 'palette-item';
    item.innerHTML = '<div class="palette-swatch" style="background-color:' + hex + ';"></div>' +
                     '<div class="palette-info">' +
                       '<span class="palette-code">' + hex + '</span>' +
                       '<button type="button" class="btn-copy-sm"><i class="far fa-copy"></i> <cfif local.isEs>Copiar<cfelse>Copy</cfif></button>' +
                     '</div>';

    var btn = item.querySelector('.btn-copy-sm');
    btn.addEventListener('click', function() {
      navigator.clipboard.writeText(hex).then(function() {
        var orig = btn.innerHTML;
        btn.innerHTML = '<i class="fas fa-check"></i>';
        setTimeout(function() { btn.innerHTML = orig; }, 1200);
      });
    });

    paletteGrid.appendChild(item);
  }

  btnGenTints.addEventListener('click', generateTintsAndShades);

  // --- Palette Generator: Image Color Extraction via Canvas ---
  imgPaletteInput.addEventListener('change', function() {
    if (!this.files || !this.files[0]) return;
    var file = this.files[0];
    var reader = new FileReader();

    reader.onload = function(e) {
      var img = new Image();
      img.onload = function() {
        extractColorsFromImage(img);
      };
      img.src = e.target.result;
    };
    reader.readAsDataURL(file);
  });

  function extractColorsFromImage(img) {
    var canvas = document.createElement('canvas');
    var ctx = canvas.getContext('2d');
    canvas.width = 100;
    canvas.height = 100;

    ctx.drawImage(img, 0, 0, 100, 100);
    var imgData = ctx.getImageData(0, 0, 100, 100).data;

    // Quantization / Color Bucket sampling
    var colorCounts = {};
    for (var i = 0; i < imgData.length; i += 16) { // Sample every 4th pixel
      var r = imgData[i];
      var g = imgData[i + 1];
      var b = imgData[i + 2];
      var a = imgData[i + 3];
      if (a < 128) continue; // Skip transparent

      // Quantize to step of 32
      var qr = Math.round(r / 32) * 32;
      var qg = Math.round(g / 32) * 32;
      var qb = Math.round(b / 32) * 32;
      qr = Math.min(255, qr); qg = Math.min(255, qg); qb = Math.min(255, qb);

      var key = qr + ',' + qg + ',' + qb;
      colorCounts[key] = (colorCounts[key] || 0) + 1;
    }

    var sorted = Object.keys(colorCounts).sort(function(a, b) {
      return colorCounts[b] - colorCounts[a];
    }).slice(0, 8);

    paletteSubtitle.textContent = '<cfif local.isEs>Colores principales extraídos de la imagen:<cfelse>Dominant colors extracted from image:</cfif>';
    paletteGrid.innerHTML = '';

    sorted.forEach(function(key) {
      var parts = key.split(',').map(Number);
      var hex = rgbToHex(parts[0], parts[1], parts[2]).toUpperCase();
      addPaletteItem(hex);
    });
  }

  // Init
  generateTintsAndShades();
})();
</script>
