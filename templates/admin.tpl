<SCRIPT TYPE="text/javascript">
    function cambiaLevel(selected) {
        var aux=confirm('¿Estás seguro de querer cambiar el nivel de este usuario?');
        document.getElementById('inputOculto').value=selected.name;
        if (aux == true) {
            document.getElementById('selectFormulario').submit();
        }
    }
    function testSendNew() {
        //Cubrir todos los campos
        if (document.form_env_adm.titulo.value == "") {
            alert("Introduce un título para a noticia.");
            document.form_env_adm.titulo.focus();
            return false;
        } else if (document.form_env_adm.categoria.value == "") {
			alert("Selecciona unha categoría.");
			document.form_env_adm.categoria.focus();
			return false;
		} else if (document.form_env_adm.texto.value == "") {
			alert("Introduce un texto para a nova.");
			document.form_env_adm.texto.focus();
			return false;
		}
        return true;
    }

    function testPref() {
        if(document.form_env_pre.passActual.value == "" || document.form_env_pre.passNew.value == "") {
            alert("Debes cubrir todos os campos.");
            document.form_env_pre.passActual.focus();
            return false;
        } else if (document.form_env_pre.passNew.value != document.form_env_pre.passReNew.value) {
            alert("A nova contrasinal non coincide.");
            document.form_env_pre.passNew.focus();
            return false;
        }
        return true;
    }

    function compruebaSend() {
        var aux=strip_tags('form_env_adm','texto');
        if (!aux) { return false; }
        else {
            //var aux=strip_tags('form_env_adm','texto_ampliado');
            if (!aux) { return false; }
            //Solo si llega hasta aquí no hay código malicioso ;)
            else { return true; }
        }
    }

    function compruebaEdit() {
        var aux=strip_tags('form_edi_adm','texto');
        if (!aux) { return false; }
        else {
            //var aux=strip_tags('form_edi_adm','texto_ampliado');
            if (!aux) { return false; }
            //Solo si llega hasta aquí no hay código malicioso ;)
            else { return true; }
        }
    }

</SCRIPT>

<!-- START BLOCK : enviar_noticia -->
<DIV ID=enviar_noticia>
	<H2><SPAN>{_sendNewHeader}</SPAN></H2>
	<FORM ONSUBMIT="return compruebaSend()" NAME=form_env_adm  ACTION="{action_enviar_noticia}" ONSUBMIT="return testSendNew();" METHOD=post>
<!--		<LABEL FOR=titulo>Título:</LABEL>-->
		<P><SPAN>{_title}</SPAN><INPUT ONCLICK="select();" ID=titulo TYPE=text MAXLENGTH=255 SIZE=100 NAME=titulo VALUE="Título da nova"></P>
<!--		<LABEL FOR=categorias>Categoría:</LABEL>-->
		<P><SPAN>{_category}</SPAN><SELECT ID=categorias  NAME=categorias>
		<!-- START BLOCK : categorias -->
			<OPTION VALUE={option_id}>{option_value}</OPTION>
		<!-- END BLOCK : categorias -->
		</SELECT></P>
<!--		<LABEL FOR=texto>Texto:</LABEL>-->
		<P><SPAN>{_text}</SPAN><TEXTAREA ONFOCUS="select();" STYLE="width: 600px" ID=texto NAME=texto MAXLENGTH=2048 COLS=100 ROWS=15>{_textValue}</TEXTAREA></P>
<!--		<LABEL FOR=texto_ampliado>Texto ampliado:</LABEL>-->
		<P><SPAN>{_moreText}</SPAN><TEXTAREA ONFOCUS="select();" STYLE="width: 600px" ID=texto_ampliado NAME=texto_ampliado MAXLENGTH=2048 COLS=100 ROWS=15>{_moreTextValue}</TEXTAREA></P>
		<P><INPUT TYPE=submit NAME=submit_noticia VALUE={_send}></P>
	</FORM>
</DIV>
<!-- END BLOCK : enviar_noticia -->

