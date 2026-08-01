<cfprocessingdirective pageencoding="UTF-8">
<div class="tool-widget widget-date-difference-calculator">
  <label for="date-diff-start"><cfif local.isEs>Fecha inicial<cfelse>Start date</cfif></label><input id="date-diff-start" type="date">
  <label for="date-diff-end"><cfif local.isEs>Fecha final<cfelse>End date</cfif></label><input id="date-diff-end" type="date">
  <button type="button" class="btn-social btn-upwork" id="date-diff-run"><i class="fas fa-calendar-alt"></i> <cfif local.isEs>Calcular diferencia<cfelse>Calculate difference</cfif></button><p class="tool-message" id="date-diff-result" aria-live="polite"></p>
</div>
<script>
(function(){var start=document.getElementById('date-diff-start'),end=document.getElementById('date-diff-end');var today=new Date().toISOString().slice(0,10);start.value=today;end.value=today;function parse(s){var a=s.split('-');return new Date(Number(a[0]),Number(a[1])-1,Number(a[2]));}document.getElementById('date-diff-run').addEventListener('click',function(){if(!start.value||!end.value)return;var a=parse(start.value),b=parse(end.value),sign=a>b?-1:1;if(sign<0){var temp=a;a=b;b=temp;}var years=b.getFullYear()-a.getFullYear(),months=b.getMonth()-a.getMonth(),days=b.getDate()-a.getDate();if(days<0){months--;days+=new Date(b.getFullYear(),b.getMonth(),0).getDate();}if(months<0){years--;months+=12;}var total=Math.round((b-a)/86400000),r=document.getElementById('date-diff-result');r.className='tool-message';r.textContent='<cfif local.isEs>Diferencia:<cfelse>Difference:</cfif> '+years+' <cfif local.isEs>años<cfelse>years</cfif>, '+months+' <cfif local.isEs>meses y<cfelse>months and</cfif> '+days+' <cfif local.isEs>días<cfelse>days</cfif> ('+total+' <cfif local.isEs>días en total<cfelse>days in total</cfif>).';});}());
</script>
