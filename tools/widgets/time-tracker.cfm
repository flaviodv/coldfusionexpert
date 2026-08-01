<div class="tool-widget widget-time-tracker">
  <!-- Section Header & Timer Tabs Bar -->
  <div style="display:flex; align-items:center; justify-content:space-between; flex-wrap:wrap; gap:10px; margin-bottom:12px;">
    <h3 style="font-size:1.1rem; font-weight:700; color:#0f172a; margin:0;">
      <i class="fas fa-stopwatch" style="color:#13aff0;"></i> 
      <cfif local.isEs>Cronómetros en Paralelo (5 Pestañas)<cfelse>Parallel Timers (5 Tabs)</cfif>
    </h3>
    <span style="font-size:0.82rem; color:#64748b; font-weight:600;">
      <i class="fas fa-info-circle"></i> <cfif local.isEs>Cambiá de pestaña para ver el tiempo en vivo de cada reloj<cfelse>Switch tabs to view live time on each clock</cfif>
    </span>
  </div>

  <!-- Timer Tabs Bar (5 Slots) -->
  <div class="timer-tabs-bar">
    <button type="button" class="timer-tab-item active" data-tab="1">
      <i class="fas fa-clock"></i> <span><cfif local.isEs>Cronómetro 1<cfelse>Timer 1</cfif></span>
      <span id="tab-status-1"></span>
    </button>
    <button type="button" class="timer-tab-item" data-tab="2">
      <i class="fas fa-clock"></i> <span><cfif local.isEs>Cronómetro 2<cfelse>Timer 2</cfif></span>
      <span id="tab-status-2"></span>
    </button>
    <button type="button" class="timer-tab-item" data-tab="3">
      <i class="fas fa-clock"></i> <span><cfif local.isEs>Cronómetro 3<cfelse>Timer 3</cfif></span>
      <span id="tab-status-3"></span>
    </button>
    <button type="button" class="timer-tab-item" data-tab="4">
      <i class="fas fa-clock"></i> <span><cfif local.isEs>Cronómetro 4<cfelse>Timer 4</cfif></span>
      <span id="tab-status-4"></span>
    </button>
    <button type="button" class="timer-tab-item" data-tab="5">
      <i class="fas fa-clock"></i> <span><cfif local.isEs>Cronómetro 5<cfelse>Timer 5</cfif></span>
      <span id="tab-status-5"></span>
    </button>
  </div>

  <!-- Tab Panels Container -->
  <div class="multi-timers-wrapper">
    <!-- Panel 1 -->
    <div class="timer-tab-panel active" id="timer-panel-1">
      <div class="timer-slot-card" id="timer-card-1">
        <span class="timer-slot-badge">⏱️ <cfif local.isEs>Reloj 1<cfelse>Timer 1</cfif></span>
        
        <input type="text" id="tracker-desc-1" placeholder="<cfif local.isEs>¿En qué estás trabajando?<cfelse>What are you working on?</cfif>" spellcheck="false">

        <input type="text" id="tracker-project-1" placeholder="<cfif local.isEs>Proyecto / Cliente...<cfelse>Project / Client...</cfif>" style="width:230px;">

        <div style="display:flex; align-items:center; gap:6px;">
          <select id="tracker-currency-1" style="width:95px;">
            <option value="$">$ USD</option>
            <option value="€">€ EUR</option>
            <option value="ARS$">$ ARS</option>
            <option value="R$">R$ BRL</option>
            <option value="£">£ GBP</option>
          </select>
          <input type="number" id="tracker-rate-1" placeholder="$/hr" step="0.5" min="0" style="width:85px;">
        </div>

        <div class="timer-clock-box">
          <span class="timer-digits" id="timer-digits-1">00:00:00</span>
          <span class="live-earnings-badge" id="live-earnings-badge-1" style="display:none;">$0.00</span>
        </div>

        <button type="button" class="btn-timer-toggle btn-timer-start" id="btn-timer-toggle-1" data-slot="1">
          <i class="fas fa-play"></i> <span><cfif local.isEs>INICIAR<cfelse>START</cfif></span>
        </button>
      </div>
    </div>

    <!-- Panel 2 -->
    <div class="timer-tab-panel" id="timer-panel-2">
      <div class="timer-slot-card" id="timer-card-2">
        <span class="timer-slot-badge">⏱️ <cfif local.isEs>Reloj 2<cfelse>Timer 2</cfif></span>
        
        <input type="text" id="tracker-desc-2" placeholder="<cfif local.isEs>¿En qué estás trabajando?<cfelse>What are you working on?</cfif>" spellcheck="false">

        <input type="text" id="tracker-project-2" placeholder="<cfif local.isEs>Proyecto / Cliente...<cfelse>Project / Client...</cfif>" style="width:230px;">

        <div style="display:flex; align-items:center; gap:6px;">
          <select id="tracker-currency-2" style="width:95px;">
            <option value="$">$ USD</option>
            <option value="€">€ EUR</option>
            <option value="ARS$">$ ARS</option>
            <option value="R$">R$ BRL</option>
            <option value="£">£ GBP</option>
          </select>
          <input type="number" id="tracker-rate-2" placeholder="$/hr" step="0.5" min="0" style="width:85px;">
        </div>

        <div class="timer-clock-box">
          <span class="timer-digits" id="timer-digits-2">00:00:00</span>
          <span class="live-earnings-badge" id="live-earnings-badge-2" style="display:none;">$0.00</span>
        </div>

        <button type="button" class="btn-timer-toggle btn-timer-start" id="btn-timer-toggle-2" data-slot="2">
          <i class="fas fa-play"></i> <span><cfif local.isEs>INICIAR<cfelse>START</cfif></span>
        </button>
      </div>
    </div>

    <!-- Panel 3 -->
    <div class="timer-tab-panel" id="timer-panel-3">
      <div class="timer-slot-card" id="timer-card-3">
        <span class="timer-slot-badge">⏱️ <cfif local.isEs>Reloj 3<cfelse>Timer 3</cfif></span>
        
        <input type="text" id="tracker-desc-3" placeholder="<cfif local.isEs>¿En qué estás trabajando?<cfelse>What are you working on?</cfif>" spellcheck="false">

        <input type="text" id="tracker-project-3" placeholder="<cfif local.isEs>Proyecto / Cliente...<cfelse>Project / Client...</cfif>" style="width:230px;">

        <div style="display:flex; align-items:center; gap:6px;">
          <select id="tracker-currency-3" style="width:95px;">
            <option value="$">$ USD</option>
            <option value="€">€ EUR</option>
            <option value="ARS$">$ ARS</option>
            <option value="R$">R$ BRL</option>
            <option value="£">£ GBP</option>
          </select>
          <input type="number" id="tracker-rate-3" placeholder="$/hr" step="0.5" min="0" style="width:85px;">
        </div>

        <div class="timer-clock-box">
          <span class="timer-digits" id="timer-digits-3">00:00:00</span>
          <span class="live-earnings-badge" id="live-earnings-badge-3" style="display:none;">$0.00</span>
        </div>

        <button type="button" class="btn-timer-toggle btn-timer-start" id="btn-timer-toggle-3" data-slot="3">
          <i class="fas fa-play"></i> <span><cfif local.isEs>INICIAR<cfelse>START</cfif></span>
        </button>
      </div>
    </div>

    <!-- Panel 4 -->
    <div class="timer-tab-panel" id="timer-panel-4">
      <div class="timer-slot-card" id="timer-card-4">
        <span class="timer-slot-badge">⏱️ <cfif local.isEs>Reloj 4<cfelse>Timer 4</cfif></span>
        
        <input type="text" id="tracker-desc-4" placeholder="<cfif local.isEs>¿En qué estás trabajando?<cfelse>What are you working on?</cfif>" spellcheck="false">

        <input type="text" id="tracker-project-4" placeholder="<cfif local.isEs>Proyecto / Cliente...<cfelse>Project / Client...</cfif>" style="width:230px;">

        <div style="display:flex; align-items:center; gap:6px;">
          <select id="tracker-currency-4" style="width:95px;">
            <option value="$">$ USD</option>
            <option value="€">€ EUR</option>
            <option value="ARS$">$ ARS</option>
            <option value="R$">R$ BRL</option>
            <option value="£">£ GBP</option>
          </select>
          <input type="number" id="tracker-rate-4" placeholder="$/hr" step="0.5" min="0" style="width:85px;">
        </div>

        <div class="timer-clock-box">
          <span class="timer-digits" id="timer-digits-4">00:00:00</span>
          <span class="live-earnings-badge" id="live-earnings-badge-4" style="display:none;">$0.00</span>
        </div>

        <button type="button" class="btn-timer-toggle btn-timer-start" id="btn-timer-toggle-4" data-slot="4">
          <i class="fas fa-play"></i> <span><cfif local.isEs>INICIAR<cfelse>START</cfif></span>
        </button>
      </div>
    </div>

    <!-- Panel 5 -->
    <div class="timer-tab-panel" id="timer-panel-5">
      <div class="timer-slot-card" id="timer-card-5">
        <span class="timer-slot-badge">⏱️ <cfif local.isEs>Reloj 5<cfelse>Timer 5</cfif></span>
        
        <input type="text" id="tracker-desc-5" placeholder="<cfif local.isEs>¿En qué estás trabajando?<cfelse>What are you working on?</cfif>" spellcheck="false">

        <input type="text" id="tracker-project-5" placeholder="<cfif local.isEs>Proyecto / Cliente...<cfelse>Project / Client...</cfif>" style="width:230px;">

        <div style="display:flex; align-items:center; gap:6px;">
          <select id="tracker-currency-5" style="width:95px;">
            <option value="$">$ USD</option>
            <option value="€">€ EUR</option>
            <option value="ARS$">$ ARS</option>
            <option value="R$">R$ BRL</option>
            <option value="£">£ GBP</option>
          </select>
          <input type="number" id="tracker-rate-5" placeholder="$/hr" step="0.5" min="0" style="width:85px;">
        </div>

        <div class="timer-clock-box">
          <span class="timer-digits" id="timer-digits-5">00:00:00</span>
          <span class="live-earnings-badge" id="live-earnings-badge-5" style="display:none;">$0.00</span>
        </div>

        <button type="button" class="btn-timer-toggle btn-timer-start" id="btn-timer-toggle-5" data-slot="5">
          <i class="fas fa-play"></i> <span><cfif local.isEs>INICIAR<cfelse>START</cfif></span>
        </button>
      </div>
    </div>
  </div>

  <!-- Summary Dashboard Cards -->
  <div class="summary-cards-grid">
    <div class="summary-card">
      <label><cfif local.isEs>Tiempo Total Registrado<cfelse>Total Time Tracked</cfif></label>
      <span class="val" id="summary-total-time">00:00:00</span>
    </div>
    <div class="summary-card">
      <label><cfif local.isEs>Ganancia Total Calculada<cfelse>Total Money Earned</cfif></label>
      <span class="val" id="summary-total-earned" style="color:#16a34a;">$0.00</span>
    </div>
    <div class="summary-card">
      <label><cfif local.isEs>Registros de Tiempo<cfelse>Total Time Entries</cfif></label>
      <span class="val" id="summary-total-count">0</span>
    </div>
  </div>

  <!-- Entries Header & Action Bar -->
  <div class="entries-header-bar">
    <h3 style="font-size:1.1rem; font-weight:700; color:#0f172a; margin:0;">
      <i class="fas fa-list-alt" style="color:#13aff0;"></i> <cfif local.isEs>Registros de Tiempo<cfelse>Time Entries</cfif>
    </h3>
    <div style="display:flex; gap:8px;">
      <button type="button" class="btn-social btn-linkedin" id="btn-export-csv" style="font-size:0.8rem; padding:4px 10px;">
        <i class="fas fa-file-csv"></i> Export CSV
      </button>
      <button type="button" class="btn-social btn-linkedin" id="btn-clear-entries" style="font-size:0.8rem; padding:4px 10px;">
        <i class="fas fa-trash"></i> <cfif local.isEs>Borrar Historial<cfelse>Clear History</cfif>
      </button>
    </div>
  </div>

  <!-- Grouped Entries Container -->
  <div id="entries-container">
    <!-- Time entries dynamically grouped by date -->
  </div>
