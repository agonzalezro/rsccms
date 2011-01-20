<SCRIPT TYPE="text/javascript">
	function test() {
		//La contraseña debe ser mayor que 5
		if (document.form_reg.reg_pass.value.length < 5) {
			alert("Contrasinal demasiado pequena.");
			document.form_reg.reg_pass.focus();
			return false;
		}

		//Las contraseñas deben coincidir
		if (document.form_reg.reg_pass.value != document.form_reg.reg_repass.value) {
			alert("As contrasinais non coinciden.");
			document.form_reg.reg_pass.focus();
			return false;
		}

		//Cubrir todos los campos
		if (document.form_reg.reg_nombre.value == "") {
			alert("Introduce o teu nome real");
			document.form_reg.reg_nombre.focus();
			return false;
		} else if (document.form_reg.reg_mail.value == "") {
			alert("Introduce un correo válido");
			document.form_reg.reg_nombre.focus();
			return false;
		} else if (document.form_reg.reg_login.value == "") {
			alert("Introduce un login válido");
			document.form_reg.reg_nombre.focus();
			return false;
		}

		//Comprobamos el correo electrónico
		var resultado=mail();
		if (resultado == false) {
			return false;
		}
	}

    function mail() {
		if (document.form_reg.reg_mail.value.indexOf('@', 0) == -1 || document.form_reg.reg_mail.value.indexOf('.', 0) == -1){ 
			alert("A dirección "+document.form_reg.reg_mail.value+" non é válida");
			document.form_reg.reg_mail.focus(); 
			return false; 
		}
	}
</SCRIPT>

<DIV ID=Registrar>
	<P ID="warning"></P>
	<FORM NAME=form_reg ACTION="{action_reg}" ONSUBMIT="return test();" METHOD=post>
		<P CLASS=reg_login><SPAN>Login:<SPAN><INPUT TYPE=text MAXLENGTH=16 SIZE=16 NAME=reg_login VALUE="" /></P><BR />
		<P CLASS=reg_pass><SPAN>Contrasinal:</SPAN><INPUT TYPE=password MAXLENGTH=16 SIZE=16 NAME=reg_pass VALUE="" /></P><BR />
		<P CLASS=reg_repass><SPAN>Repetir:</SPAN><INPUT TYPE=password MAXLENGTH=16 SIZE=16 NAME=reg_repass VALUE="" /></P><BR />
		<P CLASS=reg_nombre><SPAN>Nome real:</SPAN><INPUT TYPE=text MAXLENGTH=128 SIZE=128 NAME=reg_nombre VALUE="" /></P><BR />
		<P CLASS=reg_mail><SPAN>Mail:</SPAN><INPUT TYPE=text MAXLENGTH=100 SIZE=100 NAME=reg_mail VALUE="" /></P><BR />
		<P><INPUT TYPE=submit NAME=submit_register VALUE=Rexistrar /></P>
	</FORM>
</DIV>
