<cfif session.lan eq "es">
  <cfinclude template="about_me_es.cfm">
<cfelse>
  <cfinclude template="about_me_en.cfm">
</cfif>
<script>
(function () {
  function startAboutBlink() {
    var portrait = document.querySelector('.about-blink-frame');
    if (!portrait) return;

    function blink() {
      portrait.classList.add('is-blinking');
      window.setTimeout(function () {
        portrait.classList.remove('is-blinking');
        window.setTimeout(blink, 5500 + Math.random() * 6500);
      }, 110);
    }

    window.setTimeout(blink, 2800 + Math.random() * 1800);
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', startAboutBlink);
  else startAboutBlink();
}());
</script>
