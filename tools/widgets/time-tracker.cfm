<div class="tool-widget widget-time-tracker">
  <!-- Top Timer Banner (Clockify Style) -->
  <div class="timer-banner">
    <input type="text" id="tracker-desc" placeholder="<cfif local.isEs>¿En qué estás trabajando?<cfelse>What are you working on?</cfif>" spellcheck="false">

    <select id="tracker-project">
      <option value="General">📁 General</option>
      <option value="CFML Dev">⚡ CFML Dev</option>
      <option value="Web Design">🎨 Web Design</option>
      <option value="Client Work" selected>💼 Client Work</option>
      <option value="Bugfix">🐛 Bugfix</option>
    </select>

    <div style="display:flex; align-items:center; gap:6px;">
      <select id="tracker-currency" style="width:70px;">
        <option value="$">$ USD</option>
        <option value="€">€ EUR</option>
        <option value="ARS$">$ ARS</option>
        <option value="R$">R$ BRL</option>
        <option value="£">£ GBP</option>
      </select>
      <input type="number" id="tracker-rate" placeholder="<cfif local.isEs>$/hora (opcional)<cfelse>$/hr (optional)</cfif>" step="0.5" min="0" style="width:110px;">
    </div>

    <div class="timer-clock-box">
      <span class="timer-digits" id="timer-digits">00:00:00</span>
      <span class="live-earnings-badge" id="live-earnings-badge" style="display:none;">$0.00</span>
    </div>

    <button type="button" class="btn-timer-toggle btn-timer-start" id="btn-timer-toggle">
      <i class="fas fa-play"></i> <span id="lbl-timer-action"><cfif local.isEs>INICIAR<cfelse>START</cfif></span>
    </button>
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
  var ACTIVE_TIMER_KEY = 'cfexpert_tracker_active_timer';

  var inputDesc = document.getElementById('tracker-desc');
  var selectProject = document.getElementById('tracker-project');
  var selectCurrency = document.getElementById('tracker-currency');
  var inputRate = document.getElementById('tracker-rate');

  var timerDigits = document.getElementById('timer-digits');
  var liveEarnings = document.getElementById('live-earnings-badge');
  var btnToggle = document.getElementById('btn-timer-toggle');
  var lblAction = document.getElementById('lbl-timer-action');

  var summaryTime = document.getElementById('summary-total-time');
  var summaryEarned = document.getElementById('summary-total-earned');
  var summaryCount = document.getElementById('summary-total-count');

  var entriesContainer = document.getElementById('entries-container');
  var btnExport = document.getElementById('btn-export-csv');
  var btnClear = document.getElementById('btn-clear-entries');

  var intervalId = null;
  var activeTimer = loadActiveTimer();
  var entries = loadEntries();
  var editingEntryId = null;

  function loadActiveTimer() {
    try {
      var data = localStorage.getItem(ACTIVE_TIMER_KEY);
      return data ? JSON.parse(data) : null;
    } catch(e) { return null; }
  }

  function saveActiveTimer() {
    try {
      if (activeTimer) {
        localStorage.setItem(ACTIVE_TIMER_KEY, JSON.stringify(activeTimer));
      } else {
        localStorage.removeItem(ACTIVE_TIMER_KEY);
      }
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

  function updateTimerUI() {
    if (!activeTimer) {
      timerDigits.textContent = '00:00:00';
      liveEarnings.style.display = 'none';
      btnToggle.className = 'btn-timer-toggle btn-timer-start';
      btnToggle.innerHTML = '<i class="fas fa-play"></i> <span><cfif local.isEs>INICIAR<cfelse>START</cfif></span>';
      return;
    }

    var elapsedSec = Math.floor((Date.now() - new Date(activeTimer.startTime).getTime()) / 1000);
    if (elapsedSec < 0) elapsedSec = 0;

    timerDigits.textContent = formatTimeDigits(elapsedSec);

    var rate = parseFloat(activeTimer.rate) || 0;
    var curr = activeTimer.currency || '$';

    if (rate > 0) {
      var earned = (elapsedSec / 3600) * rate;
      liveEarnings.textContent = curr + earned.toFixed(2);
      liveEarnings.style.display = 'inline-block';
    } else {
      liveEarnings.style.display = 'none';
    }

    btnToggle.className = 'btn-timer-toggle btn-timer-stop';
    btnToggle.innerHTML = '<i class="fas fa-stop"></i> <span><cfif local.isEs>DETENER<cfelse>STOP</cfif></span>';
  }

  function startTimer(desc, proj, rate, curr) {
    activeTimer = {
      description: desc || '<cfif local.isEs>Sin descripción<cfelse>No description</cfif>',
      project: proj || 'General',
      rate: rate || 0,
      currency: curr || '$',
      startTime: new Date().toISOString()
    };

    saveActiveTimer();
    updateTimerUI();

    if (intervalId) clearInterval(intervalId);
    intervalId = setInterval(updateTimerUI, 1000);
  }

  function stopTimer() {
    if (!activeTimer) return;

    var endTime = new Date().toISOString();
    var durationSec = Math.floor((new Date(endTime).getTime() - new Date(activeTimer.startTime).getTime()) / 1000);
    if (durationSec < 1) durationSec = 1;

    var rate = parseFloat(activeTimer.rate) || 0;
    var earned = rate > 0 ? (durationSec / 3600) * rate : 0;

    var newEntry = {
      id: Date.now(),
      description: inputDesc.value.trim() || activeTimer.description,
      project: selectProject.value || activeTimer.project,
      rate: rate,
      currency: selectCurrency.value || activeTimer.currency,
      startTime: activeTimer.startTime,
      endTime: endTime,
      durationSeconds: durationSec,
      earned: earned
    };

    entries.unshift(newEntry);
    saveEntries();

    activeTimer = null;
    saveActiveTimer();

    if (intervalId) clearInterval(intervalId);
    intervalId = null;

    inputDesc.value = '';
    updateTimerUI();
    renderEntries();
  }

  btnToggle.addEventListener('click', function() {
    if (activeTimer) {
      stopTimer();
    } else {
      var desc = inputDesc.value.trim();
      var proj = selectProject.value;
      var rate = parseFloat(inputRate.value) || 0;
      var curr = selectCurrency.value;
      startTimer(desc, proj, rate, curr);
    }
  });

  function deleteEntry(id) {
    entries = entries.filter(function(e) { return e.id !== id; });
    saveEntries();
    renderEntries();
  }

  function resumeEntry(entry) {
    if (activeTimer) stopTimer();

    inputDesc.value = entry.description;
    selectProject.value = entry.project;
    inputRate.value = entry.rate > 0 ? entry.rate : '';
    selectCurrency.value = entry.currency || '$';

    startTimer(entry.description, entry.project, entry.rate, entry.currency);
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
        e.project = newProj;
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

    // Group entries by date
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
          // Render Inline Edit Row
          var editCard = document.createElement('div');
          editCard.className = 'time-entry-edit-card';

          var editDesc = document.createElement('input');
          editDesc.type = 'text';
          editDesc.value = entry.description;

          var editProj = document.createElement('select');
          editProj.innerHTML = 
            '<option value="General"' + (entry.project === 'General' ? ' selected' : '') + '>📁 General</option>' +
            '<option value="CFML Dev"' + (entry.project === 'CFML Dev' ? ' selected' : '') + '>⚡ CFML Dev</option>' +
            '<option value="Web Design"' + (entry.project === 'Web Design' ? ' selected' : '') + '>🎨 Web Design</option>' +
            '<option value="Client Work"' + (entry.project === 'Client Work' ? ' selected' : '') + '>💼 Client Work</option>' +
            '<option value="Bugfix"' + (entry.project === 'Bugfix' ? ' selected' : '') + '>🐛 Bugfix</option>';

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
          // Render Normal Entry Card
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

  btnClear.addEventListener('click', function() {
    if (confirm('<cfif local.isEs>¿Seguro que querés borrar todos los registros de tiempo?<cfelse>Are you sure you want to clear all time entries?</cfif>')) {
      entries = [];
      saveEntries();
      renderEntries();
    }
  });

  btnExport.addEventListener('click', function() {
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

  // Resume active timer if any
  if (activeTimer) {
    inputDesc.value = activeTimer.description || '';
    selectProject.value = activeTimer.project || 'General';
    inputRate.value = activeTimer.rate > 0 ? activeTimer.rate : '';
    selectCurrency.value = activeTimer.currency || '$';

    updateTimerUI();
    intervalId = setInterval(updateTimerUI, 1000);
  }

  renderEntries();
})();
</script>