<!-- START BLOCK : editar_noticia -->
<DIV ID=editar_noticia>
    <H2><SPAN>{_editNewHeader}</SPAN></H2>
    <FORM ONSUBMIT="return compruebaEdit()" NAME=form_edi_adm  ACTION="{action_enviar_noticia}" ONSUBMIT="return testSendNew();" METHOD=post>
<!--        <LABEL FOR=titulo>Título:</LABEL>-->
        <P><SPAN>{_title}</SPAN><INPUT ONFOCUS="select();" ID=titulo TYPE=text MAXLENGTH=255 SIZE=100 NAME=titulo VALUE="{titulo}"></P>
<!--        <LABEL FOR=categorias>Categoría:</LABEL>-->
        <P><SPAN>{_category}</SPAN><SELECT ID=categorias NAME=categorias>
        <!-- START BLOCK : categorias1_selected -->
            <OPTION SELECTED VALUE={option_id}>{option_value}</OPTION>
        <!-- END BLOCK : categorias1_selected -->
        <!-- START BLOCK : categorias1 -->
            <OPTION VALUE={option_id}>{option_value}</OPTION>
        <!-- END BLOCK : categorias1 -->
        </SELECT></P>
<!--        <LABEL FOR=texto>Texto:</LABEL>-->
        <P><SPAN>{_text}</SPAN><TEXTAREA ONFOCUS="select();" STYLE="width: 600px" ID=texto NAME=texto MAXLENGTH=2048 COLS=100 ROWS=15>{texto}</TEXTAREA></P>
<!--        <LABEL FOR=texto_ampliado>Texto ampliado:</LABEL>-->
        <P><SPAN>{_moreText}</SPAN><TEXTAREA ONFOCUS="select();" STYLE="width: 600px" ID=texto_ampliado NAME=texto_ampliado MAXLENGTH=2048 COLS=100 ROWS=15>{ampliado}</TEXTAREA></P>
        <P><INPUT TYPE=submit NAME=submit_editar_noticia VALUE={_send}></P>
    </FORM>
</DIV>
<!-- END BLOCK : editar_noticia -->

<!-- START BLOCK : preferencias_usuario -->
<DIV ID=preferencias_usuario>
    <H2><SPAN>{_editPreferencesHeader}</SPAN></H2>
    <FORM NAME=form_env_pre ACTION="{action_enviar_preferencias}" ONSUBMIT="return testPref();" METHOD=post>
<!--        <LABEL FOR=passActual>Contrasinal actual:</LABEL>-->
        <P><SPAN>{_passwordActual}</SPAN><INPUT ONFOCUS="select();" ID=passActual TYPE=password MAXLENGTH=16 SIZE=16 NAME=passActual></P>
<!--        <LABEL FOR=passNew>Nova contrasinal:</LABEL>-->
        <P><SPAN>{_passwordNew}</SPAN><INPUT ONFOCUS="select();" ID=passNew TYPE=password MAXLENGTH=16 SIZE=16 NAME=passNew></P>
<!--        <LABEL FOR=passReNew>Repetir nova:</LABEL>-->
        <P><SPAN>{_passwordRepeat}</SPAN><INPUT ONFOCUS="select();" ID=passReNew TYPE=password MAXLENGTH=16 SIZE=16 NAME=passReNew></P>
        <P><INPUT TYPE=submit NAME=submit_preferencias VALUE={_send}></P>
    </FORM>
</DIV>
<!-- END BLOCK : preferencias_usuario -->

<!-- START BLOCK : lista_usuarios -->
<DIV ID=lista_usuarios>
    <H2><SPAN>{_editListHeader}</SPAN></H2>
    <TABLE ID=listaUsers>
    <THEAD>
        <TR>
        <TH>{_id}</TH><TH>{_access}</TH><TH>{_loginValue}</TH><TH>{_fullName}</TH>
        </TR>
    </THEAD>
    <TBODY>
    <FORM ID=selectFormulario METHOD=post>
    <!-- START BLOCK : unUsuario -->
        <TR CLASS=unUsuario>
        <TD>{id}</TD>
        <TD>
