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
* Con esta clase accederé a todas las funciones posibles que se harán con los links:
* - mostrar los links
* - aumentar los clicks

* @author Alexandre González <alex@rianxosencabos.com>
* @version 0.1
* @copyright GNU/GPL v2.0 or later
*
* @package rianxosencabos
*/

class links {
        /**
        * Esta función pasa al Template Power todas los links existentes
        *
        * @access public
        * @return NULL
        */
        function todos(){
            # Recuperamos la instancia del Template Power
            global $tpl;

            # Recuperamos la instancia de la base de datos
            $bd=basededatos::GetInstance();
            $resultado=$bd->consulta("SELECT id, nombre, clicks FROM links ORDER BY nombre");

            $tpl->newBlock("links");

            # Lo pintamos ;p
            while ($resultado->fetchInto($row,DB_FETCHMODE_ASSOC)) {
                $tpl->newBlock("link");
                $tpl->assign("id",$row['id']);
                $tpl->assign("nombre",utf8_encode($row['nombre']));
                $tpl->assign("clicks",$row['clicks']);
                $numero=$row['clicks'];
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
                $tpl->assign("tamanho",$numero);
                $tpl->gotoBlock("links");
            }
            $tpl->gotoBlock("_ROOT");
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
            $resultado=$bd->consulta("SELECT direccion, clicks FROM links WHERE id=$id LIMIT 1");
            $resultado->fetchInto($resultado,DB_FETCHMODE_ASSOC);

            #Lo que vamos a pasar a la consulta preparada
            $datos=array($resultado['clicks']+1,$id);
            
            #Si el link ya fue visitado en esa sesión no se incrementa el número de clicks
            if (!$_SESSION['visitado'.$id]) {
                $bd->incrementar_clicks($datos,"links");
                $_SESSION['visitado'.$id]=1;
            }

            #Visitamos la web del enlace
            $direccion=$resultado['direccion'];
            header("Location: $direccion");
        }

}

if (int($_GET['id'])) {
    links::visita(int($_GET['id']));
} else {
    links::todos();
}
