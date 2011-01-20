<DIV ID=foro>
	<H2><SPAN>{_header}</SPAN></H2>

	<!--********************************************
		Muestra esto si estás viendo todos los hilos
		********************************************-->
	<!-- START BLOCK : todos_hilos -->
		<TABLE>
            <THEAD>
                <TR>
                <TH>{_topic}</TH><TH>{_author}</TH><TH>{_responses}</TH><TH>{_writed}</TH>
                </TR>
            </THEAD>
            <!-- START BLOCK : hilo -->
                <TR>
                <TD CLASS=titulo><A HREF="?s=foro&amp;id={id}" TITLE="Ver mensaxe">{titulo}</A></TD>
                <TD CLASS=autor>{autor}</TD>
                <TD CLASS=comentarios><A HREF="?s=foro&amp;id={id}" TITLE="Comentar">{comentarios}</A></TD>
                <TD CLASS=fecha>{fecha} - {hora}</TD>
                <!-- <SPAN CLASS=datos>(escrito por {autor} o {fecha} &aacute;s {hora})</SPAN>&nbsp;<SPAN CLASS=comentarios><A HREF="?s=foro&id={id}" TITLE="Comentar">{comentarios}</A></SPAN></LI> -->
                </TR>
            <!-- END BLOCK : hilo -->
		</TABLE>
        <!-- START BLOCK : escribir_hilo -->
        <A ID=mostrarEditor HREF=#>{_showEditor}</A>
        <A ID=ocultarEditor HREF=#>{_hideEditor}</A>
            <DIV ID=comentar>
                <FORM NAME=formulario ONSUBMIT="return strip_tags('formulario','texto')" METHOD=post ACTION="{action_hilo}">
<!--                   <LABEL FOR=usuario>Usuario:</LABEL>-->
                    <P><SPAN>{_user}</SPAN><INPUT ONFOCUS="select();" ID=usuario TYPE=text MAXLENGTH=16 SIZE=16 NAME=usuario VALUE="{nombre_usuario}" DISABLED=true></P>
<!--                    <LABEL FOR=titulo>Título:</LABEL>-->
                    <P><SPAN>{_title}</SPAN><INPUT ONFOCUS="select();" ID=titulo TYPE=text MAXLENGTH=255 SIZE=64 NAME=titulo VALUE="{_titleValue}"></P>
<!--                    <LABEL FOR=texto>Texto:</LABEL>-->
                    <P><SPAN>{_text}</SPAN><TEXTAREA ONFOCUS="select();" STYLE="width: 600px"ID=texto COLS=70 ROWS=10 NAME=texto>{_textValue}</TEXTAREA></P>
                    <P CLASS=enviarFix><INPUT TYPE=submit NAME=submit_hilo VALUE={_send}></P>
                </FORM>
            </DIV>
        <!-- END BLOCK : escribir_hilo -->
	<!-- END BLOCK : todos_hilos -->

    <!--*****************************************
        Muestra esto si estás viendo un solo hilo
        *****************************************-->
    <!-- START BLOCK : un_hilo -->
        <H3 CLASS=primera><SPAN>{titulo}</SPAN></H3>
        <H3 CLASS=segunda>{_writedBy}<SPAN>{autor}</SPAN></H3>
        <H3 CLASS=tercera>{_writedDate}{fecha}{_writedHour}{hora}</H3>
        <P><SPAN>{texto}</SPAN></P>
        <!-- START BLOCK : respuestas -->
            <DIV ID=respuestas>
<!--        <A ID=mostrarRespuestas HREF=# ONCLICK="return false">{_showResponses}</A>
        <A ID=ocultarRespuestas HREF=# ONCLICK="return false">{_hideResponses}</A>-->

                <!-- START BLOCK : respuesta -->
                    <DIV CLASS=respuesta><SPAN ID=respuesta-{id_respuesta}>
                        <H4 CLASS=primera><A HREF="{marcador}">{titulo}</A></H4>
                        <H4 CLASS=segunda>{_writedBy}{login}{ip}</H4>
                        <H4 CLASS=tercera>{_writedDate}{fecha}{_writedHour}{hora}</H4>
                        <P CLASS=origen><SPAN>{texto}</SPAN></P>
                    </SPAN></DIV>
                <!-- END BLOCK : respuesta -->
            </DIV>
        <!-- END BLOCK : respuestas -->
        <A ID=mostrarEditor HREF=#>{_showEditor}</A>
        <A ID=ocultarEditor HREF=#>{_hideEditor}</A>
        <DIV ID=comentar>
            <FORM NAME=formulario2 ONSUBMIT="return strip_tags_captcha('formulario','texto',captcha.value)" METHOD=post ACTION="{action_respuesta}">
                <P><SPAN>2 + 2 =</SPAN><INPUT ONFOCUS="select();" ID=captcha TYPE=text MAXLENGTH=16 SIZE=16 NAME=captcha VALUE="5"></P>    
<!--                <LABEL FOR=usuario>Usuario:</LABEL>-->
                <P><SPAN>{_user}</SPAN><INPUT ONFOCUS="select();" ID=usuario TYPE=text MAXLENGTH=16 SIZE=16 NAME=usuario VALUE="{nombre_usuario}" DISABLED=true></P>
<!--                <LABEL FOR=titulo>Título:</LABEL>-->
                <P><SPAN>{_title}</SPAN><INPUT ONFOCUS="select();" ID=titulo TYPE=text MAXLENGTH=255 SIZE=64 NAME=titulo VALUE="{_titleRe}{titulo}"></P>
<!--                <LABEL FOR=texto>Texto:</LABEL>-->
                <P><SPAN>{_text}</SPAN><TEXTAREA ONFOCUS="select();" STYLE="width: 600px" ID=texto COLS=70 ROWS=10 NAME=texto2>{_textValue}</TEXTAREA></P>
                <P CLASS=enviarFix><INPUT TYPE=submit NAME=submit_respuesta VALUE={_send}></P>
            </FORM>
        </DIV>
    <!-- END BLOCK : un_hilo -->
</DIV>
