<div class="tool-widget widget-social-fonts">
  <label for="social-font-input"><cfif local.isEs>Tu texto<cfelse>Your text</cfif></label>
  <textarea id="social-font-input" rows="5" maxlength="500" placeholder="<cfif local.isEs>Escribí algo para transformar…<cfelse>Write something to transform…</cfif>"></textarea>
  <p class="tool-message" id="social-font-platform"><cfif local.isEs>Compatible con Instagram, TikTok, X, Threads, LinkedIn, Facebook, YouTube, Reddit y Bluesky.<cfelse>Works across Instagram, TikTok, X, Threads, LinkedIn, Facebook, YouTube, Reddit, and Bluesky.</cfif></p>
  <div class="social-font-results" id="social-font-results" aria-live="polite"></div>
</div>
<script>
(function () {
  var input = document.getElementById('social-font-input');
  var results = document.getElementById('social-font-results');
  var styles = [
    {name: '<cfif local.isEs>Negrita<cfelse>Bold</cfif>', upper: 0x1D400, lower: 0x1D41A, digit: 0x1D7CE},
    {name: '<cfif local.isEs>Negrita cursiva<cfelse>Bold italic</cfif>', upper: 0x1D468, lower: 0x1D482},
    {name: '<cfif local.isEs>Sans serif<cfelse>Sans serif</cfif>', upper: 0x1D5A0, lower: 0x1D5BA, digit: 0x1D7E2},
    {name: '<cfif local.isEs>Sans negrita<cfelse>Sans bold</cfif>', upper: 0x1D5D4, lower: 0x1D5EE, digit: 0x1D7EC},
    {name: '<cfif local.isEs>Sans cursiva<cfelse>Sans italic</cfif>', upper: 0x1D608, lower: 0x1D622},
    {name: '<cfif local.isEs>Sans negrita cursiva<cfelse>Sans bold italic</cfif>', upper: 0x1D63C, lower: 0x1D656},
    {name: '<cfif local.isEs>Monoespaciada<cfelse>Monospace</cfif>', upper: 0x1D670, lower: 0x1D68A, digit: 0x1D7F6},
    {name: '<cfif local.isEs>Manuscrita<cfelse>Script</cfif>', map: 'script'},
    {name: '<cfif local.isEs>Manuscrita negrita<cfelse>Bold script</cfif>', upper: 0x1D4D0, lower: 0x1D4EA},
    {name: '<cfif local.isEs>Gótica<cfelse>Fraktur</cfif>', map: 'fraktur'},
    {name: '<cfif local.isEs>Gótica negrita<cfelse>Bold fraktur</cfif>', upper: 0x1D56C, lower: 0x1D586},
    {name: '<cfif local.isEs>Doble trazo<cfelse>Double-struck</cfif>', map: 'double'},
    {name: '<cfif local.isEs>Ancha<cfelse>Fullwidth</cfif>', fullwidth: true},
    {name: '<cfif local.isEs>Caja llena<cfelse>Filled box</cfif>', map: 'filledBox', emoji: true},
    {name: '<cfif local.isEs>En círculo<cfelse>Circled</cfif>', circled: true},
    {name: '<cfif local.isEs>Entre paréntesis<cfelse>Parenthesized</cfif>', parenthesized: true},
    {name: '<cfif local.isEs>Versalitas<cfelse>Small caps</cfif>', smallCaps: true},
    {name: '<cfif local.isEs>Superíndice<cfelse>Superscript</cfif>', map: 'super'},
    {name: '<cfif local.isEs>Subíndice<cfelse>Subscript</cfif>', map: 'sub'},
    {name: '<cfif local.isEs>Tachada<cfelse>Strikethrough</cfif>', combine: '̶'},
    {name: '<cfif local.isEs>Subrayada<cfelse>Underlined</cfif>', combine: '̲'},
    {name: '<cfif local.isEs>Al revés<cfelse>Upside down</cfif>', map: 'flip'}
  ];
  var smallCaps = {'a':'ᴀ','b':'ʙ','c':'ᴄ','d':'ᴅ','e':'ᴇ','f':'ꜰ','g':'ɢ','h':'ʜ','i':'ɪ','j':'ᴊ','k':'ᴋ','l':'ʟ','m':'ᴍ','n':'ɴ','o':'ᴏ','p':'ᴘ','q':'ǫ','r':'ʀ','s':'ꜱ','t':'ᴛ','u':'ᴜ','v':'ᴠ','w':'ᴡ','x':'x','y':'ʏ','z':'ᴢ'};
  var maps = {
    script: {'A':'𝒜','B':'ℬ','C':'𝒞','D':'𝒟','E':'ℰ','F':'ℱ','G':'𝒢','H':'ℋ','I':'ℐ','J':'𝒥','K':'𝒦','L':'ℒ','M':'ℳ','N':'𝒩','O':'𝒪','P':'𝒫','Q':'𝒬','R':'ℛ','S':'𝒮','T':'𝒯','U':'𝒰','V':'𝒱','W':'𝒲','X':'𝒳','Y':'𝒴','Z':'𝒵','a':'𝒶','b':'𝒷','c':'𝒸','d':'𝒹','e':'ℯ','f':'𝒻','g':'ℊ','h':'𝒽','i':'𝒾','j':'𝒿','k':'𝓀','l':'𝓁','m':'𝓂','n':'𝓃','o':'ℴ','p':'𝓅','q':'𝓆','r':'𝓇','s':'𝓈','t':'𝓉','u':'𝓊','v':'𝓋','w':'𝓌','x':'𝓍','y':'𝓎','z':'𝓏'},
    fraktur: {'A':'𝔄','B':'𝔅','C':'ℭ','D':'𝔇','E':'𝔈','F':'𝔉','G':'𝔊','H':'ℌ','I':'ℑ','J':'𝔍','K':'𝔎','L':'𝔏','M':'𝔐','N':'𝔑','O':'𝔒','P':'𝔓','Q':'𝔔','R':'ℜ','S':'𝔖','T':'𝔗','U':'𝔘','V':'𝔙','W':'𝔚','X':'𝔛','Y':'𝔜','Z':'ℨ','a':'𝔞','b':'𝔟','c':'𝔠','d':'𝔡','e':'𝔢','f':'𝔣','g':'𝔤','h':'𝔥','i':'𝔦','j':'𝔧','k':'𝔨','l':'𝔩','m':'𝔪','n':'𝔫','o':'𝔬','p':'𝔭','q':'𝔮','r':'𝔯','s':'𝔰','t':'𝔱','u':'𝔲','v':'𝔳','w':'𝔴','x':'𝔵','y':'𝔶','z':'𝔷'},
    double: {'A':'𝔸','B':'𝔹','C':'ℂ','D':'𝔻','E':'𝔼','F':'𝔽','G':'𝔾','H':'ℍ','I':'𝕀','J':'𝕁','K':'𝕂','L':'𝕃','M':'𝕄','N':'ℕ','O':'𝕆','P':'ℙ','Q':'ℚ','R':'ℝ','S':'𝕊','T':'𝕋','U':'𝕌','V':'𝕍','W':'𝕎','X':'𝕏','Y':'𝕐','Z':'ℤ','a':'𝕒','b':'𝕓','c':'𝕔','d':'𝕕','e':'𝕖','f':'𝕗','g':'𝕘','h':'𝕙','i':'𝕚','j':'𝕛','k':'𝕜','l':'𝕝','m':'𝕞','n':'𝕟','o':'𝕠','p':'𝕡','q':'𝕢','r':'𝕣','s':'𝕤','t':'𝕥','u':'𝕦','v':'𝕧','w':'𝕨','x':'𝕩','y':'𝕪','z':'𝕫'},
    filledBox: {'a':'🅰','b':'🅱','c':'🅲','d':'🅳','e':'🅴','f':'🅵','g':'🅶','h':'🅷','i':'🅸','j':'🅹','k':'🅺','l':'🅻','m':'🅼','n':'🅽','o':'🅾','p':'🅿','q':'🆀','r':'🆁','s':'🆂','t':'🆃','u':'🆄','v':'🆅','w':'🆆','x':'🆇','y':'🆈','z':'🆉'},
    super: {'a':'ᵃ','b':'ᵇ','c':'ᶜ','d':'ᵈ','e':'ᵉ','f':'ᶠ','g':'ᵍ','h':'ʰ','i':'ⁱ','j':'ʲ','k':'ᵏ','l':'ˡ','m':'ᵐ','n':'ⁿ','o':'ᵒ','p':'ᵖ','q':'q','r':'ʳ','s':'ˢ','t':'ᵗ','u':'ᵘ','v':'ᵛ','w':'ʷ','x':'ˣ','y':'ʸ','z':'ᶻ','0':'⁰','1':'¹','2':'²','3':'³','4':'⁴','5':'⁵','6':'⁶','7':'⁷','8':'⁸','9':'⁹'},
    sub: {'a':'ₐ','b':'ᵦ','c':'𝚌','d':'ᑯ','e':'ₑ','f':'բ','g':'₉','h':'ₕ','i':'ᵢ','j':'ⱼ','k':'ₖ','l':'ₗ','m':'ₘ','n':'ₙ','o':'ₒ','p':'ₚ','q':'q','r':'ᵣ','s':'ₛ','t':'ₜ','u':'ᵤ','v':'ᵥ','w':'w','x':'ₓ','y':'ᵧ','z':'z','0':'₀','1':'₁','2':'₂','3':'₃','4':'₄','5':'₅','6':'₆','7':'₇','8':'₈','9':'₉'},
    flip: {'a':'ɐ','b':'q','c':'ɔ','d':'p','e':'ǝ','f':'ɟ','g':'ɓ','h':'ɥ','i':'ᴉ','j':'ɾ','k':'ʞ','l':'l','m':'ɯ','n':'u','o':'o','p':'d','q':'b','r':'ɹ','s':'s','t':'ʇ','u':'n','v':'ʌ','w':'ʍ','x':'x','y':'ʎ','z':'z','A':'∀','B':'𐐒','C':'Ↄ','D':'◖','E':'Ǝ','F':'Ⅎ','G':'⅁','H':'H','I':'I','J':'ſ','K':'⋊','L':'⅂','M':'W','N':'N','O':'O','P':'Ԁ','Q':'Ό','R':'ᴚ','S':'S','T':'┴','U':'∩','V':'Λ','W':'M','X':'X','Y':'⅄','Z':'Z','0':'0','1':'Ɩ','2':'ᄅ','3':'Ɛ','4':'ㄣ','5':'ϛ','6':'9','7':'ㄥ','8':'8','9':'6'}
  };
  function convert(text, style) {
    return Array.from(text).map(function (char) {
      var code = char.codePointAt(0), lower = code >= 97 && code <= 122, upper = code >= 65 && code <= 90, digit = code >= 48 && code <= 57;
      if (style.combine) return char === ' ' ? char : char + style.combine;
      if (style.map) return maps[style.map][char] || maps[style.map][char.toLowerCase()] || char;
      if (style.smallCaps) return lower ? smallCaps[char] : (upper ? smallCaps[char.toLowerCase()] : char);
      if (style.fullwidth) {
        if (upper) return String.fromCodePoint(0xFF21 + code - 65);
        if (lower) return String.fromCodePoint(0xFF41 + code - 97);
        if (digit) return String.fromCodePoint(0xFF10 + code - 48);
        return char === ' ' ? '　' : char;
      }
      if (style.circled) {
        if (upper) return String.fromCodePoint(0x24B6 + code - 65);
        if (lower) return String.fromCodePoint(0x24D0 + code - 97);
        if (digit) return code === 48 ? '⓪' : String.fromCodePoint(0x2460 + code - 49);
        return char;
      }
      if (style.parenthesized) {
        if (upper || lower) return String.fromCodePoint(0x249C + char.toLowerCase().codePointAt(0) - 97);
        if (digit && code !== 0) return String.fromCodePoint(0x2474 + code - 49);
        return char;
      }
      if (upper && style.upper) return String.fromCodePoint(style.upper + code - 65);
      if (lower && style.lower) return String.fromCodePoint(style.lower + code - 97);
      if (digit && style.digit) return String.fromCodePoint(style.digit + code - 48);
      return char;
    }).join('');
  }
  function copy(button) {
    navigator.clipboard.writeText(button.dataset.value).then(function () {
      var initial = button.innerHTML;
      button.innerHTML = '<i class="fas fa-check"></i> <cfif local.isEs>Copiado<cfelse>Copied</cfif>';
      setTimeout(function () { button.innerHTML = initial; }, 1400);
    });
  }
  function render() {
    var text = input.value || '<cfif local.isEs>Tu texto aquí<cfelse>Your text here</cfif>';
    results.innerHTML = '';
    styles.forEach(function (style) {
      var row = document.createElement('div'), output = convert(text, style), title = document.createElement('strong'), preview = document.createElement('div'), button = document.createElement('button');
      row.className = 'social-font-row'; title.textContent = style.name; preview.className = 'social-font-preview' + (style.emoji ? ' social-font-emoji' : ''); preview.textContent = output;
      button.type = 'button'; button.className = 'tool-copy'; button.dataset.value = output; button.innerHTML = '<i class="far fa-copy"></i> <cfif local.isEs>Copiar<cfelse>Copy</cfif>';
      button.addEventListener('click', function () { copy(button); }); row.appendChild(title); row.appendChild(preview); row.appendChild(button); results.appendChild(row);
    });
  }
  input.addEventListener('input', render); render();
}());
</script>
