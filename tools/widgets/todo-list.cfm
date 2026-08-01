<div class="tool-widget widget-todo-list">
  <!-- Progress Header -->
  <div class="todo-header-bar">
    <div class="progress-container">
      <div style="display:flex; justify-content:space-between; font-size:0.88rem; font-weight:700; color:#334155;">
        <span><cfif local.isEs>Progreso de Tareas<cfelse>Task Progress</cfif></span>
        <span id="todo-stats-text">0 / 0 (0%)</span>
      </div>
      <div class="progress-bar-bg">
        <div class="progress-bar-fill" id="todo-progress-fill"></div>
      </div>
    </div>

    <div style="display:flex; gap:8px;">
      <button type="button" class="btn-social btn-linkedin" id="btn-export-tasks" title="<cfif local.isEs>Exportar JSON<cfelse>Export JSON</cfif>">
        <i class="fas fa-file-export"></i> <cfif local.isEs>Exportar<cfelse>Export</cfif>
      </button>
      <label for="input-import-tasks" class="btn-social btn-linkedin" style="cursor:pointer; margin:0;" title="<cfif local.isEs>Importar JSON<cfelse>Import JSON</cfif>">
        <i class="fas fa-file-import"></i> <cfif local.isEs>Importar<cfelse>Import</cfif>
      </label>
      <input type="file" id="input-import-tasks" accept=".json" style="display:none;">
    </div>
  </div>

  <!-- Input Form -->
  <div class="todo-input-card">
    <input type="text" id="todo-new-input" placeholder="<cfif local.isEs>Escrib&iacute; una nueva tarea y presion&aacute; Enter...<cfelse>Type a new task and press Enter...</cfif>" spellcheck="false">
    
    <select id="todo-new-priority">
      <option value="high"><cfif local.isEs>Prioridad Alta<cfelse>High Priority</cfif></option>
      <option value="medium" selected><cfif local.isEs>Prioridad Media<cfelse>Medium Priority</cfif></option>
      <option value="low"><cfif local.isEs>Prioridad Baja<cfelse>Low Priority</cfif></option>
    </select>

    <select id="todo-new-category">
      <option value="Work"><cfif local.isEs>Trabajo<cfelse>Work</cfif></option>
      <option value="Personal" selected>Personal</option>
      <option value="Shopping"><cfif local.isEs>Compras<cfelse>Shopping</cfif></option>
      <option value="Project"><cfif local.isEs>Proyecto<cfelse>Project</cfif></option>
    </select>

    <button type="button" class="btn-social btn-upwork" id="btn-add-task">
      <i class="fas fa-plus"></i> <cfif local.isEs>Agregar<cfelse>Add</cfif>
    </button>
  </div>

  <!-- Filter & Search Bar -->
  <div class="todo-filter-bar">
    <div class="filter-tabs">
      <button type="button" class="filter-tab-btn active" data-filter="all"><cfif local.isEs>Todas<cfelse>All</cfif></button>
      <button type="button" class="filter-tab-btn" data-filter="active"><cfif local.isEs>Pendientes<cfelse>Active</cfif></button>
      <button type="button" class="filter-tab-btn" data-filter="completed"><cfif local.isEs>Completadas<cfelse>Completed</cfif></button>
    </div>

    <div style="display:flex; gap:10px; flex:1; max-width:320px;">
      <input type="text" id="todo-search" placeholder="<cfif local.isEs>Buscar tareas...<cfelse>Search tasks...</cfif>" style="padding:6px 12px; border:1px solid #cbd5e1; border-radius:6px; font-size:0.85rem; width:100%;">
    </div>

    <div style="display:flex; gap:8px;">
      <button type="button" class="btn-social btn-linkedin" id="btn-clear-completed" style="font-size:0.78rem; padding:4px 10px;">
        <i class="fas fa-broom"></i> <cfif local.isEs>Borrar completadas<cfelse>Clear completed</cfif>
      </button>
    </div>
  </div>

  <!-- Tasks List Container -->
  <div class="todo-list-container" id="todo-list-container">
    <!-- Tasks dynamically rendered here -->
  </div>
