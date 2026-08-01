<script src="/assets/js/vendor/md5.min.js"></script>
<div class="tool-widget widget-hash-generator">
  <label for="hash-input"><cfif local.isEs>Texto de entrada<cfelse>Input text</cfif></label><textarea id="hash-input" rows="6"></textarea>
  <button type="button" class="btn-social btn-upwork" id="hash-run"><i class="fas fa-hashtag"></i> <cfif local.isEs>Generar hashes<cfelse>Generate hashes</cfif></button>
  <div class="hash-results"><label>MD5<input id="hash-md5" readonly></label><label>SHA-1<input id="hash-sha1" readonly></label><label>SHA-256<input id="hash-sha256" readonly></label></div><p class="tool-message" id="hash-message" aria-live="polite"></p>
</div>
<script>
(function(){function hex(b){return Array.prototype.map.call(new Uint8Array(b),function(v){return v.toString(16).padStart(2,'0');}).join('');}async function digest(a,s){return hex(await crypto.subtle.digest(a,new TextEncoder().encode(s)));}document.getElementById('hash-run').addEventListener('click',async function(){var s=document.getElementById('hash-input').value,m=document.getElementById('hash-message');try{document.getElementById('hash-md5').value=md5(s);document.getElementById('hash-sha1').value=await digest('SHA-1',s);document.getElementById('hash-sha256').value=await digest('SHA-256',s);m.textContent='';}catch(e){m.textContent='<cfif local.isEs>No se pudieron generar los hashes.<cfelse>Could not generate hashes.</cfif>';m.className='tool-message is-error';}});}());
</script>
