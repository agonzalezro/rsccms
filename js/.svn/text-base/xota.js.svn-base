function strip_tags(formulario,campo){
    var text=document[formulario][campo].value;
    text=text.toLowerCase();
    //Tags permitidos: <code><span><strike><u><em><strong><ol><li><ul><img><a><br><p><div>
    text=text.replace(/<a+[^>]+>/g,'');
    text=text.replace(/<br \/>/g,'<br>');
    text=text.replace(/<br>/g,'');
    text=text.replace(/<code>/g,'');
    text=text.replace(/<div[^>]+style[^>]+>/g,'ERROR');
    text=text.replace(/(<div+[^>]+>|<div>)/g,'');
    text=text.replace(/<em>/g,'');
    text=text.replace(/<img+[^>]+>/g,'');
    text=text.replace(/<li>/g,'');
    text=text.replace(/<ol>/g,'');
    text=text.replace(/<p>/g,'');
    text=text.replace(/(<strike+[^>]+>|<strike>)/g,'');
    text=text.replace(/(<strong+[^>]+>|<strong>)/g,'');
    text=text.replace(/(<span+[^>]+>|<span>)/g,'');
    text=text.replace(/<ul>/g,'');
    text=text.replace(/(<u+[^>]+>|<u>)/g,'');
    text=text.replace(/<\//g,'');
    text=text.replace(/</g,'ERROR');
    if(text.indexOf('ERROR') > -1) {
        alert("ERROR 101");
        return false;
    } else {
        return true;
    }
}

function strip_tags_captcha(formulario,campo,captcha){
if ( captcha == 4 ) {
    strip_tags(formulario,campo);
} else {
    document.getElementById("captcha").focus();
    document.getElementById("captcha").select();
    return false;
}
}