</div>

<script>
(function() {
  var STORAGE_KEY = 'cfexpert_todo_tasks';

  var inputNew = document.getElementById('todo-new-input');
  var selectPriority = document.getElementById('todo-new-priority');
  var selectCategory = document.getElementById('todo-new-category');
  var btnAdd = document.getElementById('btn-add-task');

  var container = document.getElementById('todo-list-container');
  var statsText = document.getElementById('todo-stats-text');
  var progressFill = document.getElementById('todo-progress-fill');
  var searchInput = document.getElementById('todo-search');

  var btnClearCompleted = document.getElementById('btn-clear-completed');
  var btnExport = document.getElementById('btn-export-tasks');
  var inputImport = document.getElementById('input-import-tasks');

  var filterBtns = document.querySelectorAll('.widget-todo-list .filter-tab-btn');

  var tasks = loadTasks();
  var currentFilter = 'all';
  var editingTaskId = null;

  function loadTasks() {
    try {
      var data = localStorage.getItem(STORAGE_KEY);
      return data ? JSON.parse(data) : [
        { id: 1, text: '<cfif local.isEs>Revisar requerimientos del proyecto<cfelse>Review project requirements</cfif>', priority: 'high', category: 'Work', completed: false, createdAt: new Date().toISOString() },
        { id: 2, text: '<cfif local.isEs>Probar herramientas de ColdFusion Expert<cfelse>Test ColdFusion Expert tools</cfif>', priority: 'medium', category: 'Project', completed: true, createdAt: new Date().toISOString() }
      ];
    } catch(e) {
      return [];
    }
  }

  function saveTasks() {
    try {
      localStorage.setItem(STORAGE_KEY, JSON.stringify(tasks));
    } catch(e) {}
  }

  function addTask() {
    var text = inputNew.value.trim();
    if (!text) return;

    var newTask = {
      id: Date.now(),
      text: text,
      priority: selectPriority.value,
      category: selectCategory.value,
      completed: false,
      createdAt: new Date().toISOString()
    };

    tasks.unshift(newTask);
    saveTasks();
    inputNew.value = '';
    render();
  }

  function toggleTask(id) {
    tasks = tasks.map(function(t) {
      if (t.id === id) t.completed = !t.completed;
      return t;
    });
    saveTasks();
    render();
  }

  function deleteTask(id) {
    tasks = tasks.filter(function(t) { return t.id !== id; });
    saveTasks();
    render();
  }

  function saveEditedTask(id, newText, newPrio, newCat) {
    var trimmed = newText.trim();
    if (!trimmed) return;

    tasks = tasks.map(function(t) {
      if (t.id === id) {
        t.text = trimmed;
        t.priority = newPrio;
        t.category = newCat;
      }
      return t;
    });
    editingTaskId = null;
    saveTasks();
    render();
  }

  function render() {
    var searchKeyword = searchInput.value.toLowerCase().trim();

    var filtered = tasks.filter(function(t) {
      if (currentFilter === 'active' && t.completed) return false;
      if (currentFilter === 'completed' && !t.completed) return false;
      if (searchKeyword && t.text.toLowerCase().indexOf(searchKeyword) === -1) return false;
      return true;
    });

    container.innerHTML = '';

    if (filtered.length === 0) {
      var emptyMsg = document.createElement('div');
      emptyMsg.className = 'todo-empty';
      emptyMsg.innerHTML = '<i class="fas fa-clipboard-check" style="font-size:1.8rem; margin-bottom:8px; color:#cbd5e1; display:block;"></i>' +
        '<cfif local.isEs>No hay tareas para mostrar.<cfelse>No tasks to show.</cfif>';
      container.appendChild(emptyMsg);
    } else {
      filtered.forEach(function(t) {
        if (editingTaskId === t.id) {
          // Render Inline Edit Row
          var editRow = document.createElement('div');
          editRow.className = 'todo-item-edit';

          var editInput = document.createElement('input');
          editInput.type = 'text';
          editInput.value = t.text;

          var editPrio = document.createElement('select');
          editPrio.innerHTML = 
            '<option value="high"' + (t.priority === 'high' ? ' selected' : '') + '><cfif local.isEs>Alta<cfelse>High</cfif></option>' +
            '<option value="medium"' + (t.priority === 'medium' ? ' selected' : '') + '><cfif local.isEs>Media<cfelse>Medium</cfif></option>' +
            '<option value="low"' + (t.priority === 'low' ? ' selected' : '') + '><cfif local.isEs>Baja<cfelse>Low</cfif></option>';

          var editCat = document.createElement('select');
          editCat.innerHTML = 
            '<option value="Work"' + (t.category === 'Work' ? ' selected' : '') + '><cfif local.isEs>Trabajo<cfelse>Work</cfif></option>' +
            '<option value="Personal"' + (t.category === 'Personal' ? ' selected' : '') + '>Personal</option>' +
            '<option value="Shopping"' + (t.category === 'Shopping' ? ' selected' : '') + '><cfif local.isEs>Compras<cfelse>Shopping</cfif></option>' +
            '<option value="Project"' + (t.category === 'Project' ? ' selected' : '') + '><cfif local.isEs>Proyecto<cfelse>Project</cfif></option>';

          var btnSave = document.createElement('button');
          btnSave.type = 'button';
          btnSave.className = 'btn-social btn-upwork';
          btnSave.style.cssText = 'padding:6px 12px; font-size:0.82rem;';
          btnSave.innerHTML = '<i class="fas fa-check"></i> <cfif local.isEs>Guardar<cfelse>Save</cfif>';
          btnSave.addEventListener('click', function() {
            saveEditedTask(t.id, editInput.value, editPrio.value, editCat.value);
          });

          editInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
              saveEditedTask(t.id, editInput.value, editPrio.value, editCat.value);
            }
          });

          var btnCancel = document.createElement('button');
          btnCancel.type = 'button';
          btnCancel.className = 'btn-social btn-linkedin';
          btnCancel.style.cssText = 'padding:6px 12px; font-size:0.82rem;';
          btnCancel.innerHTML = '<i class="fas fa-times"></i> <cfif local.isEs>Cancelar<cfelse>Cancel</cfif>';
          btnCancel.addEventListener('click', function() {
            editingTaskId = null;
            render();
          });

          editRow.appendChild(editInput);
          editRow.appendChild(editPrio);
          editRow.appendChild(editCat);
          editRow.appendChild(btnSave);
          editRow.appendChild(btnCancel);

          container.appendChild(editRow);
        } else {
          // Render Normal Task Row
          var item = document.createElement('div');
          item.className = 'todo-item' + (t.completed ? ' completed' : '');

          var chk = document.createElement('input');
          chk.type = 'checkbox';
          chk.className = 'todo-checkbox';
          chk.checked = t.completed;
          chk.addEventListener('change', function() { toggleTask(t.id); });

          var txt = document.createElement('span');
          txt.className = 'todo-text';
          txt.textContent = t.text;

          var prioLabel = t.priority === 'high' ? '<cfif local.isEs>Alta<cfelse>High</cfif>' : (t.priority === 'medium' ? '<cfif local.isEs>Media<cfelse>Medium</cfif>' : '<cfif local.isEs>Baja<cfelse>Low</cfif>');
          var prioBadge = document.createElement('span');
          prioBadge.className = 'priority-badge priority-' + t.priority;
          prioBadge.textContent = prioLabel;

          var catBadge = document.createElement('span');
          catBadge.className = 'category-badge';
          catBadge.textContent = t.category;

          var btnPlay = document.createElement('button');
          btnPlay.type = 'button';
          btnPlay.className = 'btn-icon-play';
          btnPlay.innerHTML = '<i class="fas fa-play"></i>';
          btnPlay.title = '<cfif local.isEs>Iniciar en Time Tracker<cfelse>Start in Time Tracker</cfif>';
          btnPlay.addEventListener('click', function() {
            startTaskInTimeTracker(t);
          });

          var btnEdit = document.createElement('button');
          btnEdit.type = 'button';
          btnEdit.className = 'btn-icon-edit';
          btnEdit.innerHTML = '<i class="fas fa-pencil-alt"></i>';
          btnEdit.title = '<cfif local.isEs>Editar tarea<cfelse>Edit task</cfif>';
          btnEdit.addEventListener('click', function() {
            editingTaskId = t.id;
            render();
          });

          var btnDel = document.createElement('button');
          btnDel.type = 'button';
          btnDel.className = 'btn-icon-danger';
          btnDel.innerHTML = '<i class="fas fa-trash-alt"></i>';
          btnDel.title = '<cfif local.isEs>Eliminar<cfelse>Delete</cfif>';
          btnDel.addEventListener('click', function() { deleteTask(t.id); });

          item.appendChild(chk);
          item.appendChild(txt);
          item.appendChild(prioBadge);
          item.appendChild(catBadge);
          item.appendChild(btnPlay);
          item.appendChild(btnEdit);
          item.appendChild(btnDel);

          container.appendChild(item);
        }
      });
    }

  function startTaskInTimeTracker(t) {
    var MULTI_TIMERS_KEY = 'cfexpert_tracker_multi_timers';
    var multiTimers = { 1: null, 2: null, 3: null, 4: null, 5: null };
    try {
      var data = localStorage.getItem(MULTI_TIMERS_KEY);
      if (data) multiTimers = JSON.parse(data);
    } catch(e) {}

    // Find first idle slot among 1, 2, 3 or fallback to slot 1
    var targetSlot = 1;
    for (var s = 1; s <= 3; s++) {
      if (!multiTimers[s] || !multiTimers[s].startTime) {
        targetSlot = s;
        break;
      }
    }

    multiTimers[targetSlot] = {
      description: t.text,
      project: t.category || 'General',
      rate: 0,
      currency: '$',
      startTime: new Date().toISOString()
    };

    try {
      localStorage.setItem(MULTI_TIMERS_KEY, JSON.stringify(multiTimers));
    } catch(e) {}

    window.location.href = '/tools/time-tracker.cfm?slot=' + targetSlot;
  }

    // Update Metrics
    var total = tasks.length;
    var completed = tasks.filter(function(t) { return t.completed; }).length;
    var percent = total > 0 ? Math.round((completed / total) * 100) : 0;

    statsText.textContent = completed + ' / ' + total + ' (' + percent + '%)';
    progressFill.style.width = percent + '%';
  }

  // Event Listeners
  btnAdd.addEventListener('click', addTask);
  inputNew.addEventListener('keypress', function(e) {
    if (e.key === 'Enter') addTask();
  });

  searchInput.addEventListener('input', render);

  filterBtns.forEach(function(btn) {
    btn.addEventListener('click', function() {
      filterBtns.forEach(function(b) { b.classList.remove('active'); });
      this.classList.add('active');
      currentFilter = this.dataset.filter;
      render();
    });
  });

  btnClearCompleted.addEventListener('click', function() {
    tasks = tasks.filter(function(t) { return !t.completed; });
    saveTasks();
    render();
  });

  btnExport.addEventListener('click', function() {
    var blob = new Blob([JSON.stringify(tasks, null, 2)], { type: 'application/json' });
    var url = URL.createObjectURL(blob);
    var a = document.createElement('a');
    a.href = url;
    a.download = 'todo-tasks.json';
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
  });

  inputImport.addEventListener('change', function() {
    if (!this.files || !this.files[0]) return;
    var reader = new FileReader();
    reader.onload = function(e) {
      try {
        var imported = JSON.parse(e.target.result);
        if (Array.isArray(imported)) {
          tasks = imported;
          saveTasks();
          render();
        }
      } catch(err) {
        alert('<cfif local.isEs>El archivo JSON no es válido.<cfelse>Invalid JSON file.</cfif>');
      }
    };
    reader.readAsText(this.files[0]);
  });

  // Initial render
  render();
})();
</script>
