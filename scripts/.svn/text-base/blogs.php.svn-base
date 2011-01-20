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
* Con esta clase:
* - muestro todos los blogs personales
* - los cargo por separado

* @author Alexandre González <alex@rianxosencabos.com>
* @version 0.1
* @copyright GNU/GPL v2.0 or later
*
* @package rianxosencabos
*/

class blogs {
        /**
        * Esta función pasa al Template Power todas los blogs existentes
        *
        * @access public
        * @return NULL
        */
        function todos(){
            # Recuperamos la instancia del Template Power
            global $tpl;

            # Recuperamos la instancia de la base de datos
            $bd=basededatos::GetInstance();
            //$resultado=$bd->consulta("SELECT id_usuario, login FROM usuarios WHERE ((acceso=1  OR acceso=0) AND (login != 'admin')) ORDER BY login");
		$resultado=$bd->consulta("SELECT u.id_usuario, u.login, n.fecha FROM usuarios u, noticias n WHERE ((u.acceso=1  OR u.acceso=0) AND (u.login != 'admin')) AND (u.id_usuario = n.id_autor) GROUP BY u.login ORDER BY MAX(n.fecha) DESC");

            # Lo pintamos ;p
            while ($resultado->fetchInto($row,DB_FETCHMODE_ASSOC)) {
                $noticias=$bd->consulta("SELECT COUNT(*) AS numero FROM noticias WHERE id_autor=".$row['id_usuario']);
                $noticias->fetchInto($noticias,DB_FETCHMODE_ASSOC);
                $numero=$noticias['numero'];
                if ($numero != 0) {
                    $tpl->newBlock("blog");
                    $tpl->assign("login",utf8_encode($row['login']));
                    if ($numero < 5) {
                        $numero="Min";
                    } elseif ($numero < 10) {
                        $numero=1;
                    } elseif ($numero < 15) {
                        $numero=2;
                    } elseif ($numero < 20) {
                        $numero=4;
                    } elseif ($numero < 25) {
                        $numero=5;
                    } elseif ($numero < 30) {
                        $numero=6;
                    } elseif ($numero < 40) {
                        $numero=7;
                    } elseif ($numero < 50) {
                        $numero=8;
                    } elseif ($numero < 60) {
                        $numero=9;
                    } else {
                        $numero="Max";
                    }
                    $tpl->assign("noticias",$numero);
                }
            }
            $tpl->gotoBlock("_ROOT");
        }


        /**
        * Con esta función mostramos el blog del usuario enviado por parámetro
        *
        * @param string $usuario El login del usuario
        *
        * @access public
        * @return NULL
        */
        function soloUno($usuario) {
            global $tpl;
            $bd=basededatos::GetInstance();
            $id=$bd->getId($usuario);
		    blogs::visita($id);
            header("Location: ".BASE."?s=noticias&u=$id");
        }


	/**
        * Esta función agrega un click al link si es la primera vez en la sesión
        *
        * @access public
        *
        * @param int $id El id de la página que vamos a visitar
        *
        * @return NULL
        */
        function visita($id) {
            # Recuperamos la instancia
            $bd=basededatos::GetInstance();
            
            #Por el id sabemos a que link se refiere
            $resultado=$bd->consulta("SELECT clicks FROM usuarios WHERE Id_usuario=$id LIMIT 1");
            $resultado->fetchInto($resultado,DB_FETCHMODE_ASSOC);

            #Lo que vamos a pasar a la consulta preparada
            $datos=array($resultado['clicks']+1,$id);
            
            #Si el link ya fue visitado en esa sesión no se incrementa el número de clicks
            if (!$_SESSION['visitado'.$id]) {
                $bd->incrementar_clicks($datos,"usuarios");
                $_SESSION['visitado'.$id]=1;
            }
        }
}

if ($_GET['u']) {
    //blogs::soloUno($_GET['u']);
} else {
    blogs::todos();
}
