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
* Con esta clase accederé a todas las funciones posibles que se harán con las noticias:
* - mostrar una noticia
* - mostrar todas las noticias
* - insertar comentarios
* - ...

* @author Alexandre González <alex@rianxosencabos.com>
* @version 0.1
* @copyright GNU/GPL v2.0 or later
*
* @package rianxosencabos
*/
class noticias {
	/**
	* Esta función pasa al Template Power todas las noticias existentes ordenadas de forma descendente
	*
    * @param int $id El ID del usuario a mostrar su noticias, si no lo recibe, muestra todas las de portada.
    *
	* @access public
	* @return NULL
	*/
	function todas($id=NULL) {
		# Para recuperar la instancia de Template Power
		global $tpl;
        $i=1;
	
		# Creamos la instancia del objecto basededatos y realizamos la consulta
		$bd=basededatos::GetInstance();
		#$resultado=$bd->consulta("select *,date_format(fecha,'%d/%m/%y') as Fecha from noticias");
        if($id) {
            $resultado=$bd->consulta("SELECT *,DATE_FORMAT(fecha, '%d/%m/%y') AS Fecha FROM noticias n,usuarios u WHERE n.Id_autor=u.Id_usuario AND n.Id_autor=$id ORDER BY Id_noticia DESC");
        } else {
    		$resultado=$bd->consulta("SELECT *,DATE_FORMAT(fecha, '%d/%m/%y') AS Fecha FROM noticias n,usuarios u WHERE n.Id_autor=u.Id_usuario AND Portada=1 ORDER BY Fecha_subida DESC");
        }
	
		# Para cada noticia miramos el número de comentarios y vamos asignando valores
		while ($resultado->fetchInto($row,DB_FETCHMODE_ASSOC)) {
			$comentarios=$bd->consulta("SELECT COUNT(*) AS num FROM rsp_noticias WHERE Id_noticia=".$row['Id_noticia']);
			$comentarios->fetchInto($numero,DB_FETCHMODE_ASSOC);
			$numero=$numero['num'];

			$tpl->newBlock("noticia");
            if ($row['Portada']==1 && $row['Id_autor'] != 1 && $_SESSION['acceso'] == 0 && isset($_SESSION['acceso'])) {
                //El 1 de bajar1 es para todas las noticias, cuando se está viendo una sola sería bajar2
                $tpl->newBlock("bajar1");
                $tpl->assign("id",$row['Id_noticia']);
                $tpl->gotoBlock("noticia");
            } else if ($row['Id_autor'] != 1 && $_SESSION['acceso'] == 0 && isset($_SESSION['acceso'])) {
                $tpl->newBlock("subir1");
                $tpl->assign("id",$row['Id_noticia']);
                $tpl->gotoBlock("noticia");
            }

            if (($row['Id_autor'] == $_SESSION['id_usuario']) || ($_SESSION['acceso'] == 0) && !is_null($_SESSION['acceso'])) {
                $tpl->newBlock("editar1");
                $tpl->assign("id",$row['Id_noticia']);
                $tpl->gotoBlock("noticia");
                $tpl->newBlock("borrar1");
                $tpl->assign("id",$row['Id_noticia']);
                $tpl->gotoBlock("noticia");
            }
			if ($row['Texto_ampliado']) {
				$tpl->newBlock("leermas");
				$tpl->assign("id",$row['Id_noticia']);
				$tpl->gotoBlock("noticia");
			}
			if ($numero==0) {
				$tpl->assign("comentarios",_noResponses);
			} else if ($numero==1) {
				$tpl->assign("comentarios",_oneResponse);
			} else {
				$tpl->assign("comentarios",_responses."($numero)");
			}
			$tpl->assign("titulo",$row['Titulo_noticia']);
			$tpl->assign("autor",$row['Login']);
			$tpl->assign("fecha",$row['Fecha']);
            //Este ereg_replace es por temas de validación HTML4strict
            $texto=ereg_replace(" />",">",stripslashes($row['Texto_noticia']));
            //$texto=eregi_replace("href","rel=lightbox href",$texto);
			$tpl->assign("texto",$texto);
			$tpl->assign("id",$row['Id_noticia']);
		}
	
		$tpl->gotoBlock("_ROOT");
	}


