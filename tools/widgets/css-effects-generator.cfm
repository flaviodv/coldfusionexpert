<div class="tool-widget widget-css-effects-generator">
  <div class="effects-tabs" id="effects-tabs">
    <button type="button" class="tab-btn active" data-tab="tab-box-shadow">
      <i class="fas fa-square-full"></i> <cfif local.isEs>Sombras (Box &amp; Text Shadow)<cfelse>Shadows (Box &amp; Text)</cfif>
    </button>
    <button type="button" class="tab-btn" data-tab="tab-border-radius">
      <i class="fas fa-vector-square"></i> <cfif local.isEs>Bordes Redondeados<cfelse>Border Radius</cfif>
    </button>
    <button type="button" class="tab-btn" data-tab="tab-transitions">
      <i class="fas fa-running"></i> <cfif local.isEs>Transiciones y Animaciones<cfelse>Transitions &amp; Animations</cfif>
    </button>
    <button type="button" class="tab-btn" data-tab="tab-gradients">
      <i class="fas fa-fill-drip"></i> <cfif local.isEs>Degradados (Gradients)<cfelse>Gradients</cfif>
    </button>
  </div>

  <!-- TAB 1: Shadows -->
  <div class="tab-panel active" id="tab-box-shadow">
    <div class="controls-column">
      <div class="control-row">
        <label for="shadow-type"><strong><cfif local.isEs>Tipo de sombra:<cfelse>Shadow type:</cfif></strong></label>
        <select id="shadow-type">
          <option value="box" selected>Box Shadow</option>
          <option value="text">Text Shadow</option>
        </select>
      </div>

      <div class="control-row">
        <label for="shadow-x"><cfif local.isEs>Desplazamiento X:<cfelse>Offset X:</cfif></label>
        <input type="range" id="shadow-x" min="-50" max="50" value="10">
        <span class="val" id="val-shadow-x">10px</span>
      </div>

      <div class="control-row">
        <label for="shadow-y"><cfif local.isEs>Desplazamiento Y:<cfelse>Offset Y:</cfif></label>
        <input type="range" id="shadow-y" min="-50" max="50" value="10">
        <span class="val" id="val-shadow-y">10px</span>
      </div>

      <div class="control-row">
        <label for="shadow-blur"><cfif local.isEs>Desenfoque (Blur):<cfelse>Blur Radius:</cfif></label>
        <input type="range" id="shadow-blur" min="0" max="100" value="20">
        <span class="val" id="val-shadow-blur">20px</span>
      </div>

      <div class="control-row" id="row-shadow-spread">
        <label for="shadow-spread"><cfif local.isEs>Propagación (Spread):<cfelse>Spread Radius:</cfif></label>
        <input type="range" id="shadow-spread" min="-30" max="50" value="0">
        <span class="val" id="val-shadow-spread">0px</span>
      </div>

      <div class="control-row">
        <label for="shadow-color"><cfif local.isEs>Color:<cfelse>Color:</cfif></label>
        <input type="color" id="shadow-color" value="#000000">
        <input type="range" id="shadow-opacity" min="0" max="100" value="30" title="Opacity">
        <span class="val" id="val-shadow-opacity">30%</span>
      </div>

      <div class="control-row" id="row-shadow-inset">
        <label for="shadow-inset"><cfif local.isEs>Sombra interior (Inset):<cfelse>Inset shadow:</cfif></label>
        <input type="checkbox" id="shadow-inset">
      </div>
    </div>

    <div class="preview-column">
      <div class="preview-stage">
        <div class="preview-box" id="preview-box-shadow">
          <span id="shadow-text-preview"><cfif local.isEs>Previsualización<cfelse>Preview Box</cfif></span>
        </div>
      </div>
      <div class="code-block">
        <pre><code id="code-shadow">box-shadow: 10px 10px 20px 0px rgba(0, 0, 0, 0.3);</code></pre>
        <button type="button" class="btn-copy-code" data-copy="code-shadow"><i class="far fa-copy"></i> <cfif local.isEs>Copiar<cfelse>Copy</cfif></button>
      </div>
    </div>
  </div>

  <!-- TAB 2: Border Radius -->
  <div class="tab-panel" id="tab-border-radius">
    <div class="controls-column">
      <div class="control-row">
        <label for="radius-all"><strong><cfif local.isEs>Borde unificado:<cfelse>All Corners:</cfif></strong></label>
        <input type="range" id="radius-all" min="0" max="100" value="20">
        <span class="val" id="val-radius-all">20px</span>
      </div>

      <hr style="border:0; border-top:1px solid #e2e8f0; margin:5px 0;">

      <div class="control-row">
        <label for="radius-tl"><cfif local.isEs>Superior Izquierdo:<cfelse>Top Left:</cfif></label>
        <input type="range" id="radius-tl" min="0" max="100" value="20">
        <span class="val" id="val-radius-tl">20px</span>
      </div>

      <div class="control-row">
        <label for="radius-tr"><cfif local.isEs>Superior Derecho:<cfelse>Top Right:</cfif></label>
        <input type="range" id="radius-tr" min="0" max="100" value="20">
        <span class="val" id="val-radius-tr">20px</span>
      </div>

      <div class="control-row">
        <label for="radius-br"><cfif local.isEs>Inferior Derecho:<cfelse>Bottom Right:</cfif></label>
        <input type="range" id="radius-br" min="0" max="100" value="20">
        <span class="val" id="val-radius-br">20px</span>
      </div>

      <div class="control-row">
        <label for="radius-bl"><cfif local.isEs>Inferior Izquierdo:<cfelse>Bottom Left:</cfif></label>
        <input type="range" id="radius-bl" min="0" max="100" value="20">
        <span class="val" id="val-radius-bl">20px</span>
      </div>
    </div>

    <div class="preview-column">
      <div class="preview-stage">
        <div class="preview-box" id="preview-box-radius">
          <span><cfif local.isEs>Borde<cfelse>Border</cfif></span>
        </div>
      </div>
      <div class="code-block">
        <pre><code id="code-radius">border-radius: 20px;</code></pre>
        <button type="button" class="btn-copy-code" data-copy="code-radius"><i class="far fa-copy"></i> <cfif local.isEs>Copiar<cfelse>Copy</cfif></button>
      </div>
    </div>
  </div>

  <!-- TAB 3: Transitions & Animations -->
  <div class="tab-panel" id="tab-transitions">
    <div class="controls-column">
      <div class="control-row">
        <label for="trans-prop"><cfif local.isEs>Propiedad:<cfelse>Property:</cfif></label>
        <select id="trans-prop">
          <option value="all">all</option>
          <option value="transform">transform</option>
          <option value="opacity">opacity</option>
          <option value="background-color">background-color</option>
          <option value="border-radius">border-radius</option>
        </select>
      </div>

      <div class="control-row">
        <label for="trans-duration"><cfif local.isEs>Duración:<cfelse>Duration:</cfif></label>
        <input type="range" id="trans-duration" min="0.1" max="3" step="0.1" value="0.4">
        <span class="val" id="val-trans-duration">0.4s</span>
      </div>

      <div class="control-row">
        <label for="trans-easing"><cfif local.isEs>Función de tiempo (Easing):<cfelse>Timing Function:</cfif></label>
        <select id="trans-easing">
          <option value="ease">ease</option>
          <option value="linear">linear</option>
          <option value="ease-in">ease-in</option>
          <option value="ease-out">ease-out</option>
          <option value="ease-in-out">ease-in-out</option>
          <option value="cubic-bezier(0.68, -0.55, 0.27, 1.55)">cubic-bezier bounce</option>
        </select>
      </div>

      <div class="control-row">
        <label for="trans-delay"><cfif local.isEs>Retardo (Delay):<cfelse>Delay:</cfif></label>
        <input type="range" id="trans-delay" min="0" max="2" step="0.1" value="0">
        <span class="val" id="val-trans-delay">0s</span>
      </div>

      <div class="control-row">
        <label><strong><cfif local.isEs>Efecto en Hover:<cfelse>Hover Effect:</cfif></strong></label>
        <select id="trans-hover-effect">
          <option value="scale"><cfif local.isEs>Escalar (Scale)<cfelse>Scale</cfif></option>
          <option value="rotate"><cfif local.isEs>Rotar (Rotate)<cfelse>Rotate</cfif></option>
          <option value="color"><cfif local.isEs>Cambiar color<cfelse>Change Color</cfif></option>
          <option value="fade"><cfif local.isEs>Transparencia (Fade)<cfelse>Fade</cfif></option>
        </select>
      </div>

      <div class="control-row" style="margin-top:10px;">
        <button type="button" class="btn-social btn-upwork" id="btn-play-transition" style="width:100%; justify-content:center; padding:10px 16px; font-weight:700;">
          <i class="fas fa-play"></i> <span><cfif local.isEs>Reproducir Animación<cfelse>Play Animation</cfif></span>
        </button>
      </div>
    </div>

    <div class="preview-column">
      <div class="preview-stage" style="position:relative;">
        <div class="preview-box" id="preview-box-trans">
          <span><cfif local.isEs>¡Pasa el mouse!<cfelse>Hover Me!</cfif></span>
        </div>
        <button type="button" class="btn-preview-play" id="btn-preview-play-trans" title="<cfif local.isEs>Reproducir Transición<cfelse>Play Transition</cfif>">
          <i class="fas fa-play"></i>
        </button>
      </div>
      <div class="code-block">
        <pre><code id="code-trans">transition: all 0.4s ease 0s;</code></pre>
        <button type="button" class="btn-copy-code" data-copy="code-trans"><i class="far fa-copy"></i> <cfif local.isEs>Copiar<cfelse>Copy</cfif></button>
      </div>
    </div>
  </div>

  <!-- TAB 4: Gradients -->
  <div class="tab-panel" id="tab-gradients">
    <div class="controls-column">
      <div class="control-row">
        <label for="grad-type"><cfif local.isEs>Tipo de Degradado:<cfelse>Gradient Type:</cfif></label>
        <select id="grad-type">
          <option value="linear" selected>Linear Gradient</option>
          <option value="radial">Radial Gradient</option>
        </select>
      </div>

      <div class="control-row" id="row-grad-angle">
        <label for="grad-angle"><cfif local.isEs>Ángulo:<cfelse>Angle:</cfif></label>
        <input type="range" id="grad-angle" min="0" max="360" value="90">
        <span class="val" id="val-grad-angle">90°</span>
      </div>

      <div class="control-row">
        <label for="grad-color1"><cfif local.isEs>Color inicial (Stop 1):<cfelse>Color 1 (Start):</cfif></label>
        <input type="color" id="grad-color1" value="#13aff0">
        <input type="range" id="grad-pos1" min="0" max="100" value="0">
        <span class="val" id="val-grad-pos1">0%</span>
      </div>

      <div class="control-row">
        <label for="grad-color2"><cfif local.isEs>Color final (Stop 2):<cfelse>Color 2 (End):</cfif></label>
        <input type="color" id="grad-color2" value="#4b8ef1">
        <input type="range" id="grad-pos2" min="0" max="100" value="100">
        <span class="val" id="val-grad-pos2">100%</span>
      </div>
    </div>

    <div class="preview-column">
      <div class="preview-stage">
        <div class="preview-box" id="preview-box-grad" style="width:100%; height:180px; border-radius:12px;">
          <span><cfif local.isEs>Degradado en vivo<cfelse>Live Gradient</cfif></span>
        </div>
      </div>
      <div class="code-block">
        <pre><code id="code-grad">background: linear-gradient(90deg, #13aff0 0%, #4b8ef1 100%);</code></pre>
        <button type="button" class="btn-copy-code" data-copy="code-grad"><i class="far fa-copy"></i> <cfif local.isEs>Copiar<cfelse>Copy</cfif></button>
      </div>
    </div>
  </div>
</div>

<script>
(function() {
  // Tabs Navigation
  var tabBtns = document.querySelectorAll('.widget-css-effects-generator .tab-btn');
  var tabPanels = document.querySelectorAll('.widget-css-effects-generator .tab-panel');

  tabBtns.forEach(function(btn) {
    btn.addEventListener('click', function() {
      var targetId = this.dataset.tab;
      tabBtns.forEach(function(b) { b.classList.remove('active'); });
      tabPanels.forEach(function(p) { p.classList.remove('active'); });
      this.classList.add('active');
      document.getElementById(targetId).classList.add('active');
    });
  });

  // Copy buttons
  document.querySelectorAll('.btn-copy-code').forEach(function(btn) {
    btn.addEventListener('click', function() {
      var codeElem = document.getElementById(this.dataset.copy);
      if (codeElem) {
        navigator.clipboard.writeText(codeElem.textContent).then(function() {
          var orig = btn.innerHTML;
          btn.innerHTML = '<i class="fas fa-check"></i> <cfif local.isEs>¡Copiado!<cfelse>Copied!</cfif>';
          setTimeout(function() { btn.innerHTML = orig; }, 1500);
        });
      }
    });
  });

  // --- 1. SHADOWS LOGIC ---
  var shadowType = document.getElementById('shadow-type');
  var shadowX = document.getElementById('shadow-x');
  var shadowY = document.getElementById('shadow-y');
  var shadowBlur = document.getElementById('shadow-blur');
  var shadowSpread = document.getElementById('shadow-spread');
  var shadowColor = document.getElementById('shadow-color');
  var shadowOpacity = document.getElementById('shadow-opacity');
  var shadowInset = document.getElementById('shadow-inset');

  var rowSpread = document.getElementById('row-shadow-spread');
  var rowInset = document.getElementById('row-shadow-inset');
  var boxPreview = document.getElementById('preview-box-shadow');
  var shadowTextPreview = document.getElementById('shadow-text-preview');
  var codeShadow = document.getElementById('code-shadow');

  function hexToRgba(hex, alphaPercent) {
    hex = hex.replace('#', '');
    var r = parseInt(hex.substring(0, 2), 16);
    var g = parseInt(hex.substring(2, 4), 16);
    var b = parseInt(hex.substring(4, 6), 16);
    var a = (alphaPercent / 100).toFixed(2);
    return 'rgba(' + r + ', ' + g + ', ' + b + ', ' + a + ')';
  }

  function updateShadow() {
    var type = shadowType.value;
    var x = shadowX.value + 'px';
    var y = shadowY.value + 'px';
    var blur = shadowBlur.value + 'px';
    var spread = shadowSpread.value + 'px';
    var colorRgba = hexToRgba(shadowColor.value, shadowOpacity.value);
    var inset = shadowInset.checked ? ' inset' : '';

    document.getElementById('val-shadow-x').textContent = x;
    document.getElementById('val-shadow-y').textContent = y;
    document.getElementById('val-shadow-blur').textContent = blur;
    document.getElementById('val-shadow-spread').textContent = spread;
    document.getElementById('val-shadow-opacity').textContent = shadowOpacity.value + '%';

    if (type === 'box') {
      rowSpread.style.display = 'flex';
      rowInset.style.display = 'flex';
      boxPreview.style.textShadow = 'none';
      boxPreview.style.boxShadow = x + ' ' + y + ' ' + blur + ' ' + spread + ' ' + colorRgba + inset;
      codeShadow.textContent = 'box-shadow: ' + x + ' ' + y + ' ' + blur + ' ' + spread + ' ' + colorRgba + inset + ';';
    } else {
      rowSpread.style.display = 'none';
      rowInset.style.display = 'none';
      boxPreview.style.boxShadow = 'none';
      boxPreview.style.textShadow = x + ' ' + y + ' ' + blur + ' ' + colorRgba;
      codeShadow.textContent = 'text-shadow: ' + x + ' ' + y + ' ' + blur + ' ' + colorRgba + ';';
    }
  }

  [shadowType, shadowX, shadowY, shadowBlur, shadowSpread, shadowColor, shadowOpacity, shadowInset].forEach(function(el) {
    el.addEventListener('input', updateShadow);
    el.addEventListener('change', updateShadow);
  });
  updateShadow();

  // --- 2. BORDER RADIUS LOGIC ---
  var radiusAll = document.getElementById('radius-all');
  var radiusTl = document.getElementById('radius-tl');
  var radiusTr = document.getElementById('radius-tr');
  var radiusBr = document.getElementById('radius-br');
  var radiusBl = document.getElementById('radius-bl');
  var boxRadius = document.getElementById('preview-box-radius');
  var codeRadius = document.getElementById('code-radius');

  function updateRadius(source) {
    if (source === 'all') {
      var val = radiusAll.value;
      radiusTl.value = val;
      radiusTr.value = val;
      radiusBr.value = val;
      radiusBl.value = val;
    }

    var tl = radiusTl.value + 'px';
    var tr = radiusTr.value + 'px';
    var br = radiusBr.value + 'px';
    var bl = radiusBl.value + 'px';

    document.getElementById('val-radius-all').textContent = radiusAll.value + 'px';
    document.getElementById('val-radius-tl').textContent = tl;
    document.getElementById('val-radius-tr').textContent = tr;
    document.getElementById('val-radius-br').textContent = br;
    document.getElementById('val-radius-bl').textContent = bl;

    if (tl === tr && tr === br && br === bl) {
      boxRadius.style.borderRadius = tl;
      codeRadius.textContent = 'border-radius: ' + tl + ';';
    } else {
      var cssVal = tl + ' ' + tr + ' ' + br + ' ' + bl;
      boxRadius.style.borderRadius = cssVal;
      codeRadius.textContent = 'border-radius: ' + cssVal + ';';
    }
  }

  radiusAll.addEventListener('input', function() { updateRadius('all'); });
  [radiusTl, radiusTr, radiusBr, radiusBl].forEach(function(el) {
    el.addEventListener('input', function() { updateRadius('individual'); });
  });
  updateRadius('all');

  // --- 3. TRANSITIONS LOGIC ---
  var transProp = document.getElementById('trans-prop');
  var transDuration = document.getElementById('trans-duration');
  var transEasing = document.getElementById('trans-easing');
  var transDelay = document.getElementById('trans-delay');
  var transHoverEffect = document.getElementById('trans-hover-effect');
  var boxTrans = document.getElementById('preview-box-trans');
  var codeTrans = document.getElementById('code-trans');

  function updateTransition() {
    var prop = transProp.value;
    var dur = transDuration.value + 's';
    var eas = transEasing.value;
    var del = transDelay.value + 's';

    document.getElementById('val-trans-duration').textContent = dur;
    document.getElementById('val-trans-delay').textContent = del;

    var transStr = prop + ' ' + dur + ' ' + eas + ' ' + del;
    boxTrans.style.transition = transStr;
    codeTrans.textContent = 'transition: ' + transStr + ';';
  }

  // Hover effect styles for preview box
  function applyHoverEffect() {
    var effect = transHoverEffect.value;
    if (effect === 'scale') boxTrans.style.transform = 'scale(1.2)';
    else if (effect === 'rotate') boxTrans.style.transform = 'rotate(15deg) scale(1.1)';
    else if (effect === 'color') boxTrans.style.backgroundColor = '#4b8ef1';
    else if (effect === 'fade') boxTrans.style.opacity = '0.3';
  }

  function resetHoverEffect() {
    boxTrans.style.transform = 'none';
    boxTrans.style.backgroundColor = '#13aff0';
    boxTrans.style.opacity = '1';
  }

  boxTrans.addEventListener('mouseenter', applyHoverEffect);
  boxTrans.addEventListener('mouseleave', resetHoverEffect);

  function triggerTransitionAnimation() {
    var durMs = (parseFloat(transDuration.value) || 0.4) * 1000;
    var delMs = (parseFloat(transDelay.value) || 0) * 1000;

    resetHoverEffect();

    setTimeout(function() {
      applyHoverEffect();
      setTimeout(function() {
        resetHoverEffect();
      }, durMs + 100);
    }, delMs + 50);
  }

  var btnPlayTrans1 = document.getElementById('btn-play-transition');
  var btnPlayTrans2 = document.getElementById('btn-preview-play-trans');

  if (btnPlayTrans1) btnPlayTrans1.addEventListener('click', triggerTransitionAnimation);
  if (btnPlayTrans2) btnPlayTrans2.addEventListener('click', triggerTransitionAnimation);

  [transProp, transDuration, transEasing, transDelay, transHoverEffect].forEach(function(el) {
    el.addEventListener('input', updateTransition);
    el.addEventListener('change', updateTransition);
  });
  updateTransition();

  // --- 4. GRADIENTS LOGIC ---
  var gradType = document.getElementById('grad-type');
  var gradAngle = document.getElementById('grad-angle');
  var gradColor1 = document.getElementById('grad-color1');
  var gradPos1 = document.getElementById('grad-pos1');
  var gradColor2 = document.getElementById('grad-color2');
  var gradPos2 = document.getElementById('grad-pos2');

  var rowAngle = document.getElementById('row-grad-angle');
  var boxGrad = document.getElementById('preview-box-grad');
  var codeGrad = document.getElementById('code-grad');

  function updateGradient() {
    var type = gradType.value;
    var angle = gradAngle.value + 'deg';
    var c1 = gradColor1.value;
    var p1 = gradPos1.value + '%';
    var c2 = gradColor2.value;
    var p2 = gradPos2.value + '%';

    document.getElementById('val-grad-angle').textContent = angle;
    document.getElementById('val-grad-pos1').textContent = p1;
    document.getElementById('val-grad-pos2').textContent = p2;

    var gradCss = '';
    if (type === 'linear') {
      rowAngle.style.display = 'flex';
      gradCss = 'linear-gradient(' + angle + ', ' + c1 + ' ' + p1 + ', ' + c2 + ' ' + p2 + ')';
    } else {
      rowAngle.style.display = 'none';
      gradCss = 'radial-gradient(circle, ' + c1 + ' ' + p1 + ', ' + c2 + ' ' + p2 + ')';
    }

    boxGrad.style.background = gradCss;
    codeGrad.textContent = 'background: ' + gradCss + ';';
  }

  [gradType, gradAngle, gradColor1, gradPos1, gradColor2, gradPos2].forEach(function(el) {
    el.addEventListener('input', updateGradient);
    el.addEventListener('change', updateGradient);
  });
  updateGradient();
})();
</script>
