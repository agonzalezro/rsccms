<!-- START BLOCK : no_registrado -->
<DIV ID=loginInfo>
    <H2><SPAN>{_menuLogin}</SPAN></H2>
    <!-- START BLOCK : error_login -->
    <P>{error_message}</P>
    <!-- END BLOCK : error_login -->
    <FORM NAME=form_login METHOD=post ACTION="{action_login}">
<!--        <LABEL CLASS=loginlabel FOR=logininput><SPAN>Login:</SPAN><INPUT ID=logininput CLASS=logininput TYPE=text NAME=login VALUE="Nome do usuario" MAXLENGTH=16 SIZE=16></LABEL><BR> -->
           <P><SPAN CLASS=login>{_loginForm}</SPAN><INPUT ONFOCUS="select();" TYPE=text NAME=login VALUE="{_loginName}" MAXLENGTH=16 SIZE=16></P>
<!--        <LABEL CLASS=pass FOR=pass><SPAN>Contraseña:</SPAN><INPUT ID=pass CLASS=pass TYPE=password NAME=pass VALUE="Contraseña" MAXLENGTH=128 SIZE=16></LABEL><BR>-->
            <P><SPAN CLASS=pass>{_password}</SPAN><INPUT ONFOCUS="select();" TYPE=password NAME=pass VALUE="{_loginPass}" MAXLENGTH=128 SIZE=16></P>
<!--        <LABEL CLASS=recordar FOR=recordar><SPAN>Recordar</SPAN><INPUT ID=recordar CLASS=recordar TYPE=checkbox NAME=recordar></LABEL><BR> -->
            <P><SPAN CLASS=recordar>{_remember}</SPAN><INPUT TYPE=checkbox NAME=recordar></P>
        <P><INPUT CLASS=submit_login TYPE=submit NAME=submit_login VALUE="{_loginButton}"></P>
        <P><A CLASS=rexistrarme HREF="?s=usuarios&amp;accion=registrar">{_register}</A></P>
    </FORM>
</DIV>
<!-- END BLOCK : no_registrado -->

<!-- START BLOCK : nivel_0 -->
<DIV ID=loginInfo>
	<H2><SPAN>{_menuAdministrator}</SPAN></H2>
	<UL>
        <LI ID=loginName><STRONG>{usuario}</STRONG></LI>
		<LI><A HREF="{BASE}?s=admin&accion=enviar">{_sendNew}</A></LI>
        <LI><A HREF="{BASE}?s=admin&accion=lista">{_usersList}</A></LI>
        <LI><A HREF="{BASE}?s=admin&accion=editarLinks">{_editLinks}</A></LI>
		<LI><A HREF="{BASE}?s=admin&accion=preferencias">{_preferences}</A></LI>
		<LI><A HREF="{BASE}?s=usuarios&accion=salir">{_logout}</A></LI>
	</UL>
</DIV>
<!-- END BLOCK : nivel_0 -->

<!-- START BLOCK : nivel_1 -->
<DIV ID=loginInfo>
	<H2><SPAN>{_menuNetUser}</SPAN></H2>
	<UL>
        <LI ID=loginName><STRONG>{usuario}</STRONG></LI>
        <LI><A HREF="{BASE}?s=admin&accion=enviar">{_sendNew}</A></LI>
        <LI><A HREF="{BASE}?s=admin&accion=preferencias">{_preferences}</A></LI>
		<LI><A HREF="{BASE}?s=usuarios&accion=salir">{_logout}</A></LI>
	</UL>
</DIV>
<!-- END BLOCK : nivel_1 -->

<!-- START BLOCK : nivel_2 -->
<DIV ID=loginInfo>
	<H2><SPAN>{_menuWebUser}</SPAN></H2>
	<UL>
        <LI ID=loginName><STRONG>{usuario}</STRONG></LI>
        <LI><A HREF="{BASE}?s=admin&accion=preferencias">{_preferences}</A></LI>
		<LI><A HREF="{BASE}?s=usuarios&accion=salir">{_logout}</A></LI>
	</UL>
<DIV>
<!-- END BLOCK: nivel_2 -->
