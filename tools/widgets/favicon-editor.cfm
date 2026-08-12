<style>
.fe-app *, .fe-app *::before, .fe-app *::after { box-sizing: border-box; margin: 0; padding: 0; }
.fe-app {
  --fe-bg: #1a1a2e; --fe-panel: #16213e; --fe-card: #0f3460; --fe-accent: #e94560;
  --fe-text: #eaeaea; --fe-muted: #8892a4; --fe-border: #2a3a5c; --fe-hover: #1e3a5f;
  font-family: 'Segoe UI', system-ui, sans-serif;
  background: var(--fe-bg); color: var(--fe-text);
  height: calc(100vh - 280px); min-height: 500px;
  display: flex; flex-direction: column; overflow: hidden; user-select: none;
  border-radius: 8px; margin-top: 16px;
}
.fe-header { background: var(--fe-panel); border-bottom: 1px solid var(--fe-border); padding: 10px 20px; display: flex; align-items: center; gap: 16px; flex-shrink: 0; }
.fe-header h2 { font-size: 14px; font-weight: 700; color: var(--fe-accent); letter-spacing: 1px; text-transform: uppercase; margin: 0; }
.fe-header span { color: var(--fe-muted); font-size: 12px; }
.fe-app .workspace { display: flex; flex: 1; overflow: hidden; }
.fe-app .sidebar-left { width: 64px; background: var(--fe-panel); border-right: 1px solid var(--fe-border); display: flex; flex-direction: column; align-items: center; padding: 12px 0; gap: 4px; flex-shrink: 0; }
.fe-app .tool-btn { width: 44px; height: 44px; border: none; background: transparent; color: var(--fe-muted); cursor: pointer; border-radius: 8px; display: flex; align-items: center; justify-content: center; font-size: 20px; transition: background 0.15s, color 0.15s; position: relative; }
.fe-app .tool-btn:hover { background: var(--fe-hover); color: var(--fe-text); }
.fe-app .tool-btn.active { background: var(--fe-accent); color: #fff; }
.fe-app .tool-sep { width: 32px; height: 1px; background: var(--fe-border); margin: 6px 0; }
.fe-app .color-pair { position: relative; width: 44px; height: 44px; margin-top: 6px; }
.fe-app .color-bg-swatch { position: absolute; bottom: 2px; right: 2px; width: 26px; height: 26px; border: 2px solid var(--fe-border); border-radius: 4px; cursor: pointer; background: #fff; }
.fe-app .color-fg-swatch { position: absolute; top: 2px; left: 2px; width: 26px; height: 26px; border: 2px solid #fff; border-radius: 4px; cursor: pointer; background: #000; z-index: 1; }
.fe-app .swap-btn { position: absolute; top: 0; right: 0; width: 16px; height: 16px; background: var(--fe-panel); border: 1px solid var(--fe-border); border-radius: 50%; cursor: pointer; font-size: 9px; color: var(--fe-muted); display: flex; align-items: center; justify-content: center; z-index: 2; }
.fe-app .swap-btn:hover { color: var(--fe-accent); }
.fe-app .canvas-area { flex: 1; display: flex; align-items: center; justify-content: center; background: var(--fe-bg); overflow: auto; position: relative; }
.fe-app #pixelCanvas { image-rendering: pixelated; cursor: crosshair; box-shadow: 0 0 0 1px var(--fe-border), 0 8px 40px rgba(0,0,0,0.6); }
.fe-app .sidebar-right { width: 220px; background: var(--fe-panel); border-left: 1px solid var(--fe-border); display: flex; flex-direction: column; overflow-y: auto; flex-shrink: 0; }
.fe-app .panel-section { padding: 12px 14px; border-bottom: 1px solid var(--fe-border); }
.fe-app .panel-label { font-size: 10px; font-weight: 700; letter-spacing: 1.5px; text-transform: uppercase; color: var(--fe-muted); margin-bottom: 10px; }
.fe-app .size-btns { display: flex; gap: 6px; }
.fe-app .size-btn { flex: 1; padding: 6px 0; background: var(--fe-card); border: 1px solid var(--fe-border); color: var(--fe-muted); border-radius: 6px; cursor: pointer; font-size: 11px; font-weight: 600; transition: all 0.15s; }
.fe-app .size-btn:hover { border-color: var(--fe-accent); color: var(--fe-text); }
.fe-app .size-btn.active { background: var(--fe-accent); border-color: var(--fe-accent); color: #fff; }
.fe-app #colorPicker { width: 100%; height: 36px; border: none; border-radius: 6px; cursor: pointer; background: none; padding: 0; }
.fe-app .palette { display: grid; grid-template-columns: repeat(8, 1fr); gap: 3px; }
.fe-app .swatch { aspect-ratio: 1; border-radius: 3px; cursor: pointer; border: 1px solid rgba(255,255,255,0.1); transition: transform 0.1s; }
.fe-app .swatch:hover { transform: scale(1.2); z-index: 1; position: relative; }
.fe-app .row-flex { display: flex; align-items: center; gap: 8px; }
.fe-app .row-flex label { font-size: 11px; color: var(--fe-muted); white-space: nowrap; }
.fe-app input[type=range] { flex: 1; accent-color: var(--fe-accent); height: 4px; }
.fe-app .val-label { font-size: 11px; color: var(--fe-text); width: 30px; text-align: right; }
.fe-app .upload-btn { display: block; width: 100%; padding: 8px; background: var(--fe-card); border: 1px dashed var(--fe-border); border-radius: 6px; color: var(--fe-muted); cursor: pointer; font-size: 12px; text-align: center; transition: all 0.15s; }
.fe-app .upload-btn:hover { border-color: var(--fe-accent); color: var(--fe-text); }
.fe-app #fileInput { display: none; }
.fe-app .preview-row { display: flex; align-items: flex-end; gap: 10px; flex-wrap: wrap; }
.fe-app .preview-item { display: flex; flex-direction: column; align-items: center; gap: 4px; }
.fe-app .preview-item span { font-size: 9px; color: var(--fe-muted); }
.fe-app .preview-canvas { image-rendering: pixelated; border: 1px solid var(--fe-border); border-radius: 2px; background: repeating-conic-gradient(#444 0% 25%, #555 0% 50%) 0 0 / 6px 6px; }
.fe-app .export-btns { display: flex; flex-direction: column; gap: 6px; }
.fe-app .export-btn { padding: 8px 12px; border: 1px solid var(--fe-border); border-radius: 6px; background: var(--fe-card); color: var(--fe-text); cursor: pointer; font-size: 12px; font-weight: 600; text-align: left; transition: all 0.15s; display: flex; align-items: center; gap: 8px; }
.fe-app .export-btn:hover { background: var(--fe-accent); border-color: var(--fe-accent); }
.fe-app .export-btn span { font-size: 16px; }
.fe-app .action-btns { display: flex; gap: 6px; }
.fe-app .action-btn { flex: 1; padding: 7px 0; background: var(--fe-card); border: 1px solid var(--fe-border); color: var(--fe-muted); border-radius: 6px; cursor: pointer; font-size: 11px; font-weight: 600; transition: all 0.15s; }
.fe-app .action-btn:hover { border-color: var(--fe-accent); color: var(--fe-text); }
.fe-app .toggle-row { display: flex; align-items: center; gap: 8px; margin-top: 6px; }
.fe-app .toggle-row label { font-size: 11px; color: var(--fe-muted); cursor: pointer; }
.fe-app input[type=checkbox] { accent-color: var(--fe-accent); cursor: pointer; }
.fe-app [data-tip] { position: relative; }
.fe-app [data-tip]::after { content: attr(data-tip); position: absolute; left: 54px; top: 50%; transform: translateY(-50%); background: #000; color: #fff; padding: 4px 8px; border-radius: 4px; font-size: 11px; white-space: nowrap; pointer-events: none; opacity: 0; transition: opacity 0.15s; z-index: 100; }
.fe-app [data-tip]:hover::after { opacity: 1; }
@media (max-width: 600px) {
  .fe-app { height: calc(100vh - 200px); min-height: 420px; }
  .fe-app .workspace { position: relative; }
  .fe-app .sidebar-right { position: absolute; top: 0; right: -220px; bottom: 0; z-index: 20; transition: right 0.25s ease; box-shadow: -4px 0 20px rgba(0,0,0,0.6); }
  .fe-app .sidebar-right.open { right: 0; }
  .fe-panel-tab { position: absolute; right: 0; top: 50%; transform: translateY(-50%); width: 26px; height: 64px; background: var(--fe-accent); border: none; border-radius: 6px 0 0 6px; color: #fff; cursor: pointer; display: flex; align-items: center; justify-content: center; font-size: 15px; box-shadow: -3px 0 10px rgba(0,0,0,0.4); transition: right 0.25s ease, background 0.15s; z-index: 21; }
  .fe-panel-tab.open { right: 220px; }
  .fe-panel-tab:active { filter: brightness(0.85); }
}
@media (min-width: 601px) { .fe-panel-tab { display: none; } }
</style>

<div class="fe-app">
  <div class="fe-header">
    <h2>🎨 Favicon Editor</h2>
    <cfoutput><span><cfif local.isEs>Lápiz · Borrador · Relleno · Cuentagotas · Línea · Rectángulo — Atajos: P E F I L R<cfelse>Pencil · Eraser · Fill · Eyedropper · Line · Rect — Shortcuts: P E F I L R</cfif></span></cfoutput>
  </div>
  <div class="workspace">
    <div class="sidebar-left">
      <button class="tool-btn active" data-tool="pencil" data-tip="Lápiz (P)">✏️</button>
      <button class="tool-btn" data-tool="eraser" data-tip="Borrador (E)">🧹</button>
      <button class="tool-btn" data-tool="fill" data-tip="Relleno (F)">🪣</button>
      <button class="tool-btn" data-tool="eyedropper" data-tip="Cuentagotas (I)">💉</button>
      <button class="tool-btn" data-tool="line" data-tip="Línea (L)">╱</button>
      <button class="tool-btn" data-tool="rect" data-tip="Rectángulo (R)">▭</button>
      <div class="tool-sep"></div>
      <div class="color-pair">
        <div class="color-bg-swatch" id="bgSwatch"></div>
        <div class="color-fg-swatch" id="fgSwatch"></div>
        <button class="swap-btn" id="swapColors">⇄</button>
      </div>
    </div>
    <div class="canvas-area" id="canvasArea">
      <canvas id="pixelCanvas"></canvas>
    </div>
    <button class="fe-panel-tab" id="fePanelTab">⚙</button>
    <div class="sidebar-right">
      <div class="panel-section">
        <div class="panel-label"><cfoutput><cfif local.isEs>Tamaño<cfelse>Canvas Size</cfif></cfoutput></div>
        <div class="size-btns">
          <button class="size-btn active" data-size="16">16</button>
          <button class="size-btn" data-size="32">32</button>
          <button class="size-btn" data-size="48">48</button>
          <button class="size-btn" data-size="64">64</button>
        </div>
        <div class="toggle-row">
          <input type="checkbox" id="showGrid" checked>
          <label for="showGrid"><cfoutput><cfif local.isEs>Grilla<cfelse>Grid</cfif></cfoutput></label>
        </div>
      </div>
      <div class="panel-section">
        <div class="panel-label"><cfoutput><cfif local.isEs>Color<cfelse>Color</cfif></cfoutput></div>
        <input type="color" id="colorPicker" value="#e94560">
        <div class="row-flex" style="margin-top:8px;">
          <label><cfoutput><cfif local.isEs>Opacidad<cfelse>Opacity</cfif></cfoutput></label>
          <input type="range" id="opacitySlider" min="0" max="255" value="255">
          <span class="val-label" id="opacityVal">255</span>
        </div>
      </div>
      <div class="panel-section">
        <div class="panel-label"><cfoutput><cfif local.isEs>Paleta<cfelse>Palette</cfif></cfoutput></div>
        <div class="palette" id="palette"></div>
      </div>
      <div class="panel-section">
        <div class="panel-label"><cfoutput><cfif local.isEs>Subir Imagen<cfelse>Upload Image</cfif></cfoutput></div>
        <label class="upload-btn" for="fileInput">📁 <cfoutput><cfif local.isEs>Elegir archivo…<cfelse>Choose file…</cfif></cfoutput></label>
        <input type="file" id="fileInput" accept="image/*,.ico">
      </div>
      <div class="panel-section">
        <div class="panel-label"><cfoutput><cfif local.isEs>Vista Previa<cfelse>Preview</cfif></cfoutput></div>
        <div class="preview-row" id="previewRow"></div>
      </div>
      <div class="panel-section">
        <div class="panel-label"><cfoutput><cfif local.isEs>Edición<cfelse>Edit</cfif></cfoutput></div>
        <div class="action-btns">
          <button class="action-btn" id="undoBtn">↩ <cfoutput><cfif local.isEs>Deshacer<cfelse>Undo</cfif></cfoutput></button>
          <button class="action-btn" id="redoBtn">↪ <cfoutput><cfif local.isEs>Rehacer<cfelse>Redo</cfif></cfoutput></button>
        </div>
        <div class="action-btns" style="margin-top:6px;">
          <button class="action-btn" id="clearBtn" style="color:#e94560;">🗑 <cfoutput><cfif local.isEs>Limpiar<cfelse>Clear</cfif></cfoutput></button>
          <button class="action-btn" id="fillAllBtn">◼ <cfoutput><cfif local.isEs>Rellenar<cfelse>Fill All</cfif></cfoutput></button>
        </div>
      </div>
      <div class="panel-section">
        <div class="panel-label"><cfoutput><cfif local.isEs>Exportar<cfelse>Export</cfif></cfoutput></div>
        <div class="export-btns">
          <button class="export-btn" id="exportPNG"><span>🖼</span> favicon.png</button>
          <button class="export-btn" id="exportICO"><span>🗂</span> favicon.ico</button>
          <button class="export-btn" id="exportAllSizes"><span>📦</span> PNG × 4 <cfoutput><cfif local.isEs>tamaños<cfelse>sizes</cfif></cfoutput></button>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="/assets/js/vendor/sweetalert2.all.min.js"></script>
<script>
(function() {
  'use strict';
  let gridSize=16, zoom=1, pixels=[], history=[], historyIdx=-1, activeTool='pencil';
  let fgColor={r:233,g:69,b:96,a:255}, bgColor={r:255,g:255,b:255,a:255};
  let showGrid=true, painting=false, lineStart=null, rectStart=null, savedPixels=null;

  const canvas = document.getElementById('pixelCanvas');
  const ctx = canvas.getContext('2d');

  function initGrid(size) {
    gridSize = size;
    pixels = Array.from({length: size*size}, () => ({r:0,g:0,b:0,a:0}));
    history = []; historyIdx = -1;
    calcZoom(); saveHistory(); redraw(); updatePreviews();
  }

  function calcZoom() {
    const area = document.getElementById('canvasArea');
    const maxW = area.clientWidth - 40, maxH = area.clientHeight - 40;
    zoom = Math.floor(Math.min(maxW / gridSize, maxH / gridSize));
    zoom = Math.max(4, Math.min(zoom, 32));
    canvas.width = gridSize * zoom;
    canvas.height = gridSize * zoom;
  }

  function redraw() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    for (let i = 0; i < gridSize * gridSize; i++) {
      const x = (i % gridSize) * zoom, y = Math.floor(i / gridSize) * zoom, p = pixels[i];
      if (p.a > 0) {
        ctx.fillStyle = `rgba(${p.r},${p.g},${p.b},${p.a/255})`;
        ctx.fillRect(x, y, zoom, zoom);
      }
    }
    if (showGrid && zoom >= 4) {
      ctx.strokeStyle = 'rgba(255,255,255,0.08)'; ctx.lineWidth = 0.5;
      for (let x = 0; x <= gridSize; x++) { ctx.beginPath(); ctx.moveTo(x*zoom,0); ctx.lineTo(x*zoom,canvas.height); ctx.stroke(); }
      for (let y = 0; y <= gridSize; y++) { ctx.beginPath(); ctx.moveTo(0,y*zoom); ctx.lineTo(canvas.width,y*zoom); ctx.stroke(); }
    }
  }

  function getPixelIdx(cx, cy) {
    const px = Math.floor(cx/zoom), py = Math.floor(cy/zoom);
    if (px < 0 || py < 0 || px >= gridSize || py >= gridSize) return -1;
    return py * gridSize + px;
  }

  function paintAt(cx, cy) {
    const idx = getPixelIdx(cx, cy);
    if (idx < 0) return;
    if (activeTool === 'pencil') pixels[idx] = {...fgColor};
    else if (activeTool === 'eraser') pixels[idx] = {r:0,g:0,b:0,a:0};
    redraw(); updatePreviews();
  }

  function floodFill(startIdx, targetColor, fillColor) {
    if (colorEqual(targetColor, fillColor)) return;
    const stack = [startIdx], visited = new Set();
    while (stack.length) {
      const idx = stack.pop();
      if (idx < 0 || idx >= gridSize*gridSize || visited.has(idx) || !colorEqual(pixels[idx], targetColor)) continue;
      visited.add(idx); pixels[idx] = {...fillColor};
      const x = idx % gridSize, y = Math.floor(idx / gridSize);
      if (x > 0) stack.push(idx-1);
      if (x < gridSize-1) stack.push(idx+1);
      if (y > 0) stack.push(idx-gridSize);
      if (y < gridSize-1) stack.push(idx+gridSize);
    }
  }

  function colorEqual(a, b) { return a.r===b.r && a.g===b.g && a.b===b.b && a.a===b.a; }
  function clonePixels() { return pixels.map(p => ({...p})); }

  function saveHistory() {
    history = history.slice(0, historyIdx+1);
    history.push(clonePixels());
    if (history.length > 80) history.shift();
    historyIdx = history.length - 1;
  }

  function undo() { if (historyIdx <= 0) return; historyIdx--; pixels = history[historyIdx].map(p=>({...p})); redraw(); updatePreviews(); }
  function redo() { if (historyIdx >= history.length-1) return; historyIdx++; pixels = history[historyIdx].map(p=>({...p})); redraw(); updatePreviews(); }

  function bresenham(x0,y0,x1,y1) {
    const pts=[]; let dx=Math.abs(x1-x0),dy=Math.abs(y1-y0),sx=x0<x1?1:-1,sy=y0<y1?1:-1,err=dx-dy;
    while(true){ pts.push(y0*gridSize+x0); if(x0===x1&&y0===y1)break; let e2=2*err; if(e2>-dy){err-=dy;x0+=sx;} if(e2<dx){err+=dx;y0+=sy;} }
    return pts;
  }

  function rectPixels(x0,y0,x1,y1) {
    const pts=[],minX=Math.min(x0,x1),maxX=Math.max(x0,x1),minY=Math.min(y0,y1),maxY=Math.max(y0,y1);
    for(let x=minX;x<=maxX;x++){pts.push(minY*gridSize+x);pts.push(maxY*gridSize+x);}
    for(let y=minY+1;y<maxY;y++){pts.push(y*gridSize+minX);pts.push(y*gridSize+maxX);}
    return pts;
  }

  function canvasPos(e) {
    const rect = canvas.getBoundingClientRect();
    const cx = e.touches ? e.touches[0].clientX : e.clientX;
    const cy = e.touches ? e.touches[0].clientY : e.clientY;
    return {x: cx - rect.left, y: cy - rect.top};
  }
  function pixelXY(cx, cy) { return {px: Math.floor(cx/zoom), py: Math.floor(cy/zoom)}; }

  function startPaint(e) {
    const {x,y} = canvasPos(e), {px,py} = pixelXY(x,y);
    if (px<0||py<0||px>=gridSize||py>=gridSize) return;
    if (activeTool === 'eyedropper') {
      fgColor = {...pixels[py*gridSize+px]};
      if (fgColor.a === 0) fgColor = {r:0,g:0,b:0,a:255};
      updateColorUI(); return;
    }
    if (activeTool === 'fill') {
      const idx = py*gridSize+px, target = {...pixels[idx]};
      floodFill(idx, target, fgColor); saveHistory(); redraw(); updatePreviews(); return;
    }
    if (activeTool === 'line') { savedPixels = clonePixels(); lineStart = {px,py}; painting = true; return; }
    if (activeTool === 'rect') { savedPixels = clonePixels(); rectStart = {px,py}; painting = true; return; }
    painting = true; saveHistory(); paintAt(x, y);
  }

  function movePaint(e) {
    if (!painting) return;
    const {x,y} = canvasPos(e), {px,py} = pixelXY(x,y);
    if (activeTool === 'line' && lineStart) {
      pixels = savedPixels.map(p=>({...p}));
      bresenham(lineStart.px,lineStart.py,px,py).forEach(idx=>{ if(idx>=0&&idx<gridSize*gridSize) pixels[idx]={...fgColor}; });
      redraw(); return;
    }
    if (activeTool === 'rect' && rectStart) {
      pixels = savedPixels.map(p=>({...p}));
      rectPixels(rectStart.px,rectStart.py,px,py).forEach(idx=>{ if(idx>=0&&idx<gridSize*gridSize) pixels[idx]={...fgColor}; });
      redraw(); return;
    }
    paintAt(x, y);
  }

  function endPaint() {
    if (!painting) return;
    painting = false;
    if (activeTool === 'line' || activeTool === 'rect') { saveHistory(); updatePreviews(); }
    lineStart = null; rectStart = null; savedPixels = null;
  }

  function drawToCanvas(targetCtx, targetSize) {
    const offscreen = document.createElement('canvas');
    offscreen.width = offscreen.height = gridSize;
    const oc = offscreen.getContext('2d'), imgData = oc.createImageData(gridSize, gridSize);
    for (let i = 0; i < gridSize*gridSize; i++) {
      const p = pixels[i];
      imgData.data[i*4]=p.r; imgData.data[i*4+1]=p.g; imgData.data[i*4+2]=p.b; imgData.data[i*4+3]=p.a;
    }
    oc.putImageData(imgData, 0, 0);
    targetCtx.imageSmoothingEnabled = false;
    targetCtx.drawImage(offscreen, 0, 0, targetSize, targetSize);
  }

  function updatePreviews() {
    const row = document.getElementById('previewRow'); row.innerHTML = '';
    [16,32,48].forEach(sz => {
      const div = document.createElement('div'); div.className = 'preview-item';
      const c = document.createElement('canvas'); c.className = 'preview-canvas';
      c.width = c.height = sz; c.style.width = sz+'px'; c.style.height = sz+'px';
      drawToCanvas(c.getContext('2d'), sz);
      const lbl = document.createElement('span'); lbl.textContent = sz+'px';
      div.appendChild(c); div.appendChild(lbl); row.appendChild(div);
    });
  }

  function getExportCanvas(size) {
    const c = document.createElement('canvas'); c.width = c.height = size;
    drawToCanvas(c.getContext('2d'), size); return c;
  }

  document.getElementById('exportPNG').addEventListener('click', () => {
    const c = getExportCanvas(gridSize), link = document.createElement('a');
    link.download = 'favicon.png'; link.href = c.toDataURL('image/png'); link.click();
  });

  document.getElementById('exportAllSizes').addEventListener('click', async () => {
    for (const sz of [16,32,48,64]) {
      const c = getExportCanvas(sz);
      await new Promise(res => {
        const link = document.createElement('a');
        link.download = `favicon-${sz}x${sz}.png`; link.href = c.toDataURL('image/png'); link.click();
        setTimeout(res, 200);
      });
    }
  });

  document.getElementById('exportICO').addEventListener('click', () => {
    const sizes=[16,32,48,64], pngBlobs = sizes.map(sz => {
      const c = getExportCanvas(sz), dataURL = c.toDataURL('image/png');
      const base64 = dataURL.split(',')[1], binary = atob(base64), bytes = new Uint8Array(binary.length);
      for (let i=0; i<binary.length; i++) bytes[i] = binary.charCodeAt(i);
      return bytes;
    });
    const n = sizes.length; let totalSize = 6 + n*16; const offsets = [];
    pngBlobs.forEach(b => { offsets.push(totalSize); totalSize += b.length; });
    const buf = new ArrayBuffer(totalSize), view = new DataView(buf); let pos = 0;
    view.setUint16(pos,0,true); pos+=2; view.setUint16(pos,1,true); pos+=2; view.setUint16(pos,n,true); pos+=2;
    sizes.forEach((sz,i) => {
      view.setUint8(pos++, sz>=256?0:sz); view.setUint8(pos++, sz>=256?0:sz);
      view.setUint8(pos++,0); view.setUint8(pos++,0);
      view.setUint16(pos,1,true); pos+=2; view.setUint16(pos,32,true); pos+=2;
      view.setUint32(pos,pngBlobs[i].length,true); pos+=4; view.setUint32(pos,offsets[i],true); pos+=4;
    });
    pngBlobs.forEach(b => { new Uint8Array(buf,pos,b.length).set(b); pos+=b.length; });
    const blob = new Blob([buf],{type:'image/x-icon'}), link = document.createElement('a');
    link.download='favicon.ico'; link.href=URL.createObjectURL(blob); link.click(); URL.revokeObjectURL(link.href);
  });

  document.getElementById('fileInput').addEventListener('change', e => {
    const file = e.target.files[0]; if (!file) return;
    const img = new Image();
    img.onload = () => {
      const offscreen = document.createElement('canvas'); offscreen.width = offscreen.height = gridSize;
      const oc = offscreen.getContext('2d'); oc.imageSmoothingEnabled=true; oc.imageSmoothingQuality='high';
      oc.drawImage(img, 0, 0, gridSize, gridSize);
      const data = oc.getImageData(0,0,gridSize,gridSize).data;
      for (let i=0; i<gridSize*gridSize; i++) pixels[i]={r:data[i*4],g:data[i*4+1],b:data[i*4+2],a:data[i*4+3]};
      saveHistory(); redraw(); updatePreviews(); URL.revokeObjectURL(img.src);
    };
    img.src = URL.createObjectURL(file); e.target.value = '';
  });

  function hexToRgb(hex) { return {r:parseInt(hex.slice(1,3),16), g:parseInt(hex.slice(3,5),16), b:parseInt(hex.slice(5,7),16)}; }
  function rgbToHex(r,g,b) { return '#'+[r,g,b].map(v=>v.toString(16).padStart(2,'0')).join(''); }

  function updateColorUI() {
    if (!_editingBg) document.getElementById('colorPicker').value = rgbToHex(fgColor.r, fgColor.g, fgColor.b);
    document.getElementById('opacitySlider').value = fgColor.a;
    document.getElementById('opacityVal').textContent = fgColor.a;
    document.getElementById('fgSwatch').style.background = `rgba(${fgColor.r},${fgColor.g},${fgColor.b},${fgColor.a/255})`;
    document.getElementById('bgSwatch').style.background = `rgba(${bgColor.r},${bgColor.g},${bgColor.b},${bgColor.a/255})`;
  }

  let _editingBg = false;
  document.getElementById('colorPicker').addEventListener('input', e => {
    const {r,g,b} = hexToRgb(e.target.value);
    if (_editingBg) { bgColor = {r,g,b,a:bgColor.a>0?bgColor.a:255}; } else { fgColor = {r,g,b,a:fgColor.a}; }
    updateColorUI();
  });
  document.getElementById('opacitySlider').addEventListener('input', e => { fgColor.a = parseInt(e.target.value); updateColorUI(); });
  document.getElementById('fgSwatch').addEventListener('click', () => {
    _editingBg = false;
    document.getElementById('colorPicker').value = rgbToHex(fgColor.r, fgColor.g, fgColor.b);
    document.getElementById('colorPicker').click();
  });
  document.getElementById('bgSwatch').addEventListener('click', () => {
    _editingBg = true;
    document.getElementById('colorPicker').value = rgbToHex(bgColor.r, bgColor.g, bgColor.b);
    document.getElementById('colorPicker').click();
  });
  document.getElementById('swapColors').addEventListener('click', () => { [fgColor,bgColor]=[bgColor,fgColor]; updateColorUI(); });

  const PALETTE_COLORS=['#000000','#ffffff','#808080','#c0c0c0','#ff0000','#800000','#ff6600','#ff9900','#ffff00','#808000','#00ff00','#008000','#00ffff','#008080','#0000ff','#000080','#ff00ff','#800080','#ff69b4','#ffc0cb','#8b4513','#d2691e','#f5deb3','#ffefd5','#e94560','#533483','#0f3460','#16213e','#4ade80','#60a5fa','#f59e0b','#ef4444'];
  (function buildPalette() {
    const container = document.getElementById('palette');
    PALETTE_COLORS.forEach(hex => {
      const div = document.createElement('div'); div.className='swatch'; div.style.background=hex; div.title=hex;
      div.addEventListener('click', () => { const {r,g,b}=hexToRgb(hex); fgColor={r,g,b,a:fgColor.a}; updateColorUI(); });
      div.addEventListener('contextmenu', e => { e.preventDefault(); const {r,g,b}=hexToRgb(hex); bgColor={r,g,b,a:255}; updateColorUI(); });
      container.appendChild(div);
    });
  })();

  document.querySelectorAll('.fe-app .tool-btn[data-tool]').forEach(btn => {
    btn.addEventListener('click', () => {
      activeTool = btn.dataset.tool;
      document.querySelectorAll('.fe-app .tool-btn[data-tool]').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
    });
  });

  document.addEventListener('keydown', e => {
    if (e.target.tagName === 'INPUT') return;
    const map = {p:'pencil',e:'eraser',f:'fill',i:'eyedropper',l:'line',r:'rect'};
    if (map[e.key.toLowerCase()]) {
      activeTool = map[e.key.toLowerCase()];
      document.querySelectorAll('.fe-app .tool-btn[data-tool]').forEach(b => b.classList.toggle('active', b.dataset.tool===activeTool));
    }
    if ((e.ctrlKey||e.metaKey) && e.key==='z') { e.preventDefault(); e.shiftKey ? redo() : undo(); }
    if ((e.ctrlKey||e.metaKey) && e.key==='y') { e.preventDefault(); redo(); }
  });

  const _isEs = <cfif local.isEs>true<cfelse>false</cfif>;

  document.querySelectorAll('.fe-app .size-btn').forEach(btn => {
    btn.addEventListener('click', async () => {
      if (parseInt(btn.dataset.size) === gridSize) return;
      const res = await Swal.fire({
        title: _isEs ? '¿Cambiar tamaño?' : 'Change canvas size?',
        text: _isEs ? `¿Cambiar a ${btn.dataset.size}×${btn.dataset.size}? Se perderá el trabajo actual.` : `Change to ${btn.dataset.size}×${btn.dataset.size}? Current work will be lost.`,
        icon: 'warning', showCancelButton: true,
        confirmButtonText: _isEs ? 'Sí, cambiar' : 'Yes, change',
        cancelButtonText: _isEs ? 'Cancelar' : 'Cancel',
        background: '#16213e', color: '#eaeaea',
        confirmButtonColor: '#e94560', cancelButtonColor: '#2a3a5c'
      });
      if (!res.isConfirmed) return;
      document.querySelectorAll('.fe-app .size-btn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      initGrid(parseInt(btn.dataset.size));
    });
  });

  document.getElementById('showGrid').addEventListener('change', e => { showGrid = e.target.checked; redraw(); });
  document.getElementById('clearBtn').addEventListener('click', async () => {
    const res = await Swal.fire({
      title: _isEs ? '¿Limpiar canvas?' : 'Clear canvas?',
      text: _isEs ? 'Se eliminará todo el trabajo actual.' : 'All current work will be deleted.',
      icon: 'warning', showCancelButton: true,
      confirmButtonText: _isEs ? 'Sí, limpiar' : 'Yes, clear',
      cancelButtonText: _isEs ? 'Cancelar' : 'Cancel',
      background: '#16213e', color: '#eaeaea',
      confirmButtonColor: '#e94560', cancelButtonColor: '#2a3a5c'
    });
    if (!res.isConfirmed) return;
    pixels = pixels.map(() => ({r:0,g:0,b:0,a:0})); saveHistory(); redraw(); updatePreviews();
  });
  document.getElementById('fillAllBtn').addEventListener('click', () => { pixels=pixels.map(()=>({...fgColor})); saveHistory(); redraw(); updatePreviews(); });
  document.getElementById('undoBtn').addEventListener('click', undo);
  document.getElementById('redoBtn').addEventListener('click', redo);

  canvas.addEventListener('mousedown', startPaint);
  canvas.addEventListener('mousemove', movePaint);
  canvas.addEventListener('mouseup', endPaint);
  canvas.addEventListener('mouseleave', endPaint);
  canvas.addEventListener('touchstart', e=>{e.preventDefault();startPaint(e);},{passive:false});
  canvas.addEventListener('touchmove', e=>{e.preventDefault();movePaint(e);},{passive:false});
  canvas.addEventListener('touchend', e=>{e.preventDefault();endPaint();},{passive:false});

  window.addEventListener('resize', () => { calcZoom(); redraw(); });

  // Mobile: collapsible right panel
  const _panelTab = document.getElementById('fePanelTab');
  const _sidebarRight = document.querySelector('.fe-app .sidebar-right');
  const _canvasArea = document.getElementById('canvasArea');
  if (_panelTab) {
    _panelTab.addEventListener('click', () => {
      const opening = !_sidebarRight.classList.contains('open');
      _sidebarRight.classList.toggle('open', opening);
      _panelTab.classList.toggle('open', opening);
      _panelTab.textContent = opening ? '✕' : '⚙';
      setTimeout(() => { calcZoom(); redraw(); }, 270);
    });
    _canvasArea.addEventListener('click', () => {
      if (window.innerWidth <= 600 && _sidebarRight.classList.contains('open')) {
        _sidebarRight.classList.remove('open');
        _panelTab.classList.remove('open');
        _panelTab.textContent = '⚙';
        setTimeout(() => { calcZoom(); redraw(); }, 270);
      }
    });
  }

  initGrid(16);
  updateColorUI();
})();
</script>
