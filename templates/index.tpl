<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>

<HEAD>
	<TITLE>{WEBNAME}</TITLE>
	<META HTTP-EQUIV="content-type" CONTENT="text/html; charset=UTF-8">
	<meta name="author" content="Alexandre González">
	<META NAME="keywords" CONTENT="wifi, rsc, asociación, inalámbrica, rianxo, galicia, cobertura">
	<META NAME="robots" CONTENT="all">
	<LINK HREF="css/estilo.css" TYPE="text/css" REL="stylesheet">
	<!--[if IE 6]>
		<link href="css/ie6fixes.css" rel="stylesheet" type="text/css">
        <link href="js/tinymce/jscripts/tiny_mce/themes/advanced/css/iefixes.css" type="text/css">
	<![endif]-->
	<!--[if IE 7]>
		<link href="css/ie7fixes.css" rel="stylesheet" type="text/css">
        <link href="js/tinymce/jscripts/tiny_mce/themes/advanced/css/iefixes.css" type="text/css">
	<![endif]-->
    <STYLE TYPE="text/css"> p.enviarFix { padding-bottom: 15px; } </STYLE>
    <SCRIPT TYPE="text/javascript" src="js/xota.js"></SCRIPT>
    <script type="text/javascript" src="js/mootools.js"></script>
    <script type="text/javascript" src="js/slimbox/js/slimbox.js"></script>
    <link rel="stylesheet" href="js/slimbox/css/slimbox.css" type="text/css" media="screen">
    
    <link href="scripts/rss.php?u={usuarioAccedido}" rel="alternate" type="application/rss+xml" title="{WEBNAME}" />
    
    <script type="text/javascript" src="js/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
    <script type="text/javascript">
    tinyMCE.init({
        language : "es",
        mode : "textareas",
        theme : "advanced",
        plugins : "xhtmlxtras",
        theme_advanced_buttons1 : "bold,italic,underline,separator,strikethrough,justifyleft,justifycenter,justifyright, justifyfull,bullist,numlist,undo,redo,link,unlink,|,image",
        theme_advanced_buttons2 : "",
        theme_advanced_buttons3 : "",
        theme_advanced_toolbar_location : "top",
        theme_advanced_toolbar_align : "left",
        theme_advanced_path_location : "bottom",
        extended_valid_elements : "a[name|href|target|title|onclick],img[class|src|border=0|alt|title|hspace|vspace|width|height|align|onmouseover|onmouseout|name],hr[class|width|size|noshade],font[face|size|color|style],span[class|align|style]"
    });

    window.addEvent('domready', function() {
        var mySlide = new Fx.Slide('comentar');
        mySlide.hide();
        document.getElementById('ocultarEditor').style.display='none';
        $('mostrarEditor').addEvent('click', function(e){
            e = new Event(e);
            document.getElementById('mostrarEditor').style.display='none';
            mySlide.slideIn();
            document.getElementById('ocultarEditor').style.display='inline';
            e.stop();
        });
         
        $('ocultarEditor').addEvent('click', function(e){
            e = new Event(e);
            document.getElementById('ocultarEditor').style.display='none';
            mySlide.slideOut();
            document.getElementById('mostrarEditor').style.display='inline';
            e.stop();
         });
    });
    window.addEvent('domready', function() {
        var mySlide = new Fx.Slide('respuestas');
        document.getElementById('mostrarRespuestas').style.display='none';
        $('mostrarRespuestas').addEvent('click',function(e){
            e = new Event(e);
            document.getElementById('mostrarRespuestas').style.display='none';
            mySlide.slideIn();
            document.getElementById('ocultarRespuestas').style.display='inline';
            e.stop();
        });
        $('ocultarRespuestas').addEvent('click',function(e){
            e = new Events(e);
            document.getElementById('ocultarRespuestas').style.display='none';
            mySlide.slideOut();
            document.getElementById('mostrarRespuestas').style.display='inline';
            e.stop();
        });
    });
    </script>
</HEAD>

<BODY>
<DIV ID=cuerpo>
<H1><A TITLE="Volver ó inicio" HREF="?"><SPAN>{WEBNAME}</SPAN></A></H1>

<DIV ID=secciones>
	<H2><SPAN>{_titleSections}</SPAN></H2>
	<UL>
        <!-- Aquí comento todas estas opcións que non teñen nada de momento (versión beta ;) -->
        <LI><A CLASS=noticias TITLE="As novas destacadas" HREF="{BASE}index.php?s=noticias"><SPAN>{_news}</SPAN></A></LI>
        <!-- <LI><A TITLE="¿Quen somos?, Socios..." HREF="?s=proxecto">Proxecto RSC</A></LI> -->
        <LI><A CLASS=cobertura TITLE="Cobertura dos AP" HREF="{BASE}index.php?s=cobertura"><SPAN>{_ratio}</SPAN></A></LI>
        <!-- <LI><A TITLE="Date de alta, cobertura, preguntas..." HREF="?s=sociedade">Sociedade</A></LI>
        <LI><A TITLE="Manuais, documentos..." HREF="?s=taller">Taller</A></LI> -->
        <LI><A CLASS=blogs TITLE="Os blogs dos nosos socios" HREF="{BASE}index.php?s=blogs"><SPAN>{_blogs}</SPAN></A></LI>
        <LI><A CLASS=galeria TITLE="Galería de imágenes" HREF="{BASE}index.php?s=galeria"><SPAN>{_gallery}</SPAN></A></LI>
        <LI><A CLASS=foro TITLE="Foro" HREF="{BASE}index.php?s=foro"><SPAN>{_forum}</SPAN></A></LI>
        <LI><A CLASS=links TITLE="Páxinas de interese" HREF="{BASE}index.php?s=links"><SPAN>{_links}</SPAN></A></LI>
	</UL>
</DIV>


<!-- START BLOCK : mensaje_atencion -->
<DIV ID=mensaje>
    {mensaje_atencion}
</DIV>
<!-- END BLOCK : mensaje_atencion -->

<DIV ID=medio>
	<!-- INCLUDE BLOCK : documento -->
</DIV>

<!-- INCLUDE BLOCK : usuarios -->

<DIV ID=colaboran>
	<H2><SPAN>{_titlePartners}</SPAN></H2>
	<UL>
		<LI><A TITLE="Electrodomésticos Conde" HREF="http://www.condeweb.es">Electrodomésticos Conde</A></LI>
		<LI><A TITLE="CompraWiFi" HREF="http://www.comprawifi.com">CompraWiFi</A></LI>
	</UL>
</DIV>

<DIV ID=creditos>
	<H2><SPAN>{_titleCredits}</SPAN></H2>
	<P><SPAN>{_footnote}</SPAN></P>
</DIV>

<!-- Divs extras para cargar imágenes -->
<DIV ID=extraDiv1><SPAN></SPAN></DIV><DIV ID=extraDiv2><SPAN></SPAN></DIV><DIV ID=extraDiv3><SPAN></SPAN></DIV>
<DIV ID=extraDiv4><SPAN></SPAN></DIV><DIV ID=extraDiv5><SPAN></SPAN></DIV><DIV ID=extraDiv6><SPAN></SPAN></DIV>

</DIV>
</BODY>
</HTML>
