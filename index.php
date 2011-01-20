<?php
/**
* @package rianxosencabos
*
* @author Alexandre González <alex@rianxosencabos.com>
* @version 0.1
* @copyright GNU/GPL v2.0 or later
*/

session_start();

/**
* Incluimos la librería Template Power encargada de mostrar las páginas web diferenciando completamente código HTML de código PHP
*/
require_once(dirname(__FILE__)."/tp/class.TemplatePower.inc.php");

/**
* Algunas configuraciones como usuario y pass de la BD
*/
require_once(dirname(__FILE__)."/config.php");

$tpl = new TemplatePower(dirname(__FILE__)."/templates/index.tpl");

/**
* Esta función es la encargada de incluir los ficheros dinámicos y estáticos de templates.
*
* @param string $seccion Debe existir al menos templates/$seccion.tpl en modo NO dinámico, y si estamos en modo dinámico también scripts/$seccion.php
* @param string $tipo Si es distinto de dinamico no carga un script PHP asociado
*
* @access public
* @return NULL
*/
function cargar($seccion,$tipo="dinamico") {
	global $tpl;

    include(dirname(__FILE__)."/i18n/i18n.php");
    include(dirname(__FILE__)."/i18n/".LANGUAGE."/index.php");
    include(dirname(__FILE__)."/i18n/".LANGUAGE."/usuarios.php");
	$tpl->assignInclude("usuarios","templates/usuarios.tpl");
    if (file_exists(dirname(__FILE__)."/i18n/".LANGUAGE."/usuarios.php")) {
        //Si existe internacionalización para ese archivo lo carga
        include(dirname(__FILE__)."/i18n/".LANGUAGE."/".$seccion.".php");
    }
	$tpl->assignInclude("documento","templates/".$seccion.".tpl");
	$tpl->prepare();
	require('scripts/usuarios.php');
	if ($tipo == "dinamico") {
		require('scripts/'.$seccion.'.php');
	} else {
		$tpl->gotoBlock("_ROOT");
	}
}

#Este es el nombre por defecto de la web, se podrá sobreescribir luego p.e. para las noticias
$tpl->assignGlobal("WEBNAME",WEBNAME);
$tpl->assignGlobal("BASE",BASE);
if ($_GET['u']) {
    //Esto es para que cada usuario tenga su propio RSS
    $tpl->assignGlobal("usuarioAccedido",$_GET['u']);
}

# El include dependerá de la sección
switch($_GET['s']) {
	case 'proxecto':
        $tpl->assignGlobal("WEBNAME","Proxecto ".SHORT_WEBNAME);
        $_SESSION['site']=$_SERVER['QUERY_STRING'];
		cargar("estaticas/proxecto",NULL);
	break;

	case 'taller':
        $_SESSION['site']=$_SERVER['QUERY_STRING'];
        $tpl->assignGlobal("WEBNAME","Taller // ".SHORT_WEBNAME);
		cargar("estaticas/taller",NULL);
	break;

	case 'sociedade':
       $_SESSION['site']=$_SERVER['QUERY_STRING'];
       $tpl->assignGlobal("WEBNAME","Sociedade // ".SHORT_WEBNAME);
		cargar("estaticas/sociedade",NULL);
	break;

	case 'foro':
        $_SESSION['site']=$_SERVER['QUERY_STRING'];
        $tpl->assignGlobal("WEBNAME","Foro // ".SHORT_WEBNAME);
		cargar("foro");
	break;

	case 'blogs':
        $_SESSION['site']=$_SERVER['QUERY_STRING'];
        $tpl->assignGlobal("WEBNAME","Blogs // ".SHORT_WEBNAME);
		cargar("blogs");
	break;

    case 'galeria':
        $_SESSION['site']=$_SERVER['QUERY_STRING'];
        $tpl->assignGlobal("WEBNAME","Galería // ".SHORT_WEBNAME);
        cargar("galeria");
    break;

	case 'cobertura':
        $_SESSION['site']=$_SERVER['QUERY_STRING'];
        $tpl->assignGlobal("WEBNAME","Cobertura // ".SHORT_WEBNAME);
		cargar("estaticas/cobertura",NULL);
	break;

	case 'links':
        $_SESSION['site']=$_SERVER['QUERY_STRING'];
        $tpl->assignGlobal("WEBNAME","Ligaz&oacute;ns // ".SHORT_WEBNAME);
		cargar("links");
	break;

	case 'usuarios':
		switch($_GET['accion']){
			case 'registrar':
				cargar("estaticas/register",NULL);
			break;
            case 'salir':
                //FIXME: Esto es un hack porque desde el archivo usuarios.php nunca logré hacer bien el header()
                require_once("scripts/usuarios.php");
                usuarios::salir();
            break;
		}
	break;

	case 'admin':
        if (!$_GET['accion']) { $_SESSION['site']=$_SERVER['QUERY_STRING']; }
        $tpl->assignGlobal("WEBNAME","Zona de administraci&oacute;n // ".SHORT_WEBNAME);
		cargar("admin");
	break;

    case 'noticias':
        $_SESSION['site']=$_SERVER['QUERY_STRING'];
        cargar("noticias");
    break;

	#Por defecto siempre carga noticias
	default:
        $_SESSION['site']="?";
		cargar("noticias");
	break;
}

if ($_SESSION['redirect'] && $_SESSION['site']){
    header("Location: ?".$_SESSION['site']);
    unset($_SESSION['redirect']);
}

#Si hay mensaje lo muestro
if ($_GET['msg'] && $_SESSION['aviso']) {
	$tpl->newBlock("mensaje_atencion");
	$tpl->assign("mensaje_atencion",htmlentities(utf8_decode($_GET['msg'])));
    unset($_SESSION['aviso']);
}

# Plantilla preparada.... A MOSTRARLA!
$tpl->printToScreen();

?>
