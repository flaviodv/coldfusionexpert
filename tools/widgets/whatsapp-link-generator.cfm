<div class="tool-widget widget-whatsapp-link-generator">
  <label for="wa-phone"><cfif local.isEs>Número de teléfono (con código de país, solo números)<cfelse>Phone number (with country code, digits only)</cfif></label>
  <input id="wa-phone" type="text" inputmode="numeric" placeholder="<cfif local.isEs>Ej: 5492236026142<cfelse>E.g. 5492236026142</cfif>">
  <label for="wa-message"><cfif local.isEs>Mensaje predefinido (opcional)<cfelse>Pre-filled message (optional)</cfif></label>
  <textarea id="wa-message" rows="4" placeholder="<cfif local.isEs>Hola, quería consultar sobre...<cfelse>Hello, I'd like to ask about...</cfif>"></textarea>
  <button type="button" class="btn-social btn-upwork" id="wa-generate"><i class="fab fa-whatsapp"></i> <cfif local.isEs>Generar enlace<cfelse>Generate link</cfif></button>
  <p class="tool-message" id="wa-message-status" aria-live="polite"></p>
  <label for="wa-output"><cfif local.isEs>Tu enlace de WhatsApp<cfelse>Your WhatsApp link</cfif></label>
  <input id="wa-output" type="text" readonly>
  <button type="button" class="tool-copy" data-copy-target="wa-output"><i class="far fa-copy"></i> <cfif local.isEs>Copiar<cfelse>Copy</cfif></button>
  <a id="wa-test-link" class="btn-social btn-linkedin" href="#" target="_blank" style="display:none;"><i class="fas fa-external-link-alt"></i> <cfif local.isEs>Probar enlace<cfelse>Test link</cfif></a>
</div>
<script>
(function () {
  var isEs = <cfif local.isEs>true<cfelse>false</cfif>;
  var phoneEl = document.getElementById('wa-phone');
  var msgEl = document.getElementById('wa-message');
  var outEl = document.getElementById('wa-output');
  var statusEl = document.getElementById('wa-message-status');
  var testLink = document.getElementById('wa-test-link');

  document.getElementById('wa-generate').addEventListener('click', function () {
    var digits = (phoneEl.value || '').replace(/\D/g, '');
    if (!digits) {
      outEl.value = '';
      testLink.style.display = 'none';
      statusEl.textContent = isEs ? 'Ingresá un número de teléfono válido.' : 'Enter a valid phone number.';
      statusEl.className = 'tool-message is-error';
      return;
    }
    var url = 'https://wa.me/' + digits;
    var msg = (msgEl.value || '').trim();
    if (msg) {
      url += '?text=' + encodeURIComponent(msg);
    }
    outEl.value = url;
    testLink.href = url;
    testLink.style.display = 'inline-flex';
    statusEl.textContent = '';
    statusEl.className = 'tool-message';
  });
}());
</script>
