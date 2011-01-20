<?php

/**
* @package rianxosencabos
*
* @author Alexandre González <alex@rianxosencabos.com>
* @version 0.1
* @copyright GNU/GPL v2.0 or later
*/

/**
* Incluimos la libreria con la clase basededatos
*/
require_once(dirname(__FILE__)."/libreria.php");


/**
* En esta clase se encuentran todas las funciones para gestión de usuarios
*
* @author Alexandre González <alex@rianxosencabos.com>
* @version 0.1
* @copyright GNU/GPL v2.0 or later
*
* @package rianxosencabos
*/
class usuarios {
	/**
	* Con esta función hacemos que template Power muestre los menús según el nivel de acceso
	*
	* @access public
	* @return NULL
	*/
	function mostrar() {
		global $tpl;
		
		if (!isset($_SESSION['acceso'])) {
			$tpl->newBlock("no_registrado");
		} else {
			switch ($_SESSION['acceso']) {
				case 0:
					#Acciones para menú administrador
					$tpl->newBlock("nivel_0");
				break;
				case 1:
					#Acciones para menú usuario RSC
					$tpl->newBlock("nivel_1");
				break;
				case 2:
					#Acciones para menú usuario web
					$tpl->newBlock("nivel_2");
				break;
				default:
					die("<H2>Error 404?</H2>");
				break;
			}
            $tpl->assign("usuario",$_SESSION['usuario']);
		}
	}


	/**
	* Comprobamos si el usuario existe, la pass es correcta y si quieren guardar una cookie para recordarlo, devuelve:
	* - Nivel de acceso > que 0 si todo va bien
	* - -1 usuario no existe
	* - -2 contraseña incorrecta
	*
	* @param string $login Login del usuario que intenta acceder
	* @param string $pass MD5 de la contraseña
	* @param int $recuerdame Si vale 1 se setea una cookie con el usuario y la contraseña
	*
	* @access public
	* @return int
	*/
	function login($login,$pass,$recuerdame=0) {
		$bd=basededatos::GetInstance();
		$resultado=$bd->consulta("SELECT Id_usuario, Login, Pass, Acceso FROM usuarios WHERE Login LIKE '".$login."' LIMIT 0,1") ;
		$resultado->fetchInto($resultado,DB_FETCHMODE_ASSOC);
		
		#Si resultado es nulo es porque el usuario no existe
		if ($resultado == NULL) { 
			return -1;
		} else {
			#Si las contraseñas coinciden, guardamos el login del usuario y su nivel de acceso
			if ($pass==$resultado['Pass']) {
				$_SESSION['usuario']=$login;
				$_SESSION['id_usuario']=$resultado['Id_usuario'];
				$_SESSION['acceso']=$resultado['Acceso'];
				#Si el usuario quiere ser recordado guardamos en una cookie su usuario y contraseña durante 15 días
				if ($recuerdame==1) {
					setcookie("id_usuario",$resultado['Id_usuario'],time()+(3600*24*15));
					setcookie("usuario",$login,time()+(3600*24*15));
					setcookie("pass",$pass,time()+(3600*24*15));
				}
				return $acceso;
			} else {
				return -2;
			}
		}
	}


	/**
	* Unseteamos las variables de sesión, cookies y salimos del sistema
	*
	* @access public
	* @return NULL
	*/
	function salir() {
		unset($_SESSION['usuario']);
		unset($_SESSION['acceso']);
		unset($_SESSION['id_usuario']);
		setcookie("usuario",NULL,0,"/");
		setcookie("pass",NULL,0,"/");
		setcookie("id_usuario",NULL,0,"/");
        $_SESSION['redirect']=1;
        header("Location: ".BASE);
	}


	/**
	* Crear usuarios con una consulta preparada, devuelve:
	* - -1 si el usuario existe
	* - otro número si no hubo problema
	*
	* @param string $login Nombre que el usuario quiere
	* @param string $pass Contraseña en MD5 del usuario
	* @param string $nombre Nombre completo del usuario
	* @param string $mail El mail del usuario
	*
	* @access public
	* @return int
	*/
	function crear($login,$pass,$nombre,$mail) {
		global $tpl;

		$bd=basededatos::GetInstance();
		$resultado=$bd->crear_usuario($login,$pass,$nombre,$mail);

		if ($resultado==-1){
            $_SESSION['aviso']=1;
			header("Location: ".BASE."?msg="._userExists);
		} else if ($resultado==-2) {
            $_SESSION['aviso']=1;
			#Esto ya no hace falta porque lo miro con javascript, de todas formas, esta forma es más restrictiva
			header("Location: ".BASE."?msg="._failMail);
		} else {
            $_SESSION['aviso']=1;
			header("Location: ".BASE."?msg="._okUser);
		}
	}

}


#Mostramos el menú dependiendo del nivel de acceso
usuarios::mostrar();


if ($_POST['submit_login']) {
	if ($_POST['recordar']=="on") {
		$recordar=1;
	} else {
		$recordar=0;
	}

	$resultado=usuarios::login($_POST['login'],md5($_POST['pass']),$recordar);

#Diferentes mensajes según el error
    $_SESSION['aviso']=1;
	if ($resultado == -1) {
		$tpl->newBlock("error_login");
		$tpl->assign("error_message","¡O usuario non existe!");
	} else if ($resultado == -2) {
		$tpl->newBlock("error_login");
		$tpl->assign("error_message","¡A contrasinal &eacute; incorrecta!");
	} else if ($resutaldo >= 0) {
		//$header="Location: index.php?msg=Benvido%20ó%20sistema%20".$_POST['login'];
		//header($header);
        $_SESSION['redirect']=1;
        header("Location: ".BASE);
    }
}

#Si no está identificado como usuario pero tenia las cookies guardadas por la opción "recuerdame" intentamos entrar con ese usuario
if ($HTTP_COOKIE_VARS['login'] && $HTTP_COOKIE_VARS['pass'] && (!$_SESSION['usuario'] OR !$_SESSION['acceso'])) {
	$resultado=usuarios::login($HTTP_COOKIE_VARS['login'],$HTTP_COOKIE_VARS['pass'],1);
/*	if ($resultado >= 0) {
		header("Location: index.php");
	}*/
}

#Si intentamos registrar a un usuario
if ($_POST['submit_register'] && ($_GET['accion'] == "registrar")) {
	usuarios::crear($_POST['reg_login'],md5($_POST['reg_pass']),$_POST['reg_nombre'],$_POST['reg_mail']);
}
?>
