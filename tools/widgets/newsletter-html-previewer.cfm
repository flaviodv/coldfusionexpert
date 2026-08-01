<div class="tool-widget widget-newsletter-html-previewer">
  <div class="newsletter-preview-grid">
    <div class="newsletter-input-panel">
      <label for="nlp-input"><cfif local.isEs>Código HTML<cfelse>HTML Code</cfif></label>
      <textarea id="nlp-input" rows="18" spellcheck="false" placeholder="<cfif local.isEs>Pegá acá el HTML de tu newsletter o campaña de email...<cfelse>Paste your newsletter or email campaign HTML here...</cfif>"></textarea>
      <div class="widget-buttons">
        <button type="button" class="btn-social btn-upwork" id="nlp-render"><i class="fas fa-eye"></i> <cfif local.isEs>Renderizar<cfelse>Render</cfif></button>
        <button type="button" class="tool-copy" id="nlp-clear"><i class="far fa-trash-alt"></i> <cfif local.isEs>Limpiar<cfelse>Clear</cfif></button>
      </div>
      <p class="tool-message" id="nlp-message" aria-live="polite"></p>
    </div>
    <div class="newsletter-output-panel">
      <label><cfif local.isEs>Vista previa<cfelse>Preview</cfif></label>
      <iframe id="nlp-preview" title="<cfif local.isEs>Vista previa del HTML<cfelse>HTML preview</cfif>" sandbox=""></iframe>
    </div>
  </div>
</div>
<script>
(function(){
  var input = document.getElementById('nlp-input'),
      frame = document.getElementById('nlp-preview'),
      msg = document.getElementById('nlp-message');

  function render(){
    var html = input.value;
    if(!html.trim()){
      msg.textContent = '<cfif local.isEs>Pegá HTML para previsualizar.<cfelse>Paste some HTML to preview.</cfif>';
      msg.className = 'tool-message is-error';
      frame.removeAttribute('srcdoc');
      return;
    }
    frame.srcdoc = html;
    msg.textContent = '';
    msg.className = 'tool-message';
  }

  document.getElementById('nlp-render').addEventListener('click', render);
  document.getElementById('nlp-clear').addEventListener('click', function(){
    input.value = '';
    frame.removeAttribute('srcdoc');
    msg.textContent = '';
    input.focus();
  });
}());
</script>
