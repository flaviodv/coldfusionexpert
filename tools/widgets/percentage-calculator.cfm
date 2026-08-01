<div class="tool-widget widget-percentage-calculator">
  <label for="pc-percent"><cfif local.isEs>¿Qué porcentaje?<cfelse>What percentage?</cfif></label><input id="pc-percent" type="number" step="any" value="10">
  <label for="pc-number"><cfif local.isEs>¿De qué número?<cfelse>Of what number?</cfif></label><input id="pc-number" type="number" step="any" value="100">
  <button type="button" class="btn-social btn-upwork" id="pc-run"><i class="fas fa-percentage"></i> <cfif local.isEs>Calcular<cfelse>Calculate</cfif></button>
  <p class="tool-message" id="pc-result" aria-live="polite"></p><hr>
  <label for="pc-change-old"><cfif local.isEs>Valor original<cfelse>Original value</cfif></label><input id="pc-change-old" type="number" step="any">
  <label for="pc-change-new"><cfif local.isEs>Valor nuevo<cfelse>New value</cfif></label><input id="pc-change-new" type="number" step="any">
  <button type="button" class="btn-social btn-upwork" id="pc-change-run"><i class="fas fa-chart-line"></i> <cfif local.isEs>Calcular variación<cfelse>Calculate change</cfif></button><p class="tool-message" id="pc-change-result" aria-live="polite"></p>
</div>
<script>
(function(){function num(id){return Number(document.getElementById(id).value);}document.getElementById('pc-run').addEventListener('click',function(){var p=num('pc-percent'),n=num('pc-number'),r=document.getElementById('pc-result');if(!isFinite(p)||!isFinite(n)){r.className='tool-message is-error';r.textContent='<cfif local.isEs>Ingresá valores válidos.<cfelse>Enter valid values.</cfif>';return;}r.className='tool-message';r.textContent=p+'% <cfif local.isEs>de<cfelse>of</cfif> '+n+' = '+(p*n/100);});document.getElementById('pc-change-run').addEventListener('click',function(){var old=num('pc-change-old'),next=num('pc-change-new'),r=document.getElementById('pc-change-result');if(!isFinite(old)||!isFinite(next)||old===0){r.className='tool-message is-error';r.textContent='<cfif local.isEs>Ingresá valores válidos y un original distinto de cero.<cfelse>Enter valid values and a non-zero original value.</cfif>';return;}var pct=(next-old)/old*100;r.className='tool-message';r.textContent='<cfif local.isEs>Variación:<cfelse>Change:</cfif> '+(pct>=0?'+':'')+pct.toFixed(2)+'% ('+(pct>=0?'<cfif local.isEs>aumento<cfelse>increase</cfif>':'<cfif local.isEs>descuento<cfelse>decrease</cfif>')+')';});}());
</script>
