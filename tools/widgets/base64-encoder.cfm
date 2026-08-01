<div class="tool-widget widget-base64-encoder">
  <div class="widget-buttons"><button type="button" class="btn-social btn-upwork" data-base64-action="encode"><cfif local.isEs>Codificar texto<cfelse>Encode text</cfif></button><button type="button" class="btn-social btn-upwork" data-base64-action="decode"><cfif local.isEs>Decodificar texto<cfelse>Decode text</cfif></button></div>
  <label for="base64-input"><cfif local.isEs>Texto o Base64<cfelse>Text or Base64</cfif></label><textarea id="base64-input" rows="6" spellcheck="false"></textarea>
  <label for="base64-output"><cfif local.isEs>Resultado<cfelse>Result</cfif></label><textarea id="base64-output" rows="6" readonly spellcheck="false"></textarea><button type="button" class="tool-copy" data-copy-target="base64-output"><i class="far fa-copy"></i> <cfif local.isEs>Copiar<cfelse>Copy</cfif></button><button type="button" id="base64-clear" class="tool-copy"><i class="far fa-trash-alt"></i> <cfif local.isEs>Limpiar<cfelse>Clear</cfif></button>
  <img id="base64-image-preview" alt="" style="display:none;max-width:50%;margin-top:.75rem;border:1px solid var(--tool-border,#ddd);border-radius:4px;cursor:zoom-in;">
  <hr><label for="base64-file"><cfif local.isEs>Codificar archivo<cfelse>Encode a file</cfif></label><input type="file" id="base64-file"><p class="tool-message" id="base64-message" aria-live="polite"></p>
</div>
<div id="base64-image-modal" style="display:none;position:fixed;inset:0;z-index:9999;background:rgba(0,0,0,.85);align-items:center;justify-content:center;cursor:zoom-out;">
  <img id="base64-image-modal-img" alt="" style="max-width:90%;max-height:90%;border-radius:4px;">
</div>
<script>
(function(){var i=document.getElementById('base64-input'),o=document.getElementById('base64-output'),m=document.getElementById('base64-message'),img=document.getElementById('base64-image-preview'),modal=document.getElementById('base64-image-modal'),modalImg=document.getElementById('base64-image-modal-img');
img.addEventListener('click',function(){modalImg.src=img.src;modal.style.display='flex';});
modal.addEventListener('click',function(){modal.style.display='none';modalImg.removeAttribute('src');});
function utf8e(s){return btoa(unescape(encodeURIComponent(s)));}
function utf8d(s){return decodeURIComponent(escape(atob(s.replace(/^data:.*;base64,/,''))));}
function imageMimeFromBytes(bin){
  if(bin.charCodeAt(0)===0x89&&bin.slice(1,4)==='PNG')return 'image/png';
  if(bin.charCodeAt(0)===0xFF&&bin.charCodeAt(1)===0xD8&&bin.charCodeAt(2)===0xFF)return 'image/jpeg';
  if(bin.slice(0,4)==='GIF8')return 'image/gif';
  if(bin.slice(0,4)==='RIFF'&&bin.slice(8,12)==='WEBP')return 'image/webp';
  if(bin.slice(0,2)==='BM')return 'image/bmp';
  return null;
}
function showImage(dataUrl){img.src=dataUrl;img.style.display='';}
function hideImage(){img.style.display='none';img.removeAttribute('src');}
document.querySelectorAll('[data-base64-action]').forEach(function(b){b.addEventListener('click',function(){
  hideImage();
  try{
    if(b.dataset.base64Action==='encode'){
      o.value=utf8e(i.value);
      m.textContent='';
    }else{
      var raw=i.value.trim();
      var dataUrlMatch=raw.match(/^data:(image\/[a-zA-Z0-9.+-]+);base64,/);
      var mime=null,b64=raw;
      if(dataUrlMatch){mime=dataUrlMatch[1];b64=raw.slice(dataUrlMatch[0].length);}
      var bin=atob(b64.replace(/\s+/g,''));
      if(!mime)mime=imageMimeFromBytes(bin);
      if(mime){
        var dataUrl='data:'+mime+';base64,'+b64.replace(/\s+/g,'');
        o.value=dataUrl;
        showImage(dataUrl);
        m.textContent='';
      }else{
        o.value=utf8d(raw);
        m.textContent='';
      }
    }
  }catch(e){m.textContent='<cfif local.isEs>El valor no es Base64 válido.<cfelse>The value is not valid Base64.</cfif>';m.className='tool-message is-error';}
});});
document.getElementById('base64-file').addEventListener('change',function(){var f=this.files[0];if(!f)return;var r=new FileReader();r.onload=function(){o.value=r.result;hideImage();m.textContent='<cfif local.isEs>Archivo codificado: <cfelse>File encoded: </cfif>'+f.name; m.className='tool-message';};r.readAsDataURL(f);});
document.getElementById('base64-clear').addEventListener('click',function(){o.value='';hideImage();m.textContent='';});
}());
</script>
