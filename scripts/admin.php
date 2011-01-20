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
* Con esta clase accederé a todas la opciones de administración:
* - administrar usuarios
* - administras noticias
* - administrar categorías
* - ...

* @author Alexandre González <alex@rianxosencabos.com>
* @version 0.1
* @copyright GNU/GPL v2.0 or later
*
* @package rianxosencabos
*/
class admin {
	/**
	* Muestra el formulario para enviar la noticia
	*
	* @access public
	* @return NULL
	*/
	function enviar() {
		global $tpl;

		$tpl->newBlock("enviar_noticia");

		$bd=basededatos::GetInstance();

		$categorias=$bd->consulta("SELECT * FROM categorias");
		while($categorias->fetchInto($row,DB_FETCHMODE_ASSOC)) {
			$tpl->newBlock("categorias");
			$tpl->assign("option_id",$row['Id_categoria']);
			$tpl->assign("option_value",utf8_encode($row['Nombre']));
			$tpl->gotoBlock("enviar_noticia");
		}
	}

    /**
    * Muestra el formulario para editar la noticia
    *
    * @param int $id El ID de la noticia a enviar
    *
    * @access public
    * @return NULL
    */
    function editar($id) {
        global $tpl;
        $id=(int)$id;

        $tpl->newBlock("editar_noticia");

        $bd=basededatos::GetInstance();

        $valores=$bd->consulta("SELECT Id_autor as autor, Titulo_noticia as titulo, Categoria as categoria, Texto_noticia as texto, Texto_ampliado as ampliado FROM noticias WHERE Id_noticia=$id");
        $valores->fetchInto($valores,DB_FETCHMODE_ASSOC);

        //Si no eres administrador y tampoco eres el autor de la noticia, para casa ;p
        if ((is_null($_SESSION['acceso'])) || (($valores['autor'] != $_SESSION['id_usuario']) && ($_SESSION['acceso'] != 0))) { // && $_SESSION['acceso'] != 0 && !is_null($_SESSION['acceso'])) {
            exit;
        }

        $tpl->assign("titulo",$valores['titulo']);
        $tpl->assign("texto",$valores['texto']);
        $tpl->assign("ampliado",$valores['ampliado']);

        $categorias=$bd->consulta("SELECT * FROM categorias");
        while($categorias->fetchInto($row,DB_FETCHMODE_ASSOC)) {
            //Con esto seleccionamos la categoría actual de la noticia
            if ($row['Id_categoria'] == $valores['categoria']) {
                $tpl->newBlock("categorias1_selected");
            } else {
                $tpl->newBlock("categorias1");
            }
            $tpl->assign("option_id",$row['Id_categoria']);
            $tpl->assign("option_value",utf8_encode($row['Nombre']));
            $tpl->gotoBlock("enviar_noticia");
        }
    }

    /**
    * Sube una noticia a portada
    *
    * @param int $id El ID de la noticia a subir
    *
    * @access public
    * @return NULL
    */
    function subir($id) {
        if ($_SESSION['acceso'] == 0 && !is_null($_SESSION['acceso'])) {
            $bd=basededatos::GetInstance();
            $bd->portadaNoticia($id);
        }
            header("Location: ".BASE);
    }

    /**
    * Baja una noticia de la portada
    *
    * @param int $id El ID de la noticia a bajar
    *
    * @access public
    * @return NULL
    */
    function bajar($id) {
        if ($_SESSION['acceso'] == 0 && !is_null($_SESSION['acceso'])) {
            $bd=basededatos::GetInstance();
            $bd->desportadaNoticia($id);
        }
        header("Location: ".BASE);
    }

	/**
	* Envia una noticia como administrador
	*
	* @param string $titulo El título de la noticia
	* @param string $texto El texto de introducción de la noticia
	* @param string $texto_ampliado El texto ampliado de la noticia
	* @param int $categoria El id de la categoría
    * @param int $portada Recibe un 1 si fue escrita por un administrador
	*
	* @access public
	* @return NULL
	*/
	function post_noticia($titulo,$texto,$texto_ampliado,$categoria,$portada) {
		$bd=basededatos::GetInstance();
		if ($texto_ampliado=="Texto ampliado") {
			$texto_ampliado="";
		}
		$bd->insertar_noticia($titulo,$texto,$texto_ampliado,$categoria,$_SESSION['id_usuario'],$portada);
        $direccion=$_SESSION['site'];
		header("Location: ".BASE."?$direccion");
	}