	/**
	* Si recibe un ID muestra solo esa noticia y sus comentarios
	*
	* @param int $id El ID de la noticia que se quiere mostrar
	*
	* @access public
	* @return NULL
	*/
	function una($id) {
		# Recuperamos la instancia de Template Power
		global $tpl;

		# Pasamos id a entero para que no hagan SQL injection
		$id=(int)$_GET['id'];

		$bd=basededatos::GetInstance();
		#$resultado=$bd->consulta("select *,date_format(fecha,'%d/%m/%y') as Fecha from noticias where Id_noticia=$id");
		$resultado=$bd->consulta("SELECT Id_noticia,Portada,Id_autor,Titulo_noticia, Login,Texto_noticia,Texto_ampliado,DATE_FORMAT(fecha,'%d/%m/%y') AS Fecha FROM noticias n,usuarios u WHERE n.Id_autor=u.Id_usuario AND Id_noticia=$id");
    
		$resultado->fetchInto($row,DB_FETCHMODE_ASSOC);
        $tpl->assignGlobal("WEBNAME",$row['Titulo_noticia'] ." // " . SHORT_WEBNAME);
		$tpl->newBlock("noticia_comentando");
        if ($row['Portada']==1 && $row['Id_autor'] != 1 && $_SESSION['acceso'] == 0 && isset($_SESSION['acceso'])) {
            $tpl->newBlock("bajar2");
            $tpl->assign("id",$row['Id_noticia']);
            $tpl->gotoBlock("noticia_comentando");
        } else if ($row['Id_autor'] != 1 && $_SESSION['acceso'] == 0 && isset($_SESSION['acceso'])) {
            $tpl->newBlock("subir2");
            $tpl->assign("id",$row['Id_noticia']);
            $tpl->gotoBlock("noticia_comentando");
        }
        if (($row['Id_autor'] == $_SESSION['id_usuario']) || ($_SESSION['acceso'] == 0) && !is_null($_SESSION['acceso'])) {
            $tpl->newBlock("editar2");
            $tpl->assign("id",$row['Id_noticia']);
            $tpl->gotoBlock("noticia_comentando");
            $tpl->newBlock("borrar2");
            $tpl->assign("id",$row['Id_noticia']);
            $tpl->gotoBlock("noticia_comentando");
        }
		$tpl->assignGlobal("titulo",$row['Titulo_noticia']);
		$tpl->assign("autor",$row['Login']);
		$tpl->assign("fecha",$row['Fecha']);
//                    $tpl->assign("texto",str_replace("\\\"","\"",$row['Texto_noticia']));
            //Este ereg_replace es por temas de validación HTML4strict
            $texto=ereg_replace(" />",">",stripslashes($row['Texto_noticia']));
            $texto=eregi_replace("href","rel=lightbox href",$texto);
		$tpl->assign("texto",ereg_replace(" />",">",$texto));
		if ($row['Texto_ampliado']) {
			$tpl->newBlock("ampliado");
//                        $tpl->assign("texto",str_replace("\\\"","\"",$row['Texto_noticia']));
                        //Este ereg_replace es por temas de validación HTML4strict
            $texto=ereg_replace(" />",">",stripslashes($row['Texto_ampliado']));
            //$texto=eregi_replace("href","rel=lightbox href",$texto);
			$tpl->assign("texto_ampliado",$texto);
			$tpl->gotoBlock("noticia_comentando");
		}

		//$resultado=$bd->consulta("SELECT *,DATE_FORMAT(fecha,'%d/%m') AS Fecha,DATE_FORMAT(fecha,'%H:%i') AS Hora FROM rsp_noticias n, usuarios u WHERE n.Id_autor=u.Id_usuario AND Id_noticia=$id ORDER BY Id_rsp DESC");
		$resultado=$bd->consulta("SELECT *,DATE_FORMAT(fecha,'%d/%m') AS Fecha,DATE_FORMAT(fecha,'%H:%i') AS Hora FROM rsp_noticias n LEFT JOIN usuarios u ON n.Id_autor=u.Id_usuario WHERE Id_noticia=$id ORDER BY Id_rsp DESC");

/*		if ($_SESSION['usuario']) {
			$tpl->assign("nombre_usuario",$_SESSION['usuario']);
		} else {
			$tpl->assign("nombre_usuario","Anónimo");
		}
*/
		$existen=0;
		while($resultado->fetchInto($row,DB_FETCHMODE_ASSOC)) {
			if ($existen==0) {
				$tpl->newBlock("respuestas");
				$existen=1;
			}
			$tpl->newBlock("respuesta");

			//Si no tiene usuario la respuesta es porque se escribio como anónimo, aquí lo comprobamos
			if (!$row['Login']) {
				$tpl->assign("login","Anónimo");
			} else {
				$tpl->assign("login",$row['Login']);
			}
            $tpl->assign("id_comentario",$row['Id_rsp']);
            $tpl->assign("marcador",$PHP_SELF."#comentario-".$row['Id_rsp']);
			$tpl->assign("titulo",$row['Titulo']);
			$tpl->assign("fecha",$row['Fecha']);
			$tpl->assign("hora",$row['Hora']);
			$tpl->assign("texto",$row['Texto']);
            if (($_SESSION['acceso'] == 0) && !is_null($_SESSION['acceso'])) {
                $tpl->assign("ip"," (".$row['ip'].")");
            }
		}

		if ($existen==1) {
			$tpl->gotoBlock("respuestas");
		}
        
        if (!is_null($_SESSION['acceso'])) {
            $tpl->newBlock("editorRespuesta");
       		if ($_SESSION['usuario']) {
    			$tpl->assign("nombre_usuario",$_SESSION['usuario']);
    		} else {
    			$tpl->assign("nombre_usuario","Anónimo");
    		}
    	}

		$tpl->gotoBlock("_ROOT");
	}


