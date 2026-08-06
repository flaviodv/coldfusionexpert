<div class="tool-widget widget-email-signature-generator">
  <div class="sig-form-grid">
    <div>
      <label for="sig-name"><cfif local.isEs>Nombre completo<cfelse>Full name</cfif></label>
      <input id="sig-name" type="text" placeholder="<cfif local.isEs>Juan Pérez<cfelse>John Doe</cfif>">
      <label for="sig-title"><cfif local.isEs>Cargo / Puesto<cfelse>Job title</cfif></label>
      <input id="sig-title" type="text" placeholder="<cfif local.isEs>Gerente de Ventas<cfelse>Sales Manager</cfif>">
      <label for="sig-company"><cfif local.isEs>Empresa<cfelse>Company</cfif></label>
      <input id="sig-company" type="text" placeholder="<cfif local.isEs>Mi Empresa<cfelse>My Company</cfif>">
    </div>
    <div>
      <label for="sig-phone"><cfif local.isEs>Teléfono<cfelse>Phone</cfif></label>
      <input id="sig-phone" type="text" placeholder="+54 9 223 602-6142">
      <label for="sig-email"><cfif local.isEs>Email<cfelse>Email</cfif></label>
      <input id="sig-email" type="text" placeholder="nombre@empresa.com">
      <label for="sig-website"><cfif local.isEs>Sitio web (opcional)<cfelse>Website (optional)</cfif></label>
      <input id="sig-website" type="text" placeholder="https://empresa.com">
    </div>
  </div>
  <label for="sig-color"><cfif local.isEs>Color de acento<cfelse>Accent color</cfif></label>
  <input id="sig-color" type="color" value="#13aff0">

  <p class="tool-message"><cfif local.isEs>Vista previa<cfelse>Preview</cfif></p>
  <div class="sig-preview" id="sig-preview"></div>

  <button type="button" class="tool-copy" data-copy-target="sig-html-source"><i class="far fa-copy"></i> <cfif local.isEs>Copiar código HTML<cfelse>Copy HTML code</cfif></button>
  <textarea id="sig-html-source" rows="4" readonly spellcheck="false" style="margin-top:14px;"></textarea>
  <p class="tool-message"><cfif local.isEs>Pegá este código HTML en la configuración de firma de Gmail, Outlook, etc. (algunos clientes aceptan pegar directamente la vista previa de arriba).<cfelse>Paste this HTML code into the signature settings of Gmail, Outlook, etc. (some clients accept pasting the preview above directly).</cfif></p>
</div>
<style>
  .sig-form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 0 20px; }
  @media (max-width: 600px) { .sig-form-grid { grid-template-columns: 1fr; } }
  .sig-preview { border: 1px solid #dfe5e8; border-radius: 8px; padding: 20px; margin: 10px 0 20px; overflow-x: auto; background: #fff; }
</style>
<script>
(function () {
  var ids = ['sig-name', 'sig-title', 'sig-company', 'sig-phone', 'sig-email', 'sig-website', 'sig-color'];
  var preview = document.getElementById('sig-preview');
  var source = document.getElementById('sig-html-source');

  function val(id) {
    var el = document.getElementById(id);
    return el.value.trim() || el.placeholder || '';
  }

  function buildHtml() {
    var name = val('sig-name');
    var title = val('sig-title');
    var company = val('sig-company');
    var phone = val('sig-phone');
    var email = val('sig-email');
    var website = val('sig-website');
    var color = document.getElementById('sig-color').value || '#13aff0';

    var html = '' +
      '<table cellpadding="0" cellspacing="0" border="0" style="font-family:Arial,Helvetica,sans-serif;font-size:13px;color:#333333;">' +
      '<tr><td style="border-left:3px solid ' + color + ';padding:4px 0 4px 14px;">' +
      '<div style="font-size:15px;font-weight:bold;color:#222222;">' + esc(name) + '</div>' +
      (title ? '<div style="color:' + color + ';font-weight:bold;">' + esc(title) + '</div>' : '') +
      (company ? '<div>' + esc(company) + '</div>' : '') +
      '<div style="margin-top:6px;">' +
      (phone ? esc(phone) : '') +
      (phone && email ? ' &nbsp;|&nbsp; ' : '') +
      (email ? '<a href="mailto:' + esc(email) + '" style="color:' + color + ';text-decoration:none;">' + esc(email) + '</a>' : '') +
      '</div>' +
      (website ? '<div><a href="' + esc(website) + '" style="color:' + color + ';text-decoration:none;">' + esc(website) + '</a></div>' : '') +
      '</td></tr></table>';
    return html;
  }

  function esc(s) {
    return String(s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
  }

  function render() {
    var html = buildHtml();
    preview.innerHTML = html;
    source.value = html;
  }

  ids.forEach(function (id) {
    document.getElementById(id).addEventListener('input', render);
  });
  render();
}());
</script>