    /**
    * Edita una noticia
    *
    * @param string $titulo El nuevo titulo de la noticia
    * @param string $texto El texto de introducción de la noticia
    * @param string $texto_ampliado El texto ampliado de la noticia
    * @param int $categoria El id de la categoría
    * @param int $id El ID de la noticia
    *
    * @access public
    * @return NULL
    */
    function editar_noticia($titulo,$texto,$texto_ampliado,$categoria,$id) {
        $bd=basededatos::GetInstance();
        $bd->editarNoticia($titulo,$texto,$texto_ampliado,$categoria,$id);
        header("Location: ".BASE);
    }

    /**
    * Borra una noticia
    *
    * @param int $id El ID de la noticia a borrar
    *
    * @access public
    * @return NULL
    */
    function borrar($id) {
        $id=(int)$id;
        $bd=basededatos::GetInstance();
        $bd->borrar_noticia($id);
        header("Location: ".BASE);
    }

    /**
    * Muestra la lista de todos los usuarios con sus respectivos niveles
    *
    * @access public
    * @return NULL
    */
    function lista() {
        if (($_SESSION['acceso'] != 0) && (is_null($_SESSION['acceso']))) { die("ERROR 404?"); }
        global $tpl;
        $bd=basededatos::GetInstance();
        $tpl->newBlock("lista_usuarios");

        $valores=$bd->consulta("SELECT Id_usuario, Login, Nombre, Acceso, Mail FROM usuarios ORDER BY Login");

        while($valores->fetchInto($row,DB_FETCHMODE_ASSOC)) {
            if($row['Login'] != "admin") {
                $tpl->newBlock("unUsuario");
                $tpl->assign("id",$row['Id_usuario']);
                $tpl->assign("login",$row['Login']);
                $tpl->assign("nombre",$row['Nombre']);
                switch($row['Acceso']) {
                    case 0:
                        $tpl->newBlock("nivelAdministrador");
                    break;
                    case 1:
                        $tpl->newBlock("nivelUsuarioRed");
                    break;
                    case 2:
                        $tpl->newBlock("nivelUsuarioWeb");
                    break;
                }
                $tpl->gotoBlock("unUsuario");
                $tpl->assign("mail",$row['Mail']);
                $tpl->gotoBlock("lista_usuarios");
            }
        }
    }

    /**
    * Editar los links
    *
    * @access public
    * @return NULL
    */
    function editarLinks() {
        global $tpl;

        if (($_SESSION['acceso'] != 0) && (is_null($_SESSION['acceso']))) { die("ERROR 404?"); }

        $bd=basededatos::GetInstance();
        $tpl->newBlock("administrarLinks");
        $valores=$bd->consulta("SELECT id,direccion,nombre,clicks FROM links ORDER BY nombre");

        while($valores->fetchInto($row,DB_FETCHMODE_ASSOC)) {
            $tpl->newBlock("editarLink");
            $tpl->assign("id",$row['id']);
            $tpl->assign("nombreLink",utf8_encode($row['nombre']));
            $tpl->assign("linkHref",$row['direccion']);
            $tpl->assign("clicks",$row['clicks']);

            $tpl->gotoBlock("administrarLinks");
        }

        $tpl->gotoBlock("_ROOT");
    }

    /**
    * Cambiar algún valor de los links
    *
    * @access public
    * @return NULL
    */
    function cambiaLink() {
        $id=$_POST['inputOculto2'];
        $bd=basededatos::GetInstance();
        $bd->cambiaLink($_POST['nombreLink'.$id],$_POST['linkHref'.$id],$_POST['clicks'.$id],$id);
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }

    /**
    * Muestra las preferencias del usuario, en principio cambiar contraseña.
    * TODO: Poner foto, cambiar nombre y apellidos, dirección de correo...
    *
    * @access public
    * @return NULL
    */
    function see_preferences() {
        global $tpl;

        $tpl->newBlock("preferencias_usuario");
    }

    /**
    * Cambia la contraseña.
    * 
    * @param string $actual La contraseña actual para saber si coincide con la existente.
    *
    * @access public
    * @return NULL
    */
    function cambia_pass($actual,$nueva) {
        global $tpl;

        $bd=basededatos::GetInstance();
        $existente=$bd->getPass($_SESSION['id_usuario']);
        if (md5($actual) == $existente) {
            $bd->cambiaPass($nueva);
            $_SESSION['aviso']=1;
            header("Location: ".BASE."?msg="._changePasswordOk);
        } else {
            echo "<SCRIPT>alert('Contrasinal incorrecta.');</SCRIPT>";
        }
    }
    