	/**
	* Con esta función llamamos a la clase basededatos para que añada un comentario
	*
	* @param int $id_noticia El ID de la noticia que se quiere responder
	* @param int $id_usuario El ID del usuario que está respondiendo a la noticia
	* @param string $titulo El titulo de la respuesta
	* @param string $texto El texto de la respuesta
	* @param int $hijo TODO: Si es o no una respuesta a otra respuesta
	*
	* @access public
	* @return NULL
	*/
	function postear($id_noticia,$id_usuario,$titulo,$texto,$hijo=NULL) {
		$bd=basededatos::GetInstance();
        $id_noticia=(int)$id_noticia;
		$bd->insertar_comentario($id_noticia,$id_usuario,$titulo,$texto,$hijo);
	}
	
	function showBlog( $username ) {
	    require_once( dirname( __FILE__ ) . "/blogs.php" );
        $bd=basededatos::GetInstance();
        $id = $bd->getId( $username );
        blogs::visita( $id );
        noticias::todas( $id );
	}
}

if ($_POST['submit_respuesta']) {
    $titulo=strip_tags($_POST['titulo']);
    $texto=strip_tags($_POST['texto'],'<code><span><strike><u><em><strong><div><ol><li><ul><img><a><br><p>');
    if ($texto != $_POST['texto']) { exit; }
    //Algo andan haciendo para que estas 2 no coincidan ;)
	noticias::postear($_GET['id'],$_SESSION['id_usuario'],$titulo,$texto);
}

if ($_GET['id']) {
    noticias::una($_GET['id']);
} else if ($_GET['u']) {
    //I go to this when mod_rewrite sends me here
    noticias::showBlog( $_GET['u'] );
} else {
    if ($_GET['s'] != 'blogs') {
        //FIXME: Me da la impresión de que esto es un poco cutre, pero no me funcionaba templatePower para mostrar los blogs de otra manera y que se viera usuarios.tpl
        noticias::todas($_GET['u']);
    }
}

?>
