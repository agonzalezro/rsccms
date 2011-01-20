<DIV ID=noticias>
	<H2><SPAN>{_header}</SPAN></H2>

	<!--***********************************************
		Muestra esto si estás viendo todas las noticias
		***********************************************-->
	<!-- START BLOCK : noticia -->
        <DIV CLASS=noticia>
            <H3 CLASS=primera><SPAN><A HREF="{id}">{titulo}</A></SPAN></H3>
            <!-- START BLOCK : subir1 -->
                <H3 CLASS="admin subir"><A ONCLICK="return confirm('{_confirmMain}')" TITLE="Subir a portada" HREF="{BASE}?s=admin&accion=subir&id={id}"><SPAN>{_main}</SPAN></A></H3>
            <!-- END BLOCK : subir1 -->
            <!-- START BLOCK : bajar1 -->
                <H3 CLASS="admin bajar"><A ONCLICK="return confirm('{_confirmUnMain}')" TITLE="Bajar de portada" HREF="{BASE}?s=admin&accion=bajar&id={id}"><SPAN>{_unMain}</SPAN></A></H3>
            <!-- END BLOCK : bajar1 -->
            <!-- START BLOCK : editar1 -->
                <H3 class="admin editar"><A TITLE="Editar" HREF="{BASE}?s=admin&accion=editar&id={id}"><SPAN>{_edit}</SPAN></A></H3>
            <!-- END BLOCK : editar1 -->
            <!-- START BLOCK : borrar1 -->
                <H3 class="admin borrar"><A ONCLICK="return confirm('{_confirmDelete}')" TITLE="Borrar" HREF="{BASE}?s=admin&accion=borrar&id={id}"><SPAN>{_delete}</SPAN></A></H3>
            <!-- END BLOCK : borrar1 -->
			<H3 CLASS=segunda>{_writedBy}<SPAN>{autor}</SPAN></H3>
			<H3 CLASS=tercera>{_writedDate}<SPAN>{fecha}</SPAN></H3>
			<P CLASS=total><SPAN>{texto}</SPAN></P><P CLASS=fix>&nbsp;</p>
			<!-- START BLOCK : leermas -->
				<A TITLE="Leer más" CLASS=leermas HREF="{id}">{_readMore}</A>
			<!-- END BLOCK : leermas -->
			<A CLASS=comentarios HREF="{id}">{comentarios}</A>
		</DIV>
	<!-- END BLOCK : noticia -->


	<!--*************************************
		Muesta esto para ver una sola noticia
		*************************************-->
	<!-- START BLOCK : noticia_comentando -->
		<DIV ID=noticia_comentando>
            <H3 CLASS=primera><SPAN><A HREF="{id}">{titulo}</A></SPAN></H3>
            <!-- START BLOCK : subir2 -->
                <H3 CLASS="admin subir"><A ONCLICK="return confirm('{_confirmMain}')" TITLE="Subir a portada" HREF="{BASE}?s=admin&accion=subir&id={id}"><SPAN>{_main}</SPAN></A></H3>
            <!-- END BLOCK : subir2 -->
            <!-- START BLOCK : bajar2 -->
                <H3 CLASS="admin bajar"><A ONCLICK="return confirm('{_confirmUnMain}')" TITLE="Bajar de portada" HREF="{BASE}?s=admin&accion=bajar&id={id}"><SPAN>{_unMain}</SPAN></A></H3>
            <!-- END BLOCK : bajar2 -->
            <!-- START BLOCK : editar2 -->
                <H3 CLASS="admin editar"><A TITLE="Editar" HREF="{BASE}?s=admin&accion=editar&id={id}"><SPAN>{_edit}</SPAN></A></H3>
            <!-- END BLOCK : editar2 -->
            <!-- START BLOCK : borrar2 -->
                <H3 class="admin borrar"><A ONCLICK="return confirm('{_confirmDelete}')" TITLE="Borrar" HREF="{BASE}?s=admin&accion=borrar&id={id}"><SPAN>{_delete}</SPAN></A></H3>
            <!-- END BLOCK : borrar2 -->
			<H3 CLASS=segunda>{_writedBy}<SPAN>{autor}</SPAN></H3>
			<H3 CLASS=tercera>{_writedDate}<SPAN>{fecha}</SPAN></H3>
			<P CLASS=total><SPAN>{texto}</SPAN></P><P CLASS=fix>&nbsp;</p>
			<!-- START BLOCK : ampliado -->
				<P ID=pedo CLASS=ampliado><SPAN>{texto_ampliado}</SPAN></P><P CLASS=fix>&nbsp;</p>
			<!-- END BLOCK : ampliado -->
		</DIV>

		<!-- START BLOCK : respuestas -->
        <A ID=mostrarRespuestas HREF=# ONCLICK="return false">{_showResponses}</A>
        <A ID=ocultarRespuestas HREF=# ONCLICK="return false">{_hideResponses}</A>
			<DIV ID=respuestas>
			    <!-- START BLOCK : respuesta -->
				    <DIV CLASS=respuesta><SPAN ID=comentario-{id_comentario}>
						<H4 CLASS=primera><A HREF="{marcador}">{titulo}</A></H4>
						<H4 CLASS=segunda>{_writedBy}{login}{ip}</H4>
						<H4 CLASS=tercera>{_writedDate}{fecha}{_writedHour}{hora}</H4>
						<P><SPAN>{texto}</SPAN></P>
					</SPAN></DIV>
				<!-- END BLOCK : respuesta -->
			</DIV>
		<!-- END BLOCK : respuestas -->

        <!-- START BLOCK : editorRespuesta -->
        <A ID=mostrarEditor HREF=#>{_showEditor}</A>
        <A ID=ocultarEditor HREF=#>{_hideEditor}</A>
		<DIV ID=comentar>
			<FORM NAME=formulario METHOD=post ONSUBMIT="return strip_tags('formulario','texto')" ACTION="{action_respuesta}">
<!--				<LABEL FOR=usuario>Usuario:</LABEL>-->
				<P><SPAN>{_user}</SPAN><INPUT ONFOCUS="select();" ID=usuario TYPE=text MAXLENGTH=16 SIZE=16 NAME=usuario VALUE="{nombre_usuario}" DISABLED=true></P>
<!--				<LABEL FOR=titulo>Título:</LABEL>-->
				<P><SPAN>{_title}</SPAN><INPUT ONFOCUS="select();" ID=titulo TYPE=text MAXLENGTH=255 SIZE=64 NAME=titulo VALUE="{_titleRe}{titulo}"></P>
<!--				<LABEL FOR=texto>Texto:</LABEL>-->
				<P><SPAN>{_text}</SPAN><TEXTAREA ONFOCUS="select();" STYLE="width: 600px;" ID=texto COLS=70 ROWS=10 NAME=texto>{_textValue}</TEXTAREA></P>
				<P CLASS=enviarFix><INPUT TYPE=submit NAME=submit_respuesta VALUE={_send}></P>
			</FORM>
		</DIV>
		<!-- END BLOCK : editorRespuesta -->
	<!-- END BLOCK : noticia_comentando -->
</DIV>