<!--        <SELECT ONCHANGE="return confirm('¿Estás seguro de querer cambiar el nivel de este usuario?'); document.getElementById('selectFormulario').submit();" ID=nivel NAME=pepe>-->
<SELECT ONCHANGE="cambiaLevel(this);" ID=nivel NAME={id}>
            <!-- START BLOCK : nivelAdministrador -->
                <OPTION SELECTED VALUE=0>{_administratorUser}</OPTION>
                <OPTION VALUE=1>{_netUser}</OPTION>
                <OPTION VALUE=2>{_webUser}</OPTION>
            <!-- END BLOCK : nivelAdministrador -->
            <!-- START BLOCK : nivelUsuarioRed -->
                <OPTION VALUE=0>{_administratorUser}</OPTION>
                <OPTION SELECTED VALUE=1>{_netUser}</OPTION>
                <OPTION VALUE=2>{_webUser}</OPTION>
            <!-- END BLOCK : nivelUsuarioRed -->
            <!-- START BLOCK : nivelUsuarioWeb -->
                <OPTION VALUE=0>{_administratorUser}</OPTION>
                <OPTION VALUE=1>{_netUser}</OPTION>
                <OPTION SELECTED VALUE=2>{_webUser}</OPTION>
            <!-- END BLOCK : nivelUsuarioWeb -->
        </SELECT>
        </TD>
        <TD>{login}</TD>
        <TD>{nombre}</TD>
        <TD><A HREF="{BASE}?s=admin&accion=borrarUsuario&id={id}">{_delete}</A></TD>
        </TR>
    <!-- END BLOCK : unUsuario -->
    <INPUT NAME=inputOculto ID=inputOculto TYPE="hidden">
    </FORM>
    </TBODY>
    </TABLE>
</DIV>
<!-- END BLOCK : lista_usuarios -->

<!-- START BLOCK : administrarLinks -->
<H2>{_headerEdit}</H2>
<DIV ID=lista_links>
    <TABLE ID=listaLinks>
    <THEAD>
        <TR>
        <TH>{_id}</TH><TH>{_linkName}</TH><TH>{_linkHref}</TH><TH>{_clicks}</TH>
        </TR>
    </THEAD>
    <TBODY>
        <FORM NAME=formularioLinks METHOD=post>
        <INPUT NAME=inputOculto2 ID=inputOculto2 TYPE="hidden">
        <TR>
            <TD>{_auto}</TD>
            <TD><INPUT ONFOCUS="select();" NAME=nombreNuevoLink></TD>
            <TD><INPUT ONFOCUS="select();" NAME=nuevoLinkHref></TD>
            <TD>1</TD>
            <TD><INPUT TYPE=submit NAME=newLink VALUE={_newLink}></TD>
        </TR>
        <!-- START BLOCK : editarLink-->
        <TR>
            <TD>{id}</TD>
            <TD><INPUT ONFOCUS="select();" ONCLICK="document.getElementById('inputOculto2').value={id}" NAME=nombreLink{id} VALUE="{nombreLink}"></TD>
            <TD><INPUT ONFOCUS="select();" ONCLICK="document.getElementById('inputOculto2').value={id}" NAME=linkHref{id} VALUE="{linkHref}"</TD>
            <TD><INPUT ONFOCUS="select();" ONCLICK="document.getElementById('inputOculto2').value={id}" NAME=clicks{id} VALUE="{clicks}"></TD>
            <TD><INPUT TYPE=submit NAME=apply VALUE={_apply}><A HREF="{BASE}?s=admin&accion=borrarLink&id={id}">{_delete}</A></TD>
        </TR>
        <!-- END BLOCK : editarLink -->
        </FORM>
    </TBODY>
    </TABLE>
</DIV>
<!-- END BLOCK : administrarLinks -->
