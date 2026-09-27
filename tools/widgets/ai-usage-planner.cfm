<cfprocessingdirective pageencoding="utf-8">
<style>
  .widget-ai-usage-planner .aip-topbar { display:flex; flex-wrap:wrap; justify-content:space-between; align-items:center; gap:12px; margin-bottom:20px; }
  .widget-ai-usage-planner .aip-privacy { color:#5a5a5a; font-size:.86rem; margin:0; display:flex; align-items:center; gap:6px; }
  .widget-ai-usage-planner .aip-privacy i { color:#13aff0; }
  .widget-ai-usage-planner .aip-topbar-actions { display:flex; gap:8px; flex-wrap:wrap; }
  .widget-ai-usage-planner .aip-topbar-actions .btn-social { margin:0; }
  .widget-ai-usage-planner .aip-import-label { cursor:pointer; }

  .widget-ai-usage-planner .aip-tabs { display:flex; flex-wrap:wrap; gap:8px; border-bottom:2px solid #e2e8f0; padding-bottom:8px; margin-bottom:22px; }
  .widget-ai-usage-planner .aip-tab-btn { padding:8px 16px; border:none; background:transparent; font-weight:600; font-size:.9rem; color:#64748b; border-radius:8px; cursor:pointer; transition:all .2s ease; }
  .widget-ai-usage-planner .aip-tab-btn:hover { color:#13aff0; background:rgba(19,175,240,.06); }
  .widget-ai-usage-planner .aip-tab-btn.active { color:#fff; background:#13aff0; }

  .widget-ai-usage-planner .aip-panel { display:none; }
  .widget-ai-usage-planner .aip-panel.active { display:block; }

  .widget-ai-usage-planner .aip-panel-head { display:flex; flex-wrap:wrap; justify-content:space-between; align-items:center; gap:12px; margin-bottom:16px; }
  .widget-ai-usage-planner .aip-panel-head h3 { font-size:1.15rem; font-weight:800; color:#1e293b; margin:0 0 4px; }
  .widget-ai-usage-planner .aip-panel-head p { color:#64748b; font-size:.86rem; margin:0; }
  .widget-ai-usage-planner .aip-panel-head .btn-social { margin:0; }

  .widget-ai-usage-planner .aip-stats-row { display:grid; grid-template-columns:repeat(3,minmax(0,1fr)); gap:14px; margin-bottom:20px; }
  .widget-ai-usage-planner .aip-stat { background:#f8fafc; border:1px solid #e2e8f0; border-radius:12px; padding:16px 18px; }
  .widget-ai-usage-planner .aip-stat small { display:block; color:#64748b; font-weight:700; font-size:.72rem; text-transform:uppercase; letter-spacing:.04em; margin-bottom:6px; }
  .widget-ai-usage-planner .aip-stat strong { display:block; font-size:1.5rem; color:#1e293b; }
  .widget-ai-usage-planner .aip-stat-note { display:block; color:#64748b; font-size:.76rem; margin-top:2px; }

  .widget-ai-usage-planner .aip-intro { display:grid; grid-template-columns:1.4fr 1fr; gap:20px; align-items:stretch; margin-bottom:20px; }
  .widget-ai-usage-planner .aip-intro-main { background:#f8fafc; border:1px solid #e2e8f0; border-radius:16px; padding:26px; }
  .widget-ai-usage-planner .aip-kicker { color:#13aff0; font-weight:800; font-size:.72rem; letter-spacing:.08em; text-transform:uppercase; margin:0 0 8px; }
  .widget-ai-usage-planner .aip-intro-main h3 { font-size:1.3rem; color:#1e293b; margin:0 0 10px; }
  .widget-ai-usage-planner .aip-intro-main p { color:#5a5a5a; margin:0 0 18px; line-height:1.55; }
  .widget-ai-usage-planner .aip-intro-side { background:#fff; border:1px solid #e2e8f0; border-radius:16px; padding:22px; display:flex; flex-direction:column; justify-content:center; }
  .widget-ai-usage-planner .aip-intro-side i { color:#13aff0; font-size:1.5rem; margin-bottom:8px; }
  .widget-ai-usage-planner .aip-intro-side strong { display:block; font-size:1.02rem; color:#1e293b; margin:2px 0 6px; }
  .widget-ai-usage-planner .aip-intro-side p { color:#5a5a5a; font-size:.85rem; margin:0; }
  @media (max-width:800px){ .widget-ai-usage-planner .aip-intro{grid-template-columns:1fr;} }

  .widget-ai-usage-planner .aip-empty { padding:38px 18px; text-align:center; border:1px dashed #cbd5e1; border-radius:16px; background:#f8fafc; }
  .widget-ai-usage-planner .aip-empty i { color:#13aff0; font-size:1.8rem; margin-bottom:10px; display:block; }
  .widget-ai-usage-planner .aip-empty h4 { font-size:1.05rem; color:#1e293b; margin:0 0 6px; }
  .widget-ai-usage-planner .aip-empty p { color:#64748b; font-size:.87rem; max-width:440px; margin:0 auto 16px; }

  .widget-ai-usage-planner .aip-cards { display:grid; grid-template-columns:repeat(auto-fill,minmax(270px,1fr)); gap:16px; }
  .widget-ai-usage-planner .aip-status-filters { display:flex; flex-wrap:wrap; gap:8px; margin:0 0 16px; }
  .widget-ai-usage-planner .aip-status-filter-btn { display:inline-flex; align-items:center; gap:6px; padding:7px 14px; font-size:.82rem; font-weight:700; border-radius:999px; border:1px solid #cbd5e1; background:#fff; color:#475569; cursor:pointer; transition:all .2s ease; }
  .widget-ai-usage-planner .aip-status-filter-btn:hover { border-color:#13aff0; color:#13aff0; }
  .widget-ai-usage-planner .aip-status-filter-btn .aip-filter-count { display:inline-flex; align-items:center; justify-content:center; min-width:18px; height:18px; padding:0 5px; border-radius:999px; background:#f1f5f9; color:#475569; font-size:.72rem; font-weight:800; }
  .widget-ai-usage-planner .aip-status-filter-btn.active { background:#13aff0; border-color:#13aff0; color:#fff; }
  .widget-ai-usage-planner .aip-status-filter-btn.active .aip-filter-count { background:rgba(255,255,255,.25); color:#fff; }
  .widget-ai-usage-planner .aip-status-filter-btn[data-aip-filter="good"].active { background:#16a34a; border-color:#16a34a; }
  .widget-ai-usage-planner .aip-status-filter-btn[data-aip-filter="warn"].active { background:#d97706; border-color:#d97706; }
  .widget-ai-usage-planner .aip-status-filter-btn[data-aip-filter="bad"].active { background:#dc2626; border-color:#dc2626; }
  .widget-ai-usage-planner .aip-ai-card { background:#fff; border:1px solid #e2e8f0; border-radius:14px; padding:20px; display:flex; flex-direction:column; }
  .widget-ai-usage-planner .aip-add-card { align-items:center; justify-content:center; gap:10px; min-height:170px; background:#ccfbf1; border:2px dashed #5eead4; color:#0f766e; cursor:pointer; font:inherit; }
  .widget-ai-usage-planner .aip-add-card:hover { background:#99f6e4; border-color:#2dd4bf; }
  .widget-ai-usage-planner .aip-add-card:focus-visible { outline:2px solid #0f766e; outline-offset:2px; }
  .widget-ai-usage-planner .aip-add-card-icon { display:flex; align-items:center; justify-content:center; width:44px; height:44px; border-radius:50%; background:#5eead4; color:#0f766e; font-size:1.2rem; }
  .widget-ai-usage-planner .aip-add-card span { font-weight:800; font-size:.9rem; }
  .widget-ai-usage-planner .aip-drag-handle { display:inline-flex; align-items:center; gap:5px; height:22px; padding:0 6px 0 3px; border-radius:6px; color:#94a3b8; cursor:grab; flex:0 0 auto; }
  .widget-ai-usage-planner .aip-drag-handle-label { font-weight:500; font-size:.74rem; color:#94a3b8; }
  .widget-ai-usage-planner .aip-drag-handle:hover { color:#13aff0; background:rgba(19,175,240,.08); }
  .widget-ai-usage-planner .aip-drag-handle:active { cursor:grabbing; }
  .widget-ai-usage-planner .aip-ai-card.aip-dragging, .widget-ai-usage-planner .aip-list-item.aip-dragging { opacity:.4; }
  .widget-ai-usage-planner [data-aip-ai-id].aip-drag-over-before { box-shadow:inset 0 3px 0 0 #13aff0; }
  .widget-ai-usage-planner [data-aip-ai-id].aip-drag-over-after { box-shadow:inset 0 -3px 0 0 #13aff0; }
  .widget-ai-usage-planner .aip-card-head { display:flex; flex-direction:column; gap:6px; margin-bottom:6px; }
  .widget-ai-usage-planner .aip-card-head-top { display:flex; justify-content:space-between; align-items:center; gap:10px; }
  .widget-ai-usage-planner .aip-ai-name { font-size:1.04rem; font-weight:800; color:#1e293b; margin:0; }
  .widget-ai-usage-planner .aip-ai-meta { color:#64748b; font-size:.78rem; margin:3px 0 0; }
  .widget-ai-usage-planner .aip-ai-title-row { display:inline-flex; align-items:center; gap:8px; min-width:0; }
  .widget-ai-usage-planner .aip-ai-icon { display:inline-flex; align-items:center; justify-content:center; width:26px; height:26px; border-radius:8px; flex:0 0 auto; }
  .widget-ai-usage-planner .aip-ai-icon svg { width:15px; height:15px; fill:currentColor; }
  .widget-ai-usage-planner .aip-ai-icon.codex { font-size:.8rem; }
  .widget-ai-usage-planner .aip-ai-icon.claude { background:#fdf1ec; color:#D97757; }
  .widget-ai-usage-planner .aip-ai-icon.gemini { background:#f2effa; color:#8E75B2; }
  .widget-ai-usage-planner .aip-ai-icon.codex { background:#f1f5f9; color:#64748b; }
  .widget-ai-usage-planner .aip-ai-icon-sm { width:20px; height:20px; border-radius:6px; }
  .widget-ai-usage-planner .aip-ai-icon-sm svg { width:11px; height:11px; }
  .widget-ai-usage-planner .aip-ai-icon-sm.codex { font-size:.68rem; }
  .widget-ai-usage-planner .aip-health { border-radius:999px; padding:4px 10px; font-size:.68rem; font-weight:800; white-space:nowrap; text-transform:uppercase; letter-spacing:.02em; }
  .widget-ai-usage-planner .aip-health.good { color:#16a34a; background:#f0fdf4; }
  .widget-ai-usage-planner .aip-health.warn { color:#d97706; background:#fffbeb; }
  .widget-ai-usage-planner .aip-health.bad { color:#dc2626; background:#fef2f2; }

  .widget-ai-usage-planner .aip-limit { border-top:1px solid #edf1f5; padding-top:12px; margin-top:12px; }
  .widget-ai-usage-planner .aip-limit:first-of-type { border-top:0; padding-top:0; margin-top:6px; }
  .widget-ai-usage-planner .aip-limit-head { display:flex; justify-content:space-between; gap:8px; font-size:.8rem; margin-bottom:6px; color:#475569; }
  .widget-ai-usage-planner .aip-limit-head strong { font-size:.86rem; color:#1e293b; }
  .widget-ai-usage-planner .aip-progress { height:8px; background:#eef1f5; border-radius:99px; overflow:hidden; position:relative; }
  .widget-ai-usage-planner .aip-progress-bar { height:100%; border-radius:99px; background:#16a34a; transition:width .25s ease; }
  .widget-ai-usage-planner .aip-progress-bar.warn { background:#d97706; }
  .widget-ai-usage-planner .aip-progress-bar.bad { background:#dc2626; }
  .widget-ai-usage-planner .aip-progress-today { position:absolute; top:0; height:100%; background:#2dd4bf; transition:left .25s ease,width .25s ease; }
  .widget-ai-usage-planner .aip-limit-details { display:grid; grid-template-columns:repeat(2,minmax(0,1fr)); gap:6px 10px; margin-top:9px; color:#64748b; font-size:.73rem; }
  .widget-ai-usage-planner .aip-limit-details span { display:block; }
  .widget-ai-usage-planner .aip-limit-details b { display:block; color:#1e293b; font-size:.8rem; font-weight:700; }
  .widget-ai-usage-planner .aip-limit-details b.aip-reset-value { display:flex; align-items:center; gap:6px; margin-top:2px; }
  .widget-ai-usage-planner .aip-reset-ring { width:16px; height:16px; border-radius:50%; display:inline-block; flex:0 0 auto; box-shadow:inset 0 0 0 1px rgba(15,23,42,.12); }

  .widget-ai-usage-planner .aip-card-actions { display:flex; gap:8px; margin-top:16px; align-items:center; }
  .widget-ai-usage-planner .aip-card-actions .aip-card-update-btn { margin:0; width:auto; flex:1; }
  .widget-ai-usage-planner .aip-card-update-btn { margin:16px 0 0; width:100%; text-align:center; }
  .widget-ai-usage-planner .aip-pin-btn { flex:0 0 auto; width:40px; border:1px solid #e2e8f0; border-radius:20px; background:#fff; color:#64748b; cursor:pointer; display:inline-flex; align-items:center; justify-content:center; font-size:.9rem; transition:all .2s ease; }
  .widget-ai-usage-planner .aip-pin-btn:hover { border-color:#13aff0; color:#13aff0; }
  .widget-ai-usage-planner .aip-pin-btn.is-pinned { background:#13aff0; border-color:#13aff0; color:#fff; }
  .widget-ai-usage-planner .aip-pin-btn.is-pinned:hover { background:#0f8fd6; border-color:#0f8fd6; color:#fff; }
  .widget-ai-usage-planner .aip-limit-head-right { display:inline-flex; align-items:center; gap:6px; }
  .widget-ai-usage-planner .aip-pin-btn-sm { width:22px; height:22px; border-radius:50%; font-size:.7rem; padding:0; }

  .widget-ai-usage-planner .aip-list-item { display:flex; justify-content:space-between; align-items:center; gap:16px; border:1px solid #e2e8f0; background:#fff; border-radius:12px; padding:14px 16px; margin-bottom:10px; flex-wrap:wrap; }
  .widget-ai-usage-planner .aip-list-item strong { color:#1e293b; }
  .widget-ai-usage-planner .aip-list-item .aip-ai-meta { margin-top:2px; }
  .widget-ai-usage-planner .aip-list-actions { display:flex; gap:8px; flex-shrink:0; }

  .widget-ai-usage-planner .btn-icon-edit,
  .widget-ai-usage-planner .btn-icon-danger {
    border:none; outline:none; width:32px; height:32px; border-radius:50%;
    display:inline-flex; align-items:center; justify-content:center; font-size:.82rem;
    cursor:pointer; transition:all .2s cubic-bezier(.4,0,.2,1); box-shadow:0 2px 6px rgba(0,0,0,.04); padding:0; flex-shrink:0;
  }
  .widget-ai-usage-planner .btn-icon-edit { background:#f0f9ff; color:#0284c7; border:1px solid #bae6fd; }
  .widget-ai-usage-planner .btn-icon-edit:hover { background:#13aff0; color:#fff; border-color:#13aff0; transform:scale(1.12); box-shadow:0 4px 12px rgba(19,175,240,.35); }
  .widget-ai-usage-planner .btn-icon-danger { background:#fef2f2; color:#dc2626; border:1px solid #fecaca; }
  .widget-ai-usage-planner .btn-icon-danger:hover { background:#ef4444; color:#fff; border-color:#ef4444; transform:scale(1.12); box-shadow:0 4px 12px rgba(239,68,68,.35); }

  .widget-ai-usage-planner .aip-table-wrap { overflow-x:auto; border:1px solid #e2e8f0; border-radius:14px; }
  .widget-ai-usage-planner table { width:100%; border-collapse:collapse; min-width:640px; }
  .widget-ai-usage-planner th, .widget-ai-usage-planner td { border-bottom:1px solid #edf0f2; padding:12px; text-align:left; font-size:.86rem; }
  .widget-ai-usage-planner th { color:#168fc5; font-size:.74rem; text-transform:uppercase; letter-spacing:.05em; white-space:nowrap; }
  .widget-ai-usage-planner tbody tr:last-child td { border-bottom:0; }
  .widget-ai-usage-planner .aip-cell-note { display:block; color:#94a3b8; font-size:.76rem; margin-top:2px; }
  .widget-ai-usage-planner .aip-update-ai-cell { min-width:190px; }
  .widget-ai-usage-planner .aip-window-badge { display:inline-flex; align-items:center; margin-left:8px; padding:4px 8px; border-radius:999px; background:#e0f2fe; border:1px solid #bae6fd; color:#075985; font-size:.7rem; font-weight:800; white-space:nowrap; vertical-align:middle; }
  .widget-ai-usage-planner .aip-window-badge.window-5 { background:#f3e8ff; border-color:#e9d5ff; color:#7e22ce; }
  .widget-ai-usage-planner .aip-window-badge.window-24 { background:#dcfce7; border-color:#bbf7d0; color:#166534; }
  .widget-ai-usage-planner .aip-window-badge.window-720 { background:#e0e7ff; border-color:#c7d2fe; color:#3730a3; }
  .widget-ai-usage-planner .aip-update-ai-cell .aip-ai-title-row { flex-wrap:wrap; row-gap:6px; }
  .widget-ai-usage-planner .aip-window-cell { white-space:nowrap; }
  .widget-ai-usage-planner tr.aip-window-row.window-168 td { background:#f5fbff; }
  .widget-ai-usage-planner tr.aip-window-row.window-5 td { background:#fbf7ff; }
  .widget-ai-usage-planner tr.aip-window-row.window-24 td { background:#f5fcf7; }
  .widget-ai-usage-planner tr.aip-window-row.window-720 td { background:#f7f8ff; }
  .widget-ai-usage-planner .aip-usage-input-wrap { display:flex; align-items:center; gap:6px; }
  .widget-ai-usage-planner .aip-usage-input-wrap input { width:auto !important; flex:1; min-width:70px; margin-bottom:0 !important; }
  .widget-ai-usage-planner .aip-usage-input-wrap span { color:#64748b; font-weight:700; }
  .widget-ai-usage-planner td input[type="datetime-local"] { margin-bottom:0 !important; min-width:190px; }
  .widget-ai-usage-planner .aip-save-usage-btn { border:0; border-radius:20px; padding:7px 14px; font-size:.8rem; font-weight:700; cursor:pointer; background:#eef1f5; color:#94a3b8; }
  .widget-ai-usage-planner .aip-save-usage-btn.is-ready { background:#13aff0; color:#fff; }
  .widget-ai-usage-planner .aip-save-usage-btn:disabled { cursor:default; }

  .widget-ai-usage-planner .aip-footer { border-top:1px solid #edf1f5; margin-top:24px; padding-top:16px; }
  .widget-ai-usage-planner .aip-footer .aip-privacy { margin:0; }

  .widget-ai-usage-planner .aip-note { color:#64748b; font-size:.82rem; margin:6px 0 0; }
  .widget-ai-usage-planner .aip-pace-warning { margin:8px 0; padding:8px 10px; border-radius:10px; background:#fffbeb; border:1px solid #fde68a; color:#92400e; font-size:.78rem; line-height:1.4; display:flex; gap:8px; align-items:flex-start; }
  .widget-ai-usage-planner .aip-pace-warning > i { color:#d97706; margin-top:2px; flex:0 0 auto; }
  .widget-ai-usage-planner .aip-pace-warning span { flex:1 1 auto; }
  .widget-ai-usage-planner .aip-pace-warning.is-collapsed { align-items:center; padding:6px 10px; }
  .widget-ai-usage-planner .aip-pace-warning-toggle { border:0; background:transparent; color:#92400e; cursor:pointer; padding:2px; margin:0 0 0 auto; flex:0 0 auto; border-radius:6px; line-height:1; }
  .widget-ai-usage-planner .aip-pace-warning-toggle:hover { background:rgba(217,119,6,.15); }
  .widget-ai-usage-planner .aip-text-bad { color:#dc2626; }
  .widget-ai-usage-planner .aip-text-warn { color:#d97706; }
  .widget-ai-usage-planner .aip-text-good { color:#16a34a; }

  .widget-ai-usage-planner .aip-pace-tip { display:flex; align-items:flex-start; gap:8px; margin-top:10px; padding:8px 10px; border-radius:10px; font-size:.8rem; line-height:1.35; }
  .widget-ai-usage-planner .aip-pace-tip i { margin-top:2px; flex-shrink:0; }
  .widget-ai-usage-planner .aip-pace-tip.upgrade { background:#eff9f1; color:#166534; }
  .widget-ai-usage-planner .aip-pace-tip.upgrade i { color:#16a34a; }
  .widget-ai-usage-planner .aip-pace-tip.economize { background:#fef6e9; color:#92400e; }
  .widget-ai-usage-planner .aip-pace-tip.economize i { color:#d97706; }

  .widget-ai-usage-planner .aip-modal-backdrop { display:none; position:fixed; inset:0; background:rgba(15,23,42,.55); z-index:1000; align-items:flex-start; justify-content:center; padding:40px 16px; overflow-y:auto; }
  .widget-ai-usage-planner .aip-modal-backdrop.open { display:flex; }
  .widget-ai-usage-planner .aip-modal { background:#fff; border-radius:16px; max-width:640px; width:100%; box-shadow:0 20px 60px rgba(0,0,0,.25); margin:auto; }
  .widget-ai-usage-planner .aip-modal-header { display:flex; justify-content:space-between; align-items:center; padding:18px 22px; border-bottom:1px solid #edf1f5; }
  .widget-ai-usage-planner .aip-modal-header h3 { margin:0; font-size:1.12rem; color:#1e293b; }
  .widget-ai-usage-planner .aip-modal-close { border:0; background:transparent; font-size:1.4rem; line-height:1; color:#64748b; cursor:pointer; padding:0; width:32px; height:32px; border-radius:50%; }
  .widget-ai-usage-planner .aip-modal-close:hover { background:#f1f5f9; color:#1e293b; }
  .widget-ai-usage-planner .aip-modal-body { padding:20px 22px; max-height:66vh; overflow-y:auto; }
  .widget-ai-usage-planner .aip-modal-footer { display:flex; justify-content:flex-end; gap:10px; padding:16px 22px; border-top:1px solid #edf1f5; }
  .widget-ai-usage-planner .aip-modal-footer .btn-social, .widget-ai-usage-planner .aip-modal-footer .tool-copy { margin:0; }

  .widget-ai-usage-planner .aip-form-section { background:#f8fafc; border-radius:14px; padding:16px; margin-bottom:16px; }
  .widget-ai-usage-planner .aip-form-section:last-child { margin-bottom:0; }
  .widget-ai-usage-planner .aip-form-section-head { display:flex; justify-content:space-between; align-items:center; gap:10px; margin-bottom:14px; }
  .widget-ai-usage-planner .aip-form-section h4 { font-size:.92rem; font-weight:800; color:#1e293b; margin:0; }
  .widget-ai-usage-planner .aip-form-row { display:grid; grid-template-columns:repeat(2,minmax(0,1fr)); gap:0 14px; }
  @media (max-width:560px){ .widget-ai-usage-planner .aip-form-row{grid-template-columns:1fr;} }
  .widget-ai-usage-planner .aip-custom-name-wrap.is-hidden { display:none; }
  .widget-ai-usage-planner .aip-required { color:#dc2626; }

  .widget-ai-usage-planner .aip-limit-row { position:relative; background:#fff; border:1px solid #e2e8f0; border-radius:12px; padding:14px 50px 0 14px; margin-bottom:10px; }
  .widget-ai-usage-planner .aip-limit-row .btn-icon-danger { position:absolute; top:12px; right:12px; }
  .widget-ai-usage-planner .aip-limit-fields { display:grid; grid-template-columns:1fr 0.8fr 1.4fr; gap:0 12px; }
  @media (max-width:650px){ .widget-ai-usage-planner .aip-limit-fields{grid-template-columns:1fr;} }
  .widget-ai-usage-planner .aip-field-note { display:block; color:#94a3b8; font-size:.74rem; margin:4px 0 14px; }

  @media (max-width:575px){
    .widget-ai-usage-planner .aip-topbar { display:block; }
    .widget-ai-usage-planner .aip-topbar-actions { margin-top:10px; }
    .widget-ai-usage-planner .aip-tab-btn { flex:1 1 calc(50% - 8px); }
    .widget-ai-usage-planner .aip-stats-row { grid-template-columns:1fr 1fr; }
  }
</style>

<div class="tool-widget widget-ai-usage-planner" id="aiUsagePlanner">

  <div class="aip-topbar">
    <p class="aip-privacy"><i class="fas fa-lock"></i> <cfif local.isEs>Tus datos quedan en este navegador. Sin APIs, cuentas ni bases de datos.<cfelse>Your data stays in this browser. No APIs, account, or database.</cfif></p>
    <div class="aip-topbar-actions">
      <button class="btn-social btn-linkedin" type="button" data-aip-action="export"><i class="fas fa-download"></i> <cfif local.isEs>Exportar JSON<cfelse>Export JSON</cfif></button>
      <label class="btn-social btn-linkedin aip-import-label"><i class="fas fa-upload"></i> <cfif local.isEs>Importar JSON<cfelse>Import JSON</cfif><input type="file" accept="application/json,.json" data-aip-import hidden></label>
    </div>
  </div>

  <nav class="aip-tabs" aria-label="<cfif local.isEs>Secciones del Planificador de Uso de IA<cfelse>AI Usage Planner sections</cfif>">
    <button type="button" class="aip-tab-btn" data-aip-screen="dashboard"><cfif local.isEs>Panel<cfelse>Dashboard</cfif></button>
    <button type="button" class="aip-tab-btn" data-aip-screen="manage"><cfif local.isEs>Administrar IAs<cfelse>Manage AIs</cfif></button>
    <button type="button" class="aip-tab-btn" data-aip-screen="compare"><cfif local.isEs>Comparar<cfelse>Compare</cfif></button>
    <button type="button" class="aip-tab-btn" data-aip-screen="update"><cfif local.isEs>Actualizar Uso<cfelse>Update Usage</cfif></button>
  </nav>

  <section class="aip-panel" data-aip-panel="dashboard">
    <div class="aip-stats-row" data-aip-stats></div>
    <div data-aip-intro></div>
    <div class="aip-status-filters" data-aip-status-filters></div>
    <div class="aip-cards" data-aip-cards></div>
  </section>

  <section class="aip-panel" data-aip-panel="manage">
    <div class="aip-panel-head">
      <div><h3><cfif local.isEs>Administrar IAs<cfelse>Manage AIs</cfif></h3><p><cfif local.isEs>Configurá nombres, límites, ventanas y horarios de reinicio.<cfelse>Configure names, limits, windows, and reset times.</cfif></p></div>
      <button class="btn-social btn-upwork" type="button" data-aip-action="add"><i class="fas fa-plus"></i> <cfif local.isEs>Agregar IA<cfelse>Add AI</cfif></button>
    </div>
    <div data-aip-list></div>
  </section>

  <section class="aip-panel" data-aip-panel="compare">
    <div class="aip-panel-head">
      <div><h3><cfif local.isEs>Comparar IAs<cfelse>Compare AIs</cfif></h3><p><cfif local.isEs>Una vista lado a lado usando el límite más restrictivo activo de cada IA.<cfelse>A side-by-side view using each AI's most restrictive active limit.</cfif></p></div>
    </div>
    <div data-aip-compare></div>
  </section>

  <section class="aip-panel" data-aip-panel="update">
    <div class="aip-panel-head">
      <div><h3><cfif local.isEs>Actualización Rápida de Uso<cfelse>Quick Update Usage</cfif></h3><p><cfif local.isEs>Ingresá el total consumido actual para cada límite. Los valores se guardan en este dispositivo.<cfelse>Enter the current total consumed for each limit. Values are saved on this device.</cfif></p></div>
    </div>
    <div data-aip-update></div>
  </section>

  <div class="aip-footer">
    <span class="aip-privacy"><i class="fas fa-shield-alt"></i> <cfif local.isEs>Almacenamiento solo local · exportá una copia de seguridad antes de borrar los datos del navegador.<cfelse>Local-only storage · export a backup before clearing browser data.</cfif></span>
  </div>

  <div class="aip-modal-backdrop" data-aip-modal-backdrop>
    <div class="aip-modal" role="dialog" aria-modal="true" aria-labelledby="aip-modal-title">
      <form data-aip-form>
        <div class="aip-modal-header">
          <h3 id="aip-modal-title" data-aip-modal-title><cfif local.isEs>Agregar IA<cfelse>Add AI</cfif></h3>
          <button type="button" class="aip-modal-close" data-aip-modal-close aria-label="<cfif local.isEs>Cerrar<cfelse>Close</cfif>">×</button>
        </div>
        <div class="aip-modal-body">
          <input type="hidden" name="aiId">
          <div class="aip-form-section">
            <h4><cfif local.isEs>Datos de la IA<cfelse>AI details</cfif></h4>
            <div class="aip-form-row">
              <div>
                <label><cfif local.isEs>Proveedor<cfelse>Provider</cfif></label>
                <select name="providerKey">
                  <option value="custom"><cfif local.isEs>Personalizado / otro<cfelse>Custom / other</cfif></option>
                  <option value="codex">Codex</option>
                  <option value="claude-code">Claude Code</option>
                  <option value="gemini-models">Gemini Models</option>
                  <option value="gemini-other-models">Gemini Other Models</option>
                </select>
              </div>
              <div class="aip-custom-name-wrap">
                <label><cfif local.isEs>Nombre personalizado <span class="aip-required">*</span><cfelse>Custom name <span class="aip-required">*</span></cfif></label>
                <input name="name" placeholder="<cfif local.isEs>ej. Mi modelo local<cfelse>e.g. My local model</cfif>">
              </div>
            </div>
          </div>
          <div class="aip-form-section">
            <div class="aip-form-section-head">
              <h4><cfif local.isEs>Límites de uso<cfelse>Usage limits</cfif></h4>
              <button type="button" class="tool-copy" data-aip-action="add-limit" style="margin:0;"><i class="fas fa-plus"></i> <cfif local.isEs>Agregar límite<cfelse>Add limit</cfif></button>
            </div>
            <div data-aip-limit-editor></div>
            <p class="aip-note"><cfif local.isEs>Cada límite tiene una ventana del proveedor, un porcentaje de uso y una fecha de reinicio.<cfelse>Each limit has a provider window, usage percentage, and reset date.</cfif></p>
          </div>
        </div>
        <div class="aip-modal-footer">
          <button type="button" class="tool-copy" data-aip-modal-close><cfif local.isEs>Cancelar<cfelse>Cancel</cfif></button>
          <button class="btn-social btn-upwork" type="submit"><i class="fas fa-check"></i> <cfif local.isEs>Guardar IA<cfelse>Save AI</cfif></button>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
(function () {
  'use strict';
  var root = document.getElementById('aiUsagePlanner'); if (!root) return;
  var aipIsEs = <cfif local.isEs>true<cfelse>false</cfif>;
  var storageKey = 'coldfusionexpert.aiUsagePlanner.v1', floatingKey = 'coldfusionexpert.aiUsagePlanner.floating.v1', state = loadState(), activeScreen = 'dashboard', dashboardFilter = 'all', modalBackdrop = root.querySelector('[data-aip-modal-backdrop]'), editingId = null;
  var toolUrl = '<cfif local.isEs>https://coldfusionexpert.ar/es/tools/ai-usage-planner<cfelse>https://coldfusionexpert.ar/tools/ai-usage-planner</cfif>';

  var T = {
    used: '<cfif local.isEs>Usado<cfelse>Used</cfif>',
    left: '<cfif local.isEs>restante<cfelse>left</cfif>',
    reset: '<cfif local.isEs>Reinicio<cfelse>Reset</cfif>',
    safePace: '<cfif local.isEs>Ritmo seguro<cfelse>Safe pace</cfif>',
    perHourSuffix: '<cfif local.isEs>% / hora<cfelse>% / hour</cfif>',
    perDaySuffix: '<cfif local.isEs>% / día<cfelse>% / day</cfif>',
    expectedVsActual: '<cfif local.isEs>Esperado vs. real<cfelse>Expected vs actual</cfif>',
    statAiTools: '<cfif local.isEs>Herramientas de IA<cfelse>AI tools</cfif>',
    statActiveLimits: '<cfif local.isEs>Límites activos<cfelse>Active limits</cfif>',
    statMostRestrictive: '<cfif local.isEs>Más restrictivo<cfelse>Most restrictive</cfif>',
    introKicker: '<cfif local.isEs>Empezá con los números del proveedor<cfelse>Start with the provider\'s numbers</cfif>',
    introTitle: '<cfif local.isEs>Mirá qué IA tiene margen antes de ponerte a trabajar.<cfelse>See which AI has room left before you start working.</cfif>',
    introDesc: '<cfif local.isEs>Para cada IA, ingresá el porcentaje usado tal como lo muestra el proveedor y la próxima fecha de reinicio. Agregá ventanas separadas, como semanal y de 5 horas. En esta versión el uso se carga manualmente.<cfelse>For each AI, enter the percentage used exactly as shown by its provider and the next reset date. Add separate windows such as weekly and 5-hour usage. Usage is entered manually in this version.</cfif>',
    configureFirstAi: '<cfif local.isEs>Configurar tu primera IA<cfelse>Configure your first AI</cfif>',
    howItWorksTitle: '<cfif local.isEs>% usado + reinicio<cfelse>Used % + reset</cfif>',
    howItWorksDesc: '<cfif local.isEs>Ingresá dos valores simples. El planificador calcula lo que queda y qué IA es más segura para usar.<cfelse>Enter two simple values. The planner calculates what remains and which AI is safest to use.</cfif>',
    edit: '<cfif local.isEs>Editar<cfelse>Edit</cfif>',
    removeAiTitle: '<cfif local.isEs>Eliminar IA<cfelse>Remove AI</cfif>',
    limitWord: '<cfif local.isEs>límite<cfelse>limit</cfif>',
    limitsWord: '<cfif local.isEs>límites<cfelse>limits</cfif>',
    noAisTitle: '<cfif local.isEs>Todavía no hay IAs configuradas<cfelse>No AIs configured yet</cfif>',
    noAisManageDesc: '<cfif local.isEs>Agregá tu primera IA y sus límites para desbloquear el panel.<cfelse>Add your first AI and its limits to unlock the dashboard.</cfif>',
    addFirstAi: '<cfif local.isEs>Agregar tu primera IA<cfelse>Add your first AI</cfif>',
    onTrack: '<cfif local.isEs>En buen ritmo<cfelse>On track</cfif>',
    watchPace: '<cfif local.isEs>Vigilar ritmo<cfelse>Watch pace</cfif>',
    overPace: '<cfif local.isEs>Ritmo excedido<cfelse>Over pace</cfif>',
    noLimits: '<cfif local.isEs>No hay límites configurados.<cfelse>No limits configured.</cfif>',
    todayBudget: '<cfif local.isEs>Presupuesto de hoy<cfelse>Today\'s budget</cfif>',
    upgradeTip: '<cfif local.isEs>Vas bien de ritmo, te queda buen margen y el período termina pronto: buen momento para probar el modelo más potente.<cfelse>You\'re on pace, have plenty of headroom left, and this window resets soon: a good time to try the more powerful model.</cfif>',
    economizeTip: '<cfif local.isEs>Todavía falta mucho para el reinicio: conviene usar modelos más económicos para hacer rendir la cuota.<cfelse>This window still has a long way to go before it resets: consider using more economical models to make your quota last.</cfif>',
    filterAll: '<cfif local.isEs>Todas<cfelse>All</cfif>',
    noFilterMatch: '<cfif local.isEs>Ninguna IA coincide con este filtro.<cfelse>No AI matches this filter.</cfif>',
    updateUsageBtn: '<cfif local.isEs>Actualizar uso<cfelse>Update usage</cfif>',
    colAiLimit: '<cfif local.isEs>IA / límite<cfelse>AI / limit</cfif>',
    colUsed: '<cfif local.isEs>Usado<cfelse>Used</cfif>',
    colRemaining: '<cfif local.isEs>Restante<cfelse>Remaining</cfif>',
    colNextReset: '<cfif local.isEs>Próximo reinicio<cfelse>Next reset</cfif>',
    saveBtn: '<cfif local.isEs>Guardar<cfelse>Save</cfif>',
    nothingUpdateTitle: '<cfif local.isEs>Nada para actualizar todavía<cfelse>Nothing to update yet</cfif>',
    nothingUpdateDesc: '<cfif local.isEs>Agregá una IA con al menos un límite y volvé acá para actualizaciones manuales rápidas.<cfelse>Add an AI with at least one limit, then return here for quick manual updates.</cfif>',
    addAi: '<cfif local.isEs>Agregar IA<cfelse>Add AI</cfif>',
    colAi: '<cfif local.isEs>IA<cfelse>AI</cfif>',
    colMostRestrictiveLimit: '<cfif local.isEs>Límite más restrictivo<cfelse>Most restrictive limit</cfif>',
    colSafePace: '<cfif local.isEs>Ritmo seguro<cfelse>Safe pace</cfif>',
    colReset: '<cfif local.isEs>Reinicio<cfelse>Reset</cfif>',
    colStatus: '<cfif local.isEs>Estado<cfelse>Status</cfif>',
    noLimitsShort: '<cfif local.isEs>Sin límites<cfelse>No limits</cfif>',
    nothingCompareTitle: '<cfif local.isEs>Nada para comparar todavía<cfelse>Nothing to compare yet</cfif>',
    nothingCompareDesc: '<cfif local.isEs>Configurá al menos dos IAs para que esta vista sea útil.<cfelse>Configure at least two AIs to make this view useful.</cfif>',
    confirmRemoveAi: '<cfif local.isEs>¿Eliminar esta IA y sus datos de uso locales?<cfelse>Remove this AI and its local usage data?</cfif>',
    confirmImport: '<cfif local.isEs>¿Reemplazar los datos actuales del planificador con este archivo?<cfelse>Replace your current planner data with this file?</cfif>',
    invalidImport: '<cfif local.isEs>Este archivo no es un export JSON válido del Planificador de Uso de IA.<cfelse>This file is not a valid AI Usage Planner JSON export.</cfif>',
    modalAddTitle: '<cfif local.isEs>Agregar IA<cfelse>Add AI</cfif>',
    modalEditTitle: '<cfif local.isEs>Editar IA<cfelse>Edit AI</cfif>',
    removeLimitTitle: '<cfif local.isEs>Eliminar este límite<cfelse>Remove this limit</cfif>',
    windowFieldLabel: '<cfif local.isEs>Ventana<cfelse>Window</cfif>',
    usedNowLabel: '<cfif local.isEs>Usado ahora (%)<cfelse>Used now (%)</cfif>',
    usedNowNote: '<cfif local.isEs>Copiá el porcentaje que muestra el proveedor<cfelse>Copy the percentage shown by the provider</cfif>',
    nextResetLabel: '<cfif local.isEs>Próximo reinicio<cfelse>Next reset</cfif>',
    pinTitle: '<cfif local.isEs>Flotar en el sitio<cfelse>Float across the site</cfif>',
    unpinTitle: '<cfif local.isEs>Quitar del panel flotante<cfelse>Remove from floating panel</cfif>',
    dragHandleTitle: '<cfif local.isEs>Arrastrá para reordenar<cfelse>Drag to reorder</cfif>',
    reorderLabel: '<cfif local.isEs>Ordenar<cfelse>Reorder</cfif>',
    paceWarningLabelPrefix: '<cfif local.isEs>Atención<cfelse>Heads up,</cfif>',
    paceWarningTemplate: '<cfif local.isEs>A este ritmo se te agotará {date}, antes del reinicio {reset}.<cfelse>At this pace you will run out {date}, before the reset {reset}.</cfif>',
    minimizeWarning: '<cfif local.isEs>Minimizar aviso<cfelse>Minimize notice</cfif>',
    restoreWarning: '<cfif local.isEs>Restaurar aviso<cfelse>Restore notice</cfif>'
  };

  var providerSuggestions = [{key:'codex',label:'Codex'},{key:'claude-code',label:'Claude Code'},{key:'gemini-models',label:'Gemini Models'},{key:'gemini-other-models',label:'Gemini Other Models'},{key:'custom',label:'<cfif local.isEs>Personalizado / otro<cfelse>Custom / other</cfif>'}];
  function uid(prefix){ return (prefix || 'id') + '-' + Date.now().toString(36) + '-' + Math.random().toString(36).slice(2,8); }
  function windowLabel(hours){ hours=Number(hours); return hours===5?'<cfif local.isEs>Sesión (5 horas)<cfelse>Session (5 hours)</cfif>':hours===24?'<cfif local.isEs>Diario (24 horas)<cfelse>Daily (24 hours)</cfif>':hours===168?'<cfif local.isEs>Semanal (7 días)<cfelse>Weekly (7 days)</cfif>':hours===720?'<cfif local.isEs>Mensual (30 días)<cfelse>Monthly (30 days)</cfif>':'<cfif local.isEs>Ventana personalizada<cfelse>Custom window</cfif>'; }
  function defaultLimit(){ var reset = new Date(Date.now() + 7 * 86400000); return {id:uid('limit'),label:windowLabel(168),allowance:100,windowHours:168,used:0,usedPercent:0,resetAt:reset.toISOString(),updatedAt:new Date().toISOString()}; }
  function emptyState(){ return {version:1,ais:[]}; }
  function loadState(){ try { var parsed=JSON.parse(localStorage.getItem(storageKey)||''); return parsed && Array.isArray(parsed.ais) ? normalize(parsed) : emptyState(); } catch(e){ return emptyState(); } }
  function normalize(data){ data.ais.forEach(function(ai){ ai.id=ai.id||uid('ai'); ai.name=String(ai.name||'Unnamed AI'); ai.providerKey=ai.providerKey==='gemini'?'gemini-models':(ai.providerKey||'custom'); ai.limits=Array.isArray(ai.limits)?ai.limits:[]; ai.limits.forEach(function(l){ l.id=l.id||uid('limit'); l.label=String(l.label||'Usage limit'); l.unit=String(l.unit||'requests'); l.allowance=Math.max(0,Number(l.allowance)||0); l.windowHours=Math.max(.1,Number(l.windowHours)||168); l.used=Math.max(0,Number(l.used)||0); l.usedPercent=Math.max(0,Math.min(100,Number(l.usedPercent)!=null&&!isNaN(Number(l.usedPercent))?Number(l.usedPercent):(l.allowance?l.used/l.allowance*100:0))); var reset=new Date(l.resetAt); l.resetAt=isNaN(reset.getTime())?new Date(Date.now()+l.windowHours*3600000).toISOString():reset.toISOString(); }); }); return data; }
  function save(){ state=normalize(state); localStorage.setItem(storageKey,JSON.stringify(state)); render(); }
  function loadFloating(){ try { var ids=JSON.parse(localStorage.getItem(floatingKey)||''); return Array.isArray(ids)?ids:[]; } catch(e){ return []; } }
  function saveFloating(ids){ try { localStorage.setItem(floatingKey,JSON.stringify(ids)); } catch(e){} }
  function isFloating(id){ return loadFloating().indexOf(id)>=0; }
  function toggleFloat(id){ var ids=loadFloating(); var i=ids.indexOf(id); if(i>=0)ids.splice(i,1); else ids.push(id); saveFloating(ids); render(); }
  function fmtNum(v){ return new Intl.NumberFormat(undefined,{maximumFractionDigits:1}).format(Math.max(0,v)); }
  var AIP_WEEKDAYS_ES=['domingo','lunes','martes','miércoles','jueves','viernes','sábado'];
  var AIP_MONTHS_ES=['ene','feb','mar','abr','may','jun','jul','ago','sep','oct','nov','dic'];
  function fmtDate(iso){
    var d=new Date(iso); if(isNaN(d)) return '<cfif local.isEs>Desconocido<cfelse>Unknown</cfif>';
    var now=new Date(), diffDays=Math.round((new Date(d.getFullYear(),d.getMonth(),d.getDate())-new Date(now.getFullYear(),now.getMonth(),now.getDate()))/86400000);
    if(aipIsEs){
      var time=String(d.getHours()).padStart(2,'0')+':'+String(d.getMinutes()).padStart(2,'0');
      if(diffDays===0) return 'hoy a las '+time;
      if(diffDays===1) return 'mañana a las '+time;
      return AIP_WEEKDAYS_ES[d.getDay()]+' '+d.getDate()+' de '+AIP_MONTHS_ES[d.getMonth()]+' a las '+time;
    }
    var time2=d.toLocaleTimeString('en-US',{hour:'numeric',minute:'2-digit'});
    if(diffDays===0) return 'today at '+time2;
    if(diffDays===1) return 'tomorrow at '+time2;
    return d.toLocaleString('en-US',{weekday:'long',month:'short',day:'numeric',hour:'numeric',minute:'2-digit'});
  }
  function hoursLeft(l){ return Math.max(0,(new Date(l.resetAt)-Date.now())/3600000); }
  function calc(l){ var usedPercent=Math.max(0,Math.min(100,providerFor().getUsage(null,l))), left=hoursLeft(l), pct=100-usedPercent, elapsed=Math.max(0,Math.min(l.windowHours,l.windowHours-left)), expected=100*(elapsed/l.windowHours), delta=usedPercent-expected, signal=(usedPercent>=100&&left>0)?'bad':delta>15?'bad':delta>5?'warn':'good', actualPerHour=elapsed>0?usedPercent/elapsed:0, hoursToExhaust=actualPerHour>0?pct/actualPerHour:Infinity; return {left:left,pct:pct,usedPercent:usedPercent,expected:expected,actual:usedPercent,delta:delta,signal:signal,perHour:left?Math.max(0,pct/left):0,perDay:left?Math.max(0,pct/left*24):0,elapsed:elapsed,actualPerHour:actualPerHour,hoursToExhaust:hoursToExhaust}; }
  function providerFor(){ return new ManualUsageProvider(); }
  function UsageProvider(){ if(this.constructor===UsageProvider) throw new Error('UsageProvider is abstract'); }
  UsageProvider.prototype.getUsage=function(){ throw new Error('Implement getUsage'); };
  function ManualUsageProvider(){} ManualUsageProvider.prototype=Object.create(UsageProvider.prototype); ManualUsageProvider.prototype.constructor=ManualUsageProvider; ManualUsageProvider.prototype.getUsage=function(ai,limit){ return Number(limit.usedPercent)||0; };
  function providerName(key){ var match=providerSuggestions.find(function(p){return p.key===key;}); return match?match.label:'<cfif local.isEs>Personalizado / otro<cfelse>Custom / other</cfif>'; }
  function aiDisplayName(ai){ return ai.providerKey==='custom'?ai.name:providerName(ai.providerKey); }
  function aiMeta(ai){ return ai.providerKey==='custom'?providerName(ai.providerKey):''; }
  var AIP_LOGO_SVG = {
    claude: '<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="m4.7144 15.9555 4.7174-2.6471.079-.2307-.079-.1275h-.2307l-.7893-.0486-2.6956-.0729-2.3375-.0971-2.2646-.1214-.5707-.1215-.5343-.7042.0546-.3522.4797-.3218.686.0608 1.5179.1032 2.2767.1578 1.6514.0972 2.4468.255h.3886l.0546-.1579-.1336-.0971-.1032-.0972L6.973 9.8356l-2.55-1.6879-1.3356-.9714-.7225-.4918-.3643-.4614-.1578-1.0078.6557-.7225.8803.0607.2246.0607.8925.686 1.9064 1.4754 2.4893 1.8336.3643.3035.1457-.1032.0182-.0728-.164-.2733-1.3539-2.4467-1.445-2.4893-.6435-1.032-.17-.6194c-.0607-.255-.1032-.4674-.1032-.7285L6.287.1335 6.6997 0l.9957.1336.419.3642.6192 1.4147 1.0018 2.2282 1.5543 3.0296.4553.8985.2429.8318.091.255h.1579v-.1457l.1275-1.706.2368-2.0947.2307-2.6957.0789-.7589.3764-.9107.7468-.4918.5828.2793.4797.686-.0668.4433-.2853 1.8517-.5586 2.9021-.3643 1.9429h.2125l.2429-.2429.9835-1.3053 1.6514-2.0643.7286-.8196.85-.9046.5464-.4311h1.0321l.759 1.1293-.34 1.1657-1.0625 1.3478-.8804 1.1414-1.2628 1.7-.7893 1.36.0729.1093.1882-.0183 2.8535-.607 1.5421-.2794 1.8396-.3157.8318.3886.091.3946-.3278.8075-1.967.4857-2.3072.4614-3.4364.8136-.0425.0304.0486.0607 1.5482.1457.6618.0364h1.621l3.0175.2247.7892.522.4736.6376-.079.4857-1.2142.6193-1.6393-.3886-3.825-.9107-1.3113-.3279h-.1822v.1093l1.0929 1.0686 2.0035 1.8092 2.5075 2.3314.1275.5768-.3218.4554-.34-.0486-2.2039-1.6575-.85-.7468-1.9246-1.621h-.1275v.17l.4432.6496 2.3436 3.5214.1214 1.0807-.17.3521-.6071.2125-.6679-.1214-1.3721-1.9246L14.38 17.959l-1.1414-1.9428-.1397.079-.674 7.2552-.3156.3703-.7286.2793-.6071-.4614-.3218-.7468.3218-1.4753.3886-1.9246.3157-1.53.2853-1.9004.17-.6314-.0121-.0425-.1397.0182-1.4328 1.9672-2.1796 2.9446-1.7243 1.8456-.4128.164-.7164-.3704.0667-.6618.4008-.5889 2.386-3.0357 1.4389-1.882.929-1.0868-.0062-.1579h-.0546l-6.3385 4.1164-1.1293.1457-.4857-.4554.0608-.7467.2307-.2429 1.9064-1.3114Z"/></svg>',
    gemini: '<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M11.04 19.32Q12 21.51 12 24q0-2.49.93-4.68.96-2.19 2.58-3.81t3.81-2.55Q21.51 12 24 12q-2.49 0-4.68-.93a12.3 12.3 0 0 1-3.81-2.58 12.3 12.3 0 0 1-2.58-3.81Q12 2.49 12 0q0 2.49-.96 4.68-.93 2.19-2.55 3.81a12.3 12.3 0 0 1-3.81 2.58Q2.49 12 0 12q2.49 0 4.68.96 2.19.93 3.81 2.55t2.55 3.81"/></svg>'
  };
  function aiIconHtml(providerKey,sizeClass){
    var cls=sizeClass?' '+sizeClass:'';
    if(providerKey==='claude-code') return '<span class="aip-ai-icon claude'+cls+'">'+AIP_LOGO_SVG.claude+'</span>';
    if(providerKey==='gemini-models'||providerKey==='gemini-other-models') return '<span class="aip-ai-icon gemini'+cls+'">'+AIP_LOGO_SVG.gemini+'</span>';
    if(providerKey==='codex') return '<span class="aip-ai-icon codex'+cls+'"><i class="fas fa-microchip" aria-hidden="true"></i></span>';
    return '';
  }
  function health(ai){ if(!ai.limits.length)return {signal:'warn',pct:0}; return ai.limits.map(calc).reduce(function(w,c){ return c.pct<w.pct||c.signal==='bad'&&w.signal!=='bad'?c:w; }); }
  function esc(s){ return String(s==null?'':s).replace(/[&<>"']/g,function(c){return {'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c];}); }
  function barSignal(c){ return c.usedPercent>=90?'bad':(c.signal==='good'?'good':'warn'); }
  function bar(c,todayPct){ var used=Math.max(0,Math.min(100,c.usedPercent)), todaySegment=''; if(todayPct){ var end=Math.min(100,used+todayPct), width=Math.max(0,end-used); if(width>0) todaySegment='<div class="aip-progress-today" style="left:'+used+'%;width:'+width+'%" title="'+T.todayBudget+': +'+fmtNum(todayPct)+'%"></div>'; } return '<div class="aip-progress"><div class="aip-progress-bar '+barSignal(c)+'" style="width:'+used+'%"></div>'+todaySegment+'</div>'; }
  function todayBudgetPct(l,c){ if(l.windowHours<=24) return null; var now=new Date(), hoursLeftToday=Math.max(0,Math.min(c.left,24-(now.getHours()+now.getMinutes()/60))), expectedByEndOfToday=100*Math.min(l.windowHours,c.elapsed+hoursLeftToday)/l.windowHours; return Math.max(0,Math.min(c.pct,expectedByEndOfToday-c.usedPercent)); }
  function paceTip(c){ var timeLeftPct=100-c.expected; if(c.signal==='good'&&c.pct>=30&&timeLeftPct<=20)return 'upgrade'; if(c.signal!=='good'&&timeLeftPct>=60)return 'economize'; return null; }
  function paceTipHtml(c){ var tip=paceTip(c); if(!tip)return ''; return '<div class="aip-pace-tip '+tip+'"><i class="fas fa-'+(tip==='upgrade'?'rocket':'piggy-bank')+'" aria-hidden="true"></i><span>'+(tip==='upgrade'?T.upgradeTip:T.economizeTip)+'</span></div>'; }
  var WINDOW_SORT_RANK = {168:0,5:1,24:2,720:3};
  function sortedLimits(limits){ return limits.slice().sort(function(a,b){ var ra=WINDOW_SORT_RANK[a.windowHours]!=null?WINDOW_SORT_RANK[a.windowHours]:99, rb=WINDOW_SORT_RANK[b.windowHours]!=null?WINDOW_SORT_RANK[b.windowHours]:99; return ra-rb; }); }
  function healthLabel(signal){ return signal==='good'?T.onTrack:signal==='warn'?T.watchPace:T.overPace; }

  function windowLabelShort(hours){ return windowLabel(hours).replace(/\s*\([^)]*\)\s*$/,''); }
  function resetRingHtml(l,c){ var remainPct=l.windowHours?Math.max(0,Math.min(100,(c.left/l.windowHours)*100)):0, deg=Math.max(0,Math.min(360,(100-remainPct)/100*360)), color=remainPct<10?'#16a34a':remainPct<50?'#d97706':'#dc2626'; return '<span class="aip-reset-ring" style="background:conic-gradient('+color+' 0deg '+deg.toFixed(0)+'deg,#e2e8f0 '+deg.toFixed(0)+'deg 360deg)" title="'+fmtNum(remainPct)+'% '+T.left+'"></span>'; }
  function isRelDay(iso){ var d=new Date(iso); if(isNaN(d)) return false; var now=new Date(), diff=Math.round((new Date(d.getFullYear(),d.getMonth(),d.getDate())-new Date(now.getFullYear(),now.getMonth(),now.getDate()))/86400000); return diff===0||diff===1; }
  function paceWarningInfo(l,c){
    if(c.signal==='good'||c.usedPercent>=100||!(c.actualPerHour>0)||!(c.hoursToExhaust<c.left)) return null;
    var exhaustIso=new Date(Date.now()+c.hoursToExhaust*3600000).toISOString();
    var dateRel=isRelDay(exhaustIso), resetRel=isRelDay(l.resetAt);
    var datePrefix=aipIsEs?(dateRel?'':'el '):(dateRel?'':'on '), resetPrefix=aipIsEs?(resetRel?'de ':'del '):(resetRel?'':'on ');
    var msg=T.paceWarningTemplate.replace('{date}',datePrefix+fmtDate(exhaustIso)).replace('{reset}',resetPrefix+fmtDate(l.resetAt));
    return {label:T.paceWarningLabelPrefix+' '+windowLabelShort(l.windowHours)+':',msg:msg};
  }
  function paceWarningHtml(l,c){ var pw=paceWarningInfo(l,c); if(!pw) return ''; var collapsed=!!collapsedPaceWarnings[l.id]; return '<div class="aip-pace-warning'+(collapsed?' is-collapsed':'')+'"><i class="fas fa-exclamation-triangle" aria-hidden="true"></i>'+(collapsed?'':'<span><strong>'+pw.label+'</strong> '+pw.msg+'</span>')+'<button type="button" class="aip-pace-warning-toggle" data-aip-toggle-warning="'+l.id+'" title="'+(collapsed?T.restoreWarning:T.minimizeWarning)+'" aria-label="'+(collapsed?T.restoreWarning:T.minimizeWarning)+'"><i class="fas fa-'+(collapsed?'chevron-down':'chevron-up')+'" aria-hidden="true"></i></button></div>'; }
  function limitHtml(ai,l){ var c=calc(l), expectedClass=c.delta>0?'aip-text-bad':'aip-text-good', floatKey=ai.id+'|'+l.id, pinned=isFloating(floatKey), todayPct=todayBudgetPct(l,c); return '<div class="aip-limit"><div class="aip-limit-head"><strong>'+esc(windowLabelShort(l.windowHours))+'</strong><span class="aip-limit-head-right"><b>'+fmtNum(c.pct)+'%</b> '+T.left+'<button type="button" class="aip-pin-btn aip-pin-btn-sm'+(pinned?' is-pinned':'')+'" data-aip-toggle-float="'+floatKey+'" title="'+(pinned?T.unpinTitle:T.pinTitle)+'" aria-pressed="'+(pinned?'true':'false')+'" aria-label="'+(pinned?T.unpinTitle:T.pinTitle)+' &mdash; '+esc(windowLabelShort(l.windowHours))+'"><i class="fas fa-thumbtack" aria-hidden="true"></i></button></span></div>'+bar(c,todayPct)+paceWarningHtml(l,c)+'<div class="aip-limit-details"><span>'+T.used+'<b>'+fmtNum(c.usedPercent)+'%</b></span>'+(todayPct!==null?'<span>'+T.todayBudget+'<b>'+fmtNum(todayPct)+'%</b></span>':'')+'<span>'+T.reset+'<b class="aip-reset-value">'+resetRingHtml(l,c)+(c.left<24?fmtNum(c.left)+'h':fmtNum(c.left/24)+'d')+'</b></span><span>'+T.safePace+'<b>'+fmtNum(c.perHour)+' '+T.perHourSuffix+'</b></span><span>'+T.safePace+'<b>'+fmtNum(c.perDay)+' '+T.perDaySuffix+'</b></span><span>'+T.expectedVsActual+'<b class="'+expectedClass+'">'+fmtNum(c.expected)+'% / '+fmtNum(c.usedPercent)+'%</b></span></div>'+paceTipHtml(c)+'</div>'; }

  function introHtml(){ return '<div class="aip-intro"><div class="aip-intro-main"><p class="aip-kicker">'+T.introKicker+'</p><h3>'+T.introTitle+'</h3><p>'+T.introDesc+'</p><button class="btn-social btn-upwork" type="button" data-aip-action="add">'+T.configureFirstAi+' <i class="fas fa-arrow-right"></i></button></div><div class="aip-intro-side"><i class="fas fa-compass"></i><strong>'+T.howItWorksTitle+'</strong><p>'+T.howItWorksDesc+'</p></div></div>'; }
  function emptyHtml(title,desc){ return '<div class="aip-empty"><i class="fas fa-layer-group"></i><h4>'+title+'</h4><p>'+desc+'</p><button class="btn-social btn-upwork" type="button" data-aip-action="add"><i class="fas fa-plus"></i> '+T.addAi+'</button></div>'; }
  function aiCardHtml(ai){ var h=health(ai); return '<article class="aip-ai-card" data-aip-ai-id="'+ai.id+'"><div class="aip-card-head"><div class="aip-card-head-top"><span class="aip-drag-handle" draggable="true" aria-hidden="true" title="'+T.dragHandleTitle+'"><i class="fas fa-grip-vertical" aria-hidden="true"></i><span class="aip-drag-handle-label">'+T.reorderLabel+'</span></span><span class="aip-health '+h.signal+'">'+healthLabel(h.signal)+'</span></div><div><div class="aip-ai-title-row">'+aiIconHtml(ai.providerKey)+'<h3 class="aip-ai-name">'+esc(aiDisplayName(ai))+'</h3></div>'+(aiMeta(ai)?'<p class="aip-ai-meta">'+esc(aiMeta(ai))+'</p>':'')+'</div></div>'+(ai.limits.length?sortedLimits(ai.limits).map(function(l){return limitHtml(ai,l);}).join(''):'<p class="aip-note">'+T.noLimits+'</p>')+'<div class="aip-card-actions"><button class="tool-copy aip-card-update-btn" type="button" data-aip-update-ai="'+ai.id+'"><i class="fas fa-pen"></i> '+T.updateUsageBtn+'</button><button type="button" class="btn-icon-edit" data-aip-edit="'+ai.id+'" title="'+T.edit+'" aria-label="'+T.edit+' '+esc(aiDisplayName(ai))+'"><i class="fas fa-cog" aria-hidden="true"></i></button></div></article>'; }
  function addCardHtml(){ return '<button type="button" class="aip-ai-card aip-add-card" data-aip-action="add" aria-label="'+T.addAi+'"><span class="aip-add-card-icon"><i class="fas fa-plus" aria-hidden="true"></i></span><span>'+T.addAi+'</span></button>'; }
  function listItemHtml(ai){ return '<div class="aip-list-item" data-aip-ai-id="'+ai.id+'"><div><div class="aip-ai-title-row"><span class="aip-drag-handle" draggable="true" aria-hidden="true" title="'+T.dragHandleTitle+'"><i class="fas fa-grip-vertical" aria-hidden="true"></i></span>'+aiIconHtml(ai.providerKey)+'<strong>'+esc(aiDisplayName(ai))+'</strong></div><div class="aip-ai-meta">'+(aiMeta(ai)?esc(aiMeta(ai))+' · ':'')+ai.limits.length+' '+(ai.limits.length===1?T.limitWord:T.limitsWord)+'</div></div><div class="aip-list-actions"><button type="button" class="btn-icon-edit" data-aip-edit="'+ai.id+'" title="'+T.edit+'" aria-label="'+T.edit+' '+esc(aiDisplayName(ai))+'"><i class="fas fa-pencil-alt" aria-hidden="true"></i></button><button type="button" class="btn-icon-danger" data-aip-remove="'+ai.id+'" title="'+T.removeAiTitle+'" aria-label="'+T.removeAiTitle+' '+esc(aiDisplayName(ai))+'"><i class="fas fa-trash-alt" aria-hidden="true"></i></button></div></div>'; }
  function updateTableHtml(){ return '<div class="aip-table-wrap"><table><thead><tr><th>'+T.colAiLimit+'</th><th>'+T.colUsed+'</th><th>'+T.windowFieldLabel+'</th><th>'+T.colRemaining+'</th><th>'+T.colNextReset+'</th><th></th></tr></thead><tbody>'+state.ais.map(function(ai){return sortedLimits(ai.limits).map(function(l){var c=calc(l),percentValue=String(Math.round(c.usedPercent*10)/10),windowClass='window-'+l.windowHours;return '<tr class="aip-window-row '+windowClass+'"><td class="aip-update-ai-cell"><span class="aip-ai-title-row"><strong>'+esc(aiDisplayName(ai))+'</strong></span></td><td><div class="aip-usage-input-wrap"><input type="number" min="0" max="100" step="1" value="'+percentValue+'" data-aip-usage="'+ai.id+'|'+l.id+'" aria-label="'+T.colUsed+' '+esc(aiDisplayName(ai))+' '+esc(windowLabel(l.windowHours))+'"><span>%</span></div></td><td class="aip-window-cell"><span class="aip-ai-title-row">'+aiIconHtml(ai.providerKey,'aip-ai-icon-sm')+'<span class="aip-window-badge '+windowClass+'">'+esc(windowLabelShort(l.windowHours))+'</span></span></td><td><div class="aip-usage-input-wrap"><input type="number" min="0" max="100" step="1" value="'+String(Math.round(c.pct*10)/10)+'" data-aip-remaining="'+ai.id+'|'+l.id+'" aria-label="'+T.colRemaining+' '+esc(aiDisplayName(ai))+' '+esc(windowLabel(l.windowHours))+'"><span>%</span></div></td><td><input type="datetime-local" value="'+toLocalInput(l.resetAt)+'" data-aip-reset="'+ai.id+'|'+l.id+'" aria-label="'+T.colNextReset+' '+esc(aiDisplayName(ai))+' '+esc(windowLabel(l.windowHours))+'"></td><td><button type="button" class="aip-save-usage-btn" data-aip-save-usage="'+ai.id+'|'+l.id+'" disabled>'+T.saveBtn+'</button></td></tr>';}).join('');}).join('')+'</tbody></table></div>'; }
  function compareTableHtml(){ return '<div class="aip-table-wrap"><table><thead><tr><th>'+T.colAi+'</th><th>'+T.colMostRestrictiveLimit+'</th><th>'+T.colRemaining+'</th><th>'+T.colSafePace+'</th><th>'+T.colReset+'</th><th>'+T.colStatus+'</th></tr></thead><tbody>'+state.ais.map(function(ai){var h=health(ai), worst=ai.limits.length?ai.limits.map(function(l){return {limit:l,calc:calc(l)};}).reduce(function(a,b){return b.calc.pct<a.calc.pct?b:a;}):null; return '<tr><td><span class="aip-ai-title-row">'+aiIconHtml(ai.providerKey,'aip-ai-icon-sm')+'<strong>'+esc(aiDisplayName(ai))+'</strong></span>'+(aiMeta(ai)?'<span class="aip-cell-note">'+esc(aiMeta(ai))+'</span>':'')+'</td><td>'+(worst?esc(windowLabel(worst.limit.windowHours)):'<span class="aip-cell-note">'+T.noLimitsShort+'</span>')+'</td><td>'+(worst?fmtNum(worst.calc.pct)+'%':'—')+'</td><td>'+(worst?fmtNum(worst.calc.perHour)+' '+T.perHourSuffix:'—')+'</td><td>'+(worst?fmtDate(worst.limit.resetAt):'—')+'</td><td><span class="aip-health '+h.signal+'">'+healthLabel(h.signal)+'</span></td></tr>';}).join('')+'</tbody></table></div>'; }

  function setScreen(name){ activeScreen=name; root.querySelectorAll('[data-aip-screen]').forEach(function(b){b.classList.toggle('active',b.getAttribute('data-aip-screen')===name);}); root.querySelectorAll('[data-aip-panel]').forEach(function(p){p.classList.toggle('active',p.getAttribute('data-aip-panel')===name);}); render(); }

  function render(){
    root.querySelectorAll('[data-aip-screen]').forEach(function(b){b.classList.toggle('active',b.getAttribute('data-aip-screen')===activeScreen);});
    root.querySelectorAll('[data-aip-panel]').forEach(function(p){p.classList.toggle('active',p.getAttribute('data-aip-panel')===activeScreen);});
    var list=root.querySelector('[data-aip-list]'), cards=root.querySelector('[data-aip-cards]'), stats=root.querySelector('[data-aip-stats]'), intro=root.querySelector('[data-aip-intro]'), update=root.querySelector('[data-aip-update]'), compare=root.querySelector('[data-aip-compare]'), statusFilters=root.querySelector('[data-aip-status-filters]');
    var hasAis = state.ais.length > 0;

    if (stats) {
      stats.style.display = hasAis ? '' : 'none';
      if (hasAis) {
        var total=state.ais.reduce(function(n,a){return n+a.limits.length;},0), worstPair=state.ais.map(function(a){return {ai:a,h:health(a)};}).reduce(function(x,y){return y.h.pct<x.h.pct?y:x;}), worstClass=worstPair.h.signal==='bad'?'aip-text-bad':worstPair.h.signal==='warn'?'aip-text-warn':'aip-text-good';
        stats.innerHTML='<div class="aip-stat"><small>'+T.statAiTools+'</small><strong>'+state.ais.length+'</strong></div><div class="aip-stat"><small>'+T.statActiveLimits+'</small><strong>'+total+'</strong></div><div class="aip-stat"><small>'+T.statMostRestrictive+'</small><strong class="'+worstClass+'">'+fmtNum(worstPair.h.pct)+'% '+T.left+'</strong><span class="aip-stat-note">'+esc(aiDisplayName(worstPair.ai))+'</span></div>';
      }
    }
    if (intro) intro.innerHTML = hasAis ? '' : introHtml();
    var aiSignals = state.ais.map(function(a){return {ai:a,signal:health(a).signal};});
    if (statusFilters) {
      statusFilters.style.display = hasAis ? '' : 'none';
      if (hasAis) {
        var counts={all:state.ais.length,good:0,warn:0,bad:0};
        aiSignals.forEach(function(x){counts[x.signal]=(counts[x.signal]||0)+1;});
        var filterDefs=[{key:'all',label:T.filterAll},{key:'good',label:T.onTrack},{key:'warn',label:T.watchPace},{key:'bad',label:T.overPace}];
        statusFilters.innerHTML=filterDefs.map(function(f){return '<button type="button" class="aip-status-filter-btn'+(dashboardFilter===f.key?' active':'')+'" data-aip-filter="'+f.key+'" aria-pressed="'+(dashboardFilter===f.key?'true':'false')+'">'+f.label+' <span class="aip-filter-count">'+(counts[f.key]||0)+'</span></button>';}).join('');
      }
    }
    var visibleAis = hasAis ? (dashboardFilter==='all'?state.ais:aiSignals.filter(function(x){return x.signal===dashboardFilter;}).map(function(x){return x.ai;})) : [];
    if (cards) cards.innerHTML = hasAis ? (visibleAis.length?visibleAis.map(aiCardHtml).join(''):'<p class="aip-note">'+T.noFilterMatch+'</p>')+addCardHtml() : '';
    if (list) list.innerHTML = hasAis ? state.ais.map(listItemHtml).join('') : emptyHtml(T.noAisTitle, T.noAisManageDesc);
    if (update) {
      var aipPendingUsage={}, aipPendingReset={};
      root.querySelectorAll('[data-aip-save-usage].is-ready').forEach(function(btn){ var key=btn.getAttribute('data-aip-save-usage'), uInput=root.querySelector('[data-aip-usage="'+key+'"]'), rInput=root.querySelector('[data-aip-reset="'+key+'"]'); if(uInput) aipPendingUsage[key]=uInput.value; if(rInput) aipPendingReset[key]=rInput.value; });
      update.innerHTML = hasAis ? updateTableHtml() : emptyHtml(T.nothingUpdateTitle, T.nothingUpdateDesc);
      Object.keys(aipPendingUsage).forEach(function(key){ var uInput=root.querySelector('[data-aip-usage="'+key+'"]'), btn=root.querySelector('[data-aip-save-usage="'+key+'"]'); if(uInput) uInput.value=aipPendingUsage[key]; if(aipPendingReset[key]!==undefined){ var rInput=root.querySelector('[data-aip-reset="'+key+'"]'); if(rInput) rInput.value=aipPendingReset[key]; } if(btn){ btn.disabled=false; btn.classList.add('is-ready'); } });
    }
    if (compare) compare.innerHTML = hasAis ? compareTableHtml() : emptyHtml(T.nothingCompareTitle, T.nothingCompareDesc);
  }

  function openModal(){ modalBackdrop.classList.add('open'); }
  function closeModal(){ modalBackdrop.classList.remove('open'); }
  modalBackdrop.addEventListener('click', function (e) { if (e.target === modalBackdrop) closeModal(); });
  root.querySelectorAll('[data-aip-modal-close]').forEach(function (btn) { btn.addEventListener('click', closeModal); });
  document.addEventListener('keydown', function (e) { if (e.key === 'Escape' && modalBackdrop.classList.contains('open')) closeModal(); });

  function syncCustomName(){ var form=root.querySelector('[data-aip-form]'), provider=form.querySelector('[name="providerKey"]'), name=form.querySelector('[name="name"]'), wrap=root.querySelector('.aip-custom-name-wrap'), custom=provider.value==='custom'; wrap.classList.toggle('is-hidden',!custom); name.required=custom; name.disabled=!custom; if(!custom)name.value=providerName(provider.value); }
  function openEditor(id){ editingId=id||null; var ai=id?state.ais.find(function(a){return a.id===id;}):null, form=root.querySelector('[data-aip-form]'); form.reset(); form.querySelector('[name="aiId"]').value=ai?ai.id:''; form.querySelector('[name="providerKey"]').value=ai?ai.providerKey:'custom'; form.querySelector('[name="name"]').value=ai?ai.name:''; syncCustomName(); root.querySelector('[data-aip-modal-title]').textContent=ai?T.modalEditTitle:T.modalAddTitle; renderLimitEditor(ai?sortedLimits(ai.limits):[defaultLimit()]); openModal(); }
  function renderLimitEditor(limits){ root.querySelector('[data-aip-limit-editor]').innerHTML=limits.map(function(l){return '<div class="aip-limit-row" data-limit-row="'+l.id+'"><button type="button" class="btn-icon-danger" data-aip-remove-limit="'+l.id+'" aria-label="'+T.removeLimitTitle+'" title="'+T.removeLimitTitle+'"><i class="fas fa-trash-alt" aria-hidden="true"></i></button><div class="aip-limit-fields"><div><label>'+T.windowFieldLabel+'</label><select data-l-field="windowHours"><option value="5" '+(l.windowHours==5?'selected':'')+'>'+windowLabelShort(5)+'</option><option value="24" '+(l.windowHours==24?'selected':'')+'>'+windowLabelShort(24)+'</option><option value="168" '+(l.windowHours==168?'selected':'')+'>'+windowLabelShort(168)+'</option><option value="720" '+(l.windowHours==720?'selected':'')+'>'+windowLabelShort(720)+'</option></select></div><div><label>'+T.usedNowLabel+'</label><div class="aip-usage-input-wrap"><input type="number" min="0" max="100" step="1" data-l-field="usedPercent" value="'+esc(l.usedPercent)+'"><span>%</span></div><span class="aip-field-note">'+T.usedNowNote+'</span></div><div><label>'+T.nextResetLabel+'</label><input type="datetime-local" data-l-field="resetAt" value="'+toLocalInput(l.resetAt)+'"></div></div></div>';}).join(''); }
  function toLocalInput(iso){ var d=new Date(iso), off=d.getTimezoneOffset()*60000; return new Date(d.getTime()-off).toISOString().slice(0,16); }
  function fromLocal(v){ var d=new Date(v); return isNaN(d)?new Date(Date.now()+168*3600000).toISOString():d.toISOString(); }
  function collectLimits(){ return Array.prototype.slice.call(root.querySelectorAll('[data-limit-row]')).map(function(row){function val(k){var e=row.querySelector('[data-l-field="'+k+'"]');return e?e.value:'';} var windowHours=Math.max(.1,Number(val('windowHours'))||168), usedPercent=Math.max(0,Math.min(100,Number(val('usedPercent'))||0)); return {id:row.getAttribute('data-limit-row'),label:windowLabel(windowHours),allowance:100,windowHours:windowHours,resetAt:fromLocal(val('resetAt')),usedPercent:usedPercent,used:usedPercent,updatedAt:new Date().toISOString()};}); }
  function enableUsageSave(e){var field=e.target.closest('[data-aip-usage],[data-aip-remaining],[data-aip-reset]');if(!field)return;var key=field.getAttribute('data-aip-usage')||field.getAttribute('data-aip-remaining')||field.getAttribute('data-aip-reset'),button=root.querySelector('[data-aip-save-usage="'+key+'"]');if(button){button.disabled=false;button.classList.add('is-ready');}}
  function syncUsageFields(e){ var used=e.target.closest('[data-aip-usage]'); if(used){ var key=used.getAttribute('data-aip-usage'), rem=root.querySelector('[data-aip-remaining="'+key+'"]'); if(rem) rem.value=String(Math.round((100-(Number(used.value)||0))*10)/10); return; } var rem2=e.target.closest('[data-aip-remaining]'); if(rem2){ var key2=rem2.getAttribute('data-aip-remaining'), used2=root.querySelector('[data-aip-usage="'+key2+'"]'); if(used2) used2.value=String(Math.round((100-(Number(rem2.value)||0))*10)/10); } }
  root.addEventListener('input',enableUsageSave); root.addEventListener('change',enableUsageSave);
  root.addEventListener('input',syncUsageFields);

  root.addEventListener('click',function(e){var t=e.target.closest('[data-aip-action],[data-aip-screen],[data-aip-edit],[data-aip-remove],[data-aip-update-ai],[data-aip-save-usage],[data-aip-remove-limit],[data-aip-toggle-float],[data-aip-toggle-warning],[data-aip-filter]');if(!t)return;if(t.dataset.aipToggleWarning){collapsedPaceWarnings[t.dataset.aipToggleWarning]=!collapsedPaceWarnings[t.dataset.aipToggleWarning];render();return;}if(t.dataset.aipFilter){dashboardFilter=t.dataset.aipFilter;render();return;}if(t.dataset.aipToggleFloat){toggleFloat(t.dataset.aipToggleFloat);return;}if(t.dataset.aipScreen){setScreen(t.dataset.aipScreen);return;}if(t.dataset.aipAction==='add'){openEditor();return;}if(t.dataset.aipAction==='add-limit'){var ls=collectLimits();ls.push(defaultLimit());renderLimitEditor(ls);return;}if(t.dataset.aipRemoveLimit){var kept=collectLimits().filter(function(l){return l.id!==t.dataset.aipRemoveLimit;});if(!kept.length)kept.push(defaultLimit());renderLimitEditor(kept);return;}if(t.dataset.aipEdit){openEditor(t.dataset.aipEdit);return;}if(t.dataset.aipRemove){if(confirm(T.confirmRemoveAi)){state.ais=state.ais.filter(function(a){return a.id!==t.dataset.aipRemove;});saveFloating(loadFloating().filter(function(id){return id.indexOf(t.dataset.aipRemove+'|')!==0;}));save();}return;}if(t.dataset.aipUpdateAi){setScreen('update');return;}if(t.dataset.aipSaveUsage){var parts=t.dataset.aipSaveUsage.split('|'), input=root.querySelector('[data-aip-usage="'+t.dataset.aipSaveUsage+'"]'), resetInput=root.querySelector('[data-aip-reset="'+t.dataset.aipSaveUsage+'"]'),ai=state.ais.find(function(a){return a.id===parts[0]}),l=ai&&ai.limits.find(function(x){return x.id===parts[1]});if(l&&input){l.usedPercent=Math.max(0,Math.min(100,Number(input.value)||0));l.used=l.allowance*l.usedPercent/100;if(resetInput&&resetInput.value)l.resetAt=fromLocal(resetInput.value);l.updatedAt=new Date().toISOString();t.disabled=true;t.classList.remove('is-ready');save();}}if(t.dataset.aipAction==='export'){var payload={version:state.version||1,author:'Flavio Di Virgilio',email:'flavio.di.virgilio@gmail.com',tool:toolUrl,ais:state.ais};var blob=new Blob([JSON.stringify(payload,null,2)],{type:'application/json'}),a=document.createElement('a');a.href=URL.createObjectURL(blob);a.download='ai-usage-planner-'+new Date().toISOString().slice(0,10)+'.json';a.click();URL.revokeObjectURL(a.href);}});

  root.querySelector('[name="providerKey"]').addEventListener('change',syncCustomName);
  root.querySelector('[data-aip-form]').addEventListener('submit',function(e){e.preventDefault();var f=new FormData(e.target), providerKey=f.get('providerKey')||'custom', ai={id:f.get('aiId')||uid('ai'),name:providerKey==='custom'?String(f.get('name')).trim():providerName(providerKey),providerKey:providerKey,limits:collectLimits()};if(!ai.name){return;}var index=state.ais.findIndex(function(a){return a.id===ai.id;});if(index>=0)state.ais[index]=ai;else state.ais.push(ai);save();closeModal();setScreen('dashboard');});
  root.querySelector('[data-aip-import]').addEventListener('change',function(e){var file=e.target.files[0];if(!file)return;var reader=new FileReader();reader.onload=function(){try{var incoming=normalize(JSON.parse(reader.result));if(!Array.isArray(incoming.ais))throw new Error();if(confirm(T.confirmImport)){state=incoming;save();setScreen('dashboard');}}catch(err){alert(T.invalidImport);}e.target.value='';};reader.readAsText(file);});

  function rollExpired(){var rolled=false;state.ais.forEach(function(ai){ai.limits.forEach(function(l){var reset=new Date(l.resetAt), now=Date.now(), step=Math.max(.1,l.windowHours)*3600000;if(reset.getTime()<=now){var jumps=Math.floor((now-reset.getTime())/step)+1;l.resetAt=new Date(reset.getTime()+jumps*step).toISOString();l.used=0;l.usedPercent=0;l.updatedAt=new Date().toISOString();rolled=true;}});});return rolled;}
  function screenFromHash(){ var h=(window.location.hash||'').replace('#',''); return ['dashboard','manage','compare','update'].indexOf(h)>=0?h:null; }
  function reorderAis(draggedId,targetId,before){ if(draggedId===targetId) return false; var list=state.ais, from=list.findIndex(function(a){return a.id===draggedId;}); if(from<0) return false; var item=list.splice(from,1)[0], to=list.findIndex(function(a){return a.id===targetId;}); if(to<0){ list.push(item); } else { list.splice(before?to:to+1,0,item); } return true; }
  var draggedAiId=null;
  var collapsedPaceWarnings={};
  function clearDragState(){ draggedAiId=null; root.querySelectorAll('.aip-dragging').forEach(function(el){el.classList.remove('aip-dragging');}); root.querySelectorAll('.aip-drag-over-before,.aip-drag-over-after').forEach(function(el){el.classList.remove('aip-drag-over-before','aip-drag-over-after');}); }
  function setupDragReorder(container){
    if(!container) return;
    container.addEventListener('dragstart',function(e){ var handle=e.target.closest('.aip-drag-handle'); if(!handle){ e.preventDefault(); return; } var card=handle.closest('[data-aip-ai-id]'); if(!card) return; draggedAiId=card.getAttribute('data-aip-ai-id'); e.dataTransfer.effectAllowed='move'; try{ e.dataTransfer.setData('text/plain',draggedAiId); }catch(err){} try{ e.dataTransfer.setDragImage(card,20,20); }catch(err){} card.classList.add('aip-dragging'); });
    container.addEventListener('dragover',function(e){ if(!draggedAiId) return; var card=e.target.closest('[data-aip-ai-id]'); if(!card||card.getAttribute('data-aip-ai-id')===draggedAiId) return; e.preventDefault(); e.dataTransfer.dropEffect='move'; root.querySelectorAll('.aip-drag-over-before,.aip-drag-over-after').forEach(function(el){if(el!==card)el.classList.remove('aip-drag-over-before','aip-drag-over-after');}); var rect=card.getBoundingClientRect(), before=(e.clientY-rect.top)<rect.height/2; card.classList.toggle('aip-drag-over-before',before); card.classList.toggle('aip-drag-over-after',!before); });
    container.addEventListener('drop',function(e){ if(!draggedAiId) return; var card=e.target.closest('[data-aip-ai-id]'); e.preventDefault(); if(card){ var targetId=card.getAttribute('data-aip-ai-id'); if(targetId!==draggedAiId){ var rect=card.getBoundingClientRect(), before=(e.clientY-rect.top)<rect.height/2; if(reorderAis(draggedAiId,targetId,before)){ clearDragState(); save(); return; } } } clearDragState(); });
    container.addEventListener('dragend',clearDragState);
  }
  setupDragReorder(root.querySelector('[data-aip-cards]'));
  setupDragReorder(root.querySelector('[data-aip-list]'));
  rollExpired(); save(); setScreen(screenFromHash()||activeScreen); window.addEventListener('hashchange',function(){var s=screenFromHash();if(s)setScreen(s);}); setInterval(function(){if(rollExpired())save();else render();},60000);
})();
</script>