</div>

<script>
(function() {
  var ENTRIES_KEY = 'cfexpert_tracker_entries';
  var MULTI_TIMERS_KEY = 'cfexpert_tracker_multi_timers';

  var slots = [1, 2, 3, 4, 5];
  var intervals = { 1: null, 2: null, 3: null, 4: null, 5: null };

  var activeTimers = loadActiveTimers();
  var entries = loadEntries();
  var editingEntryId = null;

  // Tab switching setup
  var tabBtns = document.querySelectorAll('.widget-time-tracker .timer-tab-item');
  var tabPanels = document.querySelectorAll('.widget-time-tracker .timer-tab-panel');

  tabBtns.forEach(function(btn) {
    btn.addEventListener('click', function() {
      var slot = this.dataset.tab;
      tabBtns.forEach(function(b) { b.classList.remove('active'); });
      tabPanels.forEach(function(p) { p.classList.remove('active'); });

      this.classList.add('active');
      var panel = document.getElementById('timer-panel-' + slot);
      if (panel) panel.classList.add('active');
    });
  });

  function loadActiveTimers() {
    try {
      var data = localStorage.getItem(MULTI_TIMERS_KEY);
      return data ? JSON.parse(data) : { 1: null, 2: null, 3: null, 4: null, 5: null };
    } catch(e) {
      return { 1: null, 2: null, 3: null, 4: null, 5: null };
    }
  }

  function saveActiveTimers() {
    try {
      localStorage.setItem(MULTI_TIMERS_KEY, JSON.stringify(activeTimers));
    } catch(e) {}
  }

  function loadEntries() {
    try {
      var data = localStorage.getItem(ENTRIES_KEY);
      return data ? JSON.parse(data) : [
        {
          id: 1,
          description: '<cfif local.isEs>Desarrollo de herramientas CFML y UI<cfelse>CFML &amp; UI Tools Development</cfif>',
          project: 'CFML Dev',
          rate: 35,
          currency: '$',
          startTime: new Date(Date.now() - 3600000 * 2.5).toISOString(),
          endTime: new Date(Date.now() - 3600000 * 1.5).toISOString(),
          durationSeconds: 3600,
          earned: 35
        }
      ];
    } catch(e) { return []; }
  }

  function saveEntries() {
    try {
      localStorage.setItem(ENTRIES_KEY, JSON.stringify(entries));
    } catch(e) {}
  }

  function formatTimeDigits(sec) {
    var h = Math.floor(sec / 3600);
    var m = Math.floor((sec % 3600) / 60);
    var s = sec % 60;
    return (h < 10 ? '0' + h : h) + ':' + (m < 10 ? '0' + m : m) + ':' + (s < 10 ? '0' + s : s);
  }

  function formatClockTime(isoString) {
    var d = new Date(isoString);
    var h = d.getHours();
    var m = d.getMinutes();
    return (h < 10 ? '0' + h : h) + ':' + (m < 10 ? '0' + m : m);
  }

  function formatDateInput(isoString) {
    var d = new Date(isoString);
    var year = d.getFullYear();
    var month = String(d.getMonth() + 1).padStart(2, '0');
    var day = String(d.getDate()).padStart(2, '0');
    return year + '-' + month + '-' + day;
  }

  function updateSlotUI(slot) {
    var card = document.getElementById('timer-card-' + slot);
    var digits = document.getElementById('timer-digits-' + slot);
    var badge = document.getElementById('live-earnings-badge-' + slot);
    var btn = document.getElementById('btn-timer-toggle-' + slot);
    var tabStatus = document.getElementById('tab-status-' + slot);

    var timer = activeTimers[slot];

    if (!timer) {
      card.classList.remove('active-running');
      digits.textContent = '00:00:00';
      badge.style.display = 'none';
      btn.className = 'btn-timer-toggle btn-timer-start';
      btn.innerHTML = '<i class="fas fa-play"></i> <span><cfif local.isEs>INICIAR<cfelse>START</cfif></span>';
      if (tabStatus) tabStatus.innerHTML = '';
      return;
    }

    card.classList.add('active-running');
    var elapsedSec = Math.floor((Date.now() - new Date(timer.startTime).getTime()) / 1000);
    if (elapsedSec < 0) elapsedSec = 0;

    var formattedTime = formatTimeDigits(elapsedSec);
    digits.textContent = formattedTime;

    var rate = parseFloat(timer.rate) || 0;
    var curr = timer.currency || '$';

    if (rate > 0) {
      var earned = (elapsedSec / 3600) * rate;
      badge.textContent = curr + earned.toFixed(2);
      badge.style.display = 'inline-block';
    } else {
      badge.style.display = 'none';
    }

    btn.className = 'btn-timer-toggle btn-timer-stop';
    btn.innerHTML = '<i class="fas fa-stop"></i> <span><cfif local.isEs>DETENER<cfelse>STOP</cfif></span>';
    
    // Update Tab Header Status with green pulsing dot AND live running time digits!
    if (tabStatus) {
      tabStatus.innerHTML = '<span class="tab-running-dot" title="<cfif local.isEs>Corriendo<cfelse>Running</cfif>"></span> <span class="tab-live-time">' + formattedTime + '</span>';
    }
  }

  function startSlotTimer(slot) {
    var descInput = document.getElementById('tracker-desc-' + slot);
    var projInput = document.getElementById('tracker-project-' + slot);
    var currSelect = document.getElementById('tracker-currency-' + slot);
    var rateInput = document.getElementById('tracker-rate-' + slot);

    activeTimers[slot] = {
      description: descInput.value.trim() || '<cfif local.isEs>Tarea sin título<cfelse>Untitled Task</cfif>',
      project: projInput.value.trim() || 'General',
      rate: parseFloat(rateInput.value) || 0,
      currency: currSelect.value || '$',
      startTime: new Date().toISOString()
    };

    saveActiveTimers();
    updateSlotUI(slot);

    if (intervals[slot]) clearInterval(intervals[slot]);
    intervals[slot] = setInterval(function() { updateSlotUI(slot); }, 1000);
  }

  function stopSlotTimer(slot) {
    var timer = activeTimers[slot];
    if (!timer) return;

    var endTime = new Date().toISOString();
    var durationSec = Math.floor((new Date(endTime).getTime() - new Date(timer.startTime).getTime()) / 1000);
    if (durationSec < 1) durationSec = 1;

    var rate = parseFloat(timer.rate) || 0;
    var earned = rate > 0 ? (durationSec / 3600) * rate : 0;

    var descInput = document.getElementById('tracker-desc-' + slot);
    var projInput = document.getElementById('tracker-project-' + slot);

    var newEntry = {
      id: Date.now(),
      description: descInput.value.trim() || timer.description,
      project: projInput.value.trim() || timer.project,
      rate: rate,
      currency: timer.currency || '$',
      startTime: timer.startTime,
      endTime: endTime,
      durationSeconds: durationSec,
      earned: earned
    };

    entries.unshift(newEntry);
    saveEntries();

    activeTimers[slot] = null;
    saveActiveTimers();

    if (intervals[slot]) clearInterval(intervals[slot]);
    intervals[slot] = null;

    descInput.value = '';
    updateSlotUI(slot);
    renderEntries();
  }

  slots.forEach(function(slot) {
    var btn = document.getElementById('btn-timer-toggle-' + slot);
    btn.addEventListener('click', function() {
      if (activeTimers[slot]) {
        stopSlotTimer(slot);
      } else {
        startSlotTimer(slot);
      }
    });

    if (activeTimers[slot]) {
      var t = activeTimers[slot];
      document.getElementById('tracker-desc-' + slot).value = t.description || '';
      document.getElementById('tracker-project-' + slot).value = t.project || '';
      document.getElementById('tracker-rate-' + slot).value = t.rate > 0 ? t.rate : '';
      document.getElementById('tracker-currency-' + slot).value = t.currency || '$';

      updateSlotUI(slot);
      intervals[slot] = setInterval(function() { updateSlotUI(slot); }, 1000);
    }
  });

  function deleteEntry(id) {
    entries = entries.filter(function(e) { return e.id !== id; });
    saveEntries();
    renderEntries();
  }

  function resumeEntry(entry) {
    // Find first idle slot or default to slot 1
    var idleSlot = 1;
    for (var s = 1; s <= 5; s++) {
      if (!activeTimers[s]) {
        idleSlot = s;
        break;
      }
    }

    if (activeTimers[idleSlot]) stopSlotTimer(idleSlot);

    // Switch active tab to idleSlot
    tabBtns.forEach(function(b) { b.classList.remove('active'); });
    tabPanels.forEach(function(p) { p.classList.remove('active'); });

    var targetBtn = document.querySelector('.timer-tab-item[data-tab="' + idleSlot + '"]');
    var targetPanel = document.getElementById('timer-panel-' + idleSlot);
    if (targetBtn) targetBtn.classList.add('active');
    if (targetPanel) targetPanel.classList.add('active');

    document.getElementById('tracker-desc-' + idleSlot).value = entry.description;
    document.getElementById('tracker-project-' + idleSlot).value = entry.project;
    document.getElementById('tracker-rate-' + idleSlot).value = entry.rate > 0 ? entry.rate : '';
    document.getElementById('tracker-currency-' + idleSlot).value = entry.currency || '$';

    startSlotTimer(idleSlot);
  }

  function saveEditedEntry(id, newDesc, newProj, dateStr, startTimeStr, endTimeStr, newRate) {
    var startIso = new Date(dateStr + 'T' + startTimeStr + ':00').toISOString();
    var endIso = new Date(dateStr + 'T' + endTimeStr + ':00').toISOString();

    var startMs = new Date(startIso).getTime();
    var endMs = new Date(endIso).getTime();
    var durationSec = Math.max(1, Math.floor((endMs - startMs) / 1000));
    if (isNaN(durationSec)) durationSec = 1;

    var rate = parseFloat(newRate) || 0;
    var earned = rate > 0 ? (durationSec / 3600) * rate : 0;

    entries = entries.map(function(e) {
      if (e.id === id) {
        e.description = newDesc.trim() || e.description;
        e.project = newProj.trim() || e.project;
        e.startTime = startIso;
        e.endTime = endIso;
        e.durationSeconds = durationSec;
        e.rate = rate;
        e.earned = earned;
      }
      return e;
    });

    editingEntryId = null;
    saveEntries();
    renderEntries();
  }

  function renderEntries() {
    var entriesContainer = document.getElementById('entries-container');
    var summaryTime = document.getElementById('summary-total-time');
    var summaryEarned = document.getElementById('summary-total-earned');
    var summaryCount = document.getElementById('summary-total-count');

    entriesContainer.innerHTML = '';

    if (entries.length === 0) {
      entriesContainer.innerHTML = '<div class="todo-empty" style="margin-top:15px;">' +
        '<i class="fas fa-history" style="font-size:1.8rem; color:#cbd5e1; margin-bottom:8px; display:block;"></i>' +
        '<cfif local.isEs>No hay registros de tiempo guardados.<cfelse>No time entries saved yet.</cfif></div>';

      summaryTime.textContent = '00:00:00';
      summaryEarned.textContent = '$0.00';
      summaryCount.textContent = '0';
      return;
    }

    var totalSec = 0;
    var totalMoney = 0;
    var defaultCurr = entries[0] ? entries[0].currency : '$';

    var groups = {};
    entries.forEach(function(e) {
      totalSec += e.durationSeconds;
      totalMoney += (e.earned || 0);

      var dateStr = new Date(e.startTime).toLocaleDateString();
      if (!groups[dateStr]) groups[dateStr] = [];
      groups[dateStr].push(e);
    });

    summaryTime.textContent = formatTimeDigits(totalSec);
    summaryEarned.textContent = defaultCurr + totalMoney.toFixed(2);
    summaryCount.textContent = entries.length;

    Object.keys(groups).forEach(function(dateKey) {
      var groupEntries = groups[dateKey];

      var groupHeader = document.createElement('div');
      groupHeader.className = 'entry-group-date';
      
      var dayTotalSec = groupEntries.reduce(function(acc, item) { return acc + item.durationSeconds; }, 0);
      var dayTotalMoney = groupEntries.reduce(function(acc, item) { return acc + (item.earned || 0); }, 0);

      groupHeader.innerHTML = '<span><i class="far fa-calendar-alt"></i> ' + dateKey + '</span>' +
        '<span style="font-family:monospace;">' + formatTimeDigits(dayTotalSec) + (dayTotalMoney > 0 ? ' (' + defaultCurr + dayTotalMoney.toFixed(2) + ')' : '') + '</span>';

      entriesContainer.appendChild(groupHeader);

      groupEntries.forEach(function(entry) {
        if (editingEntryId === entry.id) {
          var editCard = document.createElement('div');
          editCard.className = 'time-entry-edit-card';

          var editDesc = document.createElement('input');
          editDesc.type = 'text';
          editDesc.value = entry.description;

          var editProj = document.createElement('input');
          editProj.type = 'text';
          editProj.placeholder = '<cfif local.isEs>Proyecto / Cliente...<cfelse>Project / Client...</cfif>';
          editProj.value = entry.project;

          var editDate = document.createElement('input');
          editDate.type = 'date';
          editDate.value = formatDateInput(entry.startTime);

          var editStart = document.createElement('input');
          editStart.type = 'time';
          editStart.value = formatClockTime(entry.startTime);

          var editEnd = document.createElement('input');
          editEnd.type = 'time';
          editEnd.value = formatClockTime(entry.endTime);

          var editRate = document.createElement('input');
          editRate.type = 'number';
          editRate.placeholder = '$/hr';
          editRate.step = '0.5';
          editRate.style.width = '80px';
          editRate.value = entry.rate > 0 ? entry.rate : '';

          var liveCalcBadge = document.createElement('span');
          liveCalcBadge.style.cssText = 'font-weight:700; font-size:0.88rem; color:#16a34a; background:#dcfce7; padding:4px 8px; border-radius:6px;';
          
          function updateLiveCalc() {
            var dStr = editDate.value;
            var sStr = editStart.value;
            var eStr = editEnd.value;
            var rVal = parseFloat(editRate.value) || 0;

            if (dStr && sStr && eStr) {
              var sMs = new Date(dStr + 'T' + sStr + ':00').getTime();
              var eMs = new Date(dStr + 'T' + eStr + ':00').getTime();
              var sec = Math.max(1, Math.floor((eMs - sMs) / 1000));
              var calcEarned = rVal > 0 ? (sec / 3600) * rVal : 0;
              liveCalcBadge.textContent = formatTimeDigits(sec) + (calcEarned > 0 ? ' (' + (entry.currency || '$') + calcEarned.toFixed(2) + ')' : '');
            }
          }

          editDate.addEventListener('input', updateLiveCalc);
          editStart.addEventListener('input', updateLiveCalc);
          editEnd.addEventListener('input', updateLiveCalc);
          editRate.addEventListener('input', updateLiveCalc);
          updateLiveCalc();

          var btnSave = document.createElement('button');
          btnSave.type = 'button';
          btnSave.className = 'btn-social btn-upwork';
          btnSave.style.cssText = 'padding:6px 12px; font-size:0.82rem;';
          btnSave.innerHTML = '<i class="fas fa-check"></i> <cfif local.isEs>Guardar<cfelse>Save</cfif>';
          btnSave.addEventListener('click', function() {
            saveEditedEntry(entry.id, editDesc.value, editProj.value, editDate.value, editStart.value, editEnd.value, editRate.value);
          });

          var btnCancel = document.createElement('button');
          btnCancel.type = 'button';
          btnCancel.className = 'btn-social btn-linkedin';
          btnCancel.style.cssText = 'padding:6px 12px; font-size:0.82rem;';
          btnCancel.innerHTML = '<i class="fas fa-times"></i> <cfif local.isEs>Cancelar<cfelse>Cancel</cfif>';
          btnCancel.addEventListener('click', function() {
            editingEntryId = null;
            renderEntries();
          });

          editCard.appendChild(editDesc);
          editCard.appendChild(editProj);
          editCard.appendChild(editDate);
          editCard.appendChild(editStart);
          editCard.appendChild(editEnd);
          editCard.appendChild(editRate);
          editCard.appendChild(liveCalcBadge);
          editCard.appendChild(btnSave);
          editCard.appendChild(btnCancel);

          entriesContainer.appendChild(editCard);
        } else {
          var card = document.createElement('div');
          card.className = 'time-entry-card';

          var descEl = document.createElement('div');
          descEl.className = 'entry-desc';
          descEl.textContent = entry.description;

          var projEl = document.createElement('span');
          projEl.className = 'project-tag';
          projEl.textContent = entry.project;

          var rangeEl = document.createElement('span');
          rangeEl.className = 'entry-range';
          rangeEl.textContent = formatClockTime(entry.startTime) + ' - ' + formatClockTime(entry.endTime);

          var durEl = document.createElement('span');
          durEl.className = 'entry-duration';
          durEl.textContent = formatTimeDigits(entry.durationSeconds);

          var earnedEl = document.createElement('span');
          earnedEl.className = 'entry-earned';
          if (entry.earned > 0) {
            earnedEl.textContent = entry.currency + entry.earned.toFixed(2);
          } else {
            earnedEl.textContent = '-';
            earnedEl.style.color = '#94a3b8';
          }

          var actionsEl = document.createElement('div');
          actionsEl.style.cssText = 'display:flex; gap:6px;';

          var btnPlay = document.createElement('button');
          btnPlay.type = 'button';
          btnPlay.className = 'btn-icon-edit';
          btnPlay.innerHTML = '<i class="fas fa-play"></i>';
          btnPlay.title = '<cfif local.isEs>Reanudar tarea<cfelse>Resume task</cfif>';
          btnPlay.addEventListener('click', function() { resumeEntry(entry); });

          var btnEdit = document.createElement('button');
          btnEdit.type = 'button';
          btnEdit.className = 'btn-icon-edit';
          btnEdit.innerHTML = '<i class="fas fa-pencil-alt"></i>';
          btnEdit.title = '<cfif local.isEs>Editar registro<cfelse>Edit entry</cfif>';
          btnEdit.addEventListener('click', function() {
            editingEntryId = entry.id;
            renderEntries();
          });

          var btnDel = document.createElement('button');
          btnDel.type = 'button';
          btnDel.className = 'btn-icon-danger';
          btnDel.innerHTML = '<i class="fas fa-trash-alt"></i>';
          btnDel.title = '<cfif local.isEs>Eliminar registro<cfelse>Delete entry</cfif>';
          btnDel.addEventListener('click', function() { deleteEntry(entry.id); });

          actionsEl.appendChild(btnPlay);
          actionsEl.appendChild(btnEdit);
          actionsEl.appendChild(btnDel);

          card.appendChild(descEl);
          card.appendChild(projEl);
          card.appendChild(rangeEl);
          card.appendChild(durEl);
          card.appendChild(earnedEl);
          card.appendChild(actionsEl);

          entriesContainer.appendChild(card);
        }
      });
    });
  }

  document.getElementById('btn-clear-entries').addEventListener('click', function() {
    if (confirm('<cfif local.isEs>¿Seguro que querés borrar todos los registros de tiempo?<cfelse>Are you sure you want to clear all time entries?</cfif>')) {
      entries = [];
      saveEntries();
      renderEntries();
    }
  });

  document.getElementById('btn-export-csv').addEventListener('click', function() {
    if (entries.length === 0) return;
    var csv = 'ID,Description,Project,StartTime,EndTime,DurationSeconds,Rate,Earned\n';
    entries.forEach(function(e) {
      csv += [
        e.id,
        '"' + (e.description || '').replace(/"/g, '""') + '"',
        '"' + (e.project || '').replace(/"/g, '""') + '"',
        e.startTime,
        e.endTime,
        e.durationSeconds,
        e.rate || 0,
        (e.earned || 0).toFixed(2)
      ].join(',') + '\n';
    });

    var blob = new Blob([csv], { type: 'text/csv' });
    var url = URL.createObjectURL(blob);
    var a = document.createElement('a');
    a.href = url;
    a.download = 'time-entries.csv';
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
  });

  renderEntries();
})();
</script>