    /**
    * Cambia el nivel del usuario
    *
    * @param int $id El ID del usuario al que hay que cambiar el nivel
    * @param int $nivel El nuevo nivel para el usuario
    *
    * @access public
    * @return NULL
    */
    function cambiaLevel($id,$nivel) {
        $bd=basededatos::GetInstance();
        $bd->cambiaLevel($id,$nivel);
    }

    /**
    * Borrar un usuario
    *
    * @param int $id El ID del usuario a borrar
    *
    * @access public
    * @return NULL
    */
    function borrarUsuario($id) {
        $bd=basededatos::GetInstance();
        $bd->borrarUsuario($id);
        header("Location:".$_SERVER['HTTP_REFERER']);
    }

    /**
    * Borrar un link
    *
    * @param int $id El ID del link
    *
    * @access public
    * @return NULL
    */
    function borrarLink($id) {
        $bd=basededatos::GetInstance();
        $bd->borrarLink($id);
        header("Location: ".$_SERVER['HTTP_REFERER']);
    } 

    /**
    * Nuevo link
    *
    * @param string $nombre El nombre para el link
    * @param string $href La dirección de destino del link
    *
    * @access public
    * @return NULL
    */
    function newLink($nombre,$href) {
        $bd=basededatos::GetInstance();
        $bd->newLink($nombre,$href);
        header("Location: ".$_SERVER['HTTP_REFERER']);
    }
}

if($_POST['submit_noticia']) {
    //Si es usuario normal la carga en su blog, si no, la mete en portada
    if (($_SESSION['acceso'] == 0) && ($_SESSION['usuario'] == "admin")) { //Soy administrador
    	admin::post_noticia($_POST['titulo'],$_POST['texto'],$_POST['texto_ampliado'],$_POST['categoria'],1);
    } else if (($_SESSION['acceso'] == 1) || ($_SESSION['acceso'] == 0)) {
        admin::post_noticia($_POST['titulo'],$_POST['texto'],$_POST['texto_ampliado'],$_POST['categoria'],0);
    }
}

if ($_POST['submit_editar_noticia']) {
    $titulo=strip_tags($_POST['titulo']);
    $texto=strip_tags($_POST['texto'],'<code><span><strike><u><em><strong><div><ol><li><ul><img><a><br><p>');
    $ampliado=strip_tags($_POST['texto_ampliado'],'<code><span><strike><u><em><strong><div><ol><li><ul><img><a><br><p>');
    $categoria=strip_tags($_POST['categoria']);
    if (($texto != $_POST['texto']) || ($ampliado != $_POST['texto_ampliado'])) {  exit; }
    admin::editar_noticia($titulo,$texto,$ampliado,$categoria,$_GET['id']);
}

if($_POST['submit_preferencias']) {
    admin::cambia_pass($_POST['passActual'],$_POST['passNew']);
} else if ($_POST['inputOculto']) {
    $id=$_POST['inputOculto'];
    admin::cambiaLevel($_POST['inputOculto'],$_POST[$id]);
} else if ($_POST['inputOculto2']) {
    admin::cambiaLink();
} else if ($_POST['newLink']) {
    admin::newLink($_POST['nombreNuevoLink'],$_POST['nuevoLinkHref']);
}

switch($_GET['accion']) {
	case 'enviar':
		admin::enviar();
	break;
    case 'subir':
        admin::subir($_GET['id']);
    break;
    case 'lista':
        if ($_SESSION['acceso'] == 0 && isset($_SESSION['acceso']) {
            admin::lista();
        }
    break;
    case 'editar':
        admin::editar($_GET['id']);
    break;
    case 'bajar':
        if ($_SESSION['acceso'] == 0 && isset($_SESSION['acceso']) {
            admin::bajar($_GET['id']);
        }
    break;
    case 'borrar':
        if ($_SESSION['acceso'] == 0 && isset($_SESSION['acceso']) {
            admin::borrar($_GET['id']);
        }
    break;
    case 'preferencias':
        admin::see_preferences();
    break;
    case 'borrarUsuario':
        if ($_SESSION['acceso'] == 0 && isset($_SESSION['acceso']) {
            admin::borrarUsuario($_GET['id']);
        }
    break;
    case 'editarLinks':
        if ($_SESSION['acceso'] == 0 && isset($_SESSION['acceso']) {
            admin::editarLinks();
        }
    break;
    case 'borrarLink':
        if ($_SESSION['acceso'] == 0 && isset($_SESSION['acceso']) {
            admin::borrarLink($_GET['id']);
        }
    break;
}

?>
