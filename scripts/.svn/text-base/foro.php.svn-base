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
* Con esta clase accederé a todas las funciones posibles que se harán con los foros: hilos, respuestas:
* - crear un hilo
* - mostrar los hilos
* - comentar un hilo
* - ...

* @author Alexandre González <alex@rianxosencabos.com>
* @version 0.1
* @copyright GNU/GPL v2.0 or later
*
* @package rianxosencabos
*/
class foro {
    /**
    * Esta función pasa a Template Power todas los hilos creadeos ordenador de forma descendente
    *
    * @access public
    * @return NULL
    */
    function todos() {
        #Recuperamos la instancia de tp
        global $tpl;
        
        #Recuperamos instancia de la bd
        $bd=basededatos::GetInstance();
        $resultado=$bd->consulta("SELECT Id_hilo AS id, Titulo_hilo AS titulo, DATE_FORMAT(Fecha_envio,'%d/%m/%Y') AS fecha,DATE_FORMAT(Fecha_envio,'%H:%i') AS hora, Nombre AS autor FROM foro f, usuarios u WHERE f.Id_autor=u.Id_usuario ORDER BY Fecha_envio DESC");


        $tpl->newBlock("todos_hilos");
        #Para cada hilo miramos el número de comentarios y vamos asignando valores
        while($resultado->fetchInto($row,DB_FETCHMODE_ASSOC)) {
                $comentarios=$bd->consulta("SELECT COUNT(*) AS num FROM rsp_foro WHERE Id_hilo=".$row['id']);
                $comentarios->fetchInto($numero,DB_FETCHMODE_ASSOC);
                $numero=$numero['num'];

                $tpl->newBlock("hilo");
/*               if ($numero == 0) {
                    $tpl->assign("comentarios","(Non hai comentarios)");
                } else if ($numero == 1) {
                    $tpl->assign("comentarios","(Un único comentario)");
                } else {
                    $tpl->assign("comentarios","($numero comentarios)");
                }*/
                $tpl->assign("comentarios",$numero);
                $tpl->assign("titulo",$row['titulo']);
                $tpl->assign("autor",$row['autor']);
                $tpl->assign("fecha",$row['fecha']);
                $tpl->assign("hora",$row['hora']);
                $tpl->assign("id",$row['id']);
                $tpl->gotoBlock("todos_hilos");
        }
        if ($_SESSION['usuario']) {
            $tpl->newBlock("escribir_hilo");
            $tpl->assign("nombre_usuario",$_SESSION['usuario']);
            $tpl->gotoBlock("todos_hilos");
        }
        $tpl->gotoBlock("_ROOT");
    }

    /**
    * Si recibe un ID muestra el hilo y sus comentarios
    *
    * @param int $id El ID del hilo a mostrar
    *
    * @access public
    * @return NULL
    */
    function una($id) {
        #Recuperamos TP
        global $tpl;

        #Pasamos id a entero para evitar SQL injection
        $id=(int)$_GET['id'];

        $bd=basededatos::GetInstance();
        $resultado=$bd->consulta("SELECT Id_hilo AS id, Titulo_hilo AS titulo, Texto_hilo as texto, DATE_FORMAT(Fecha_envio,'%d/%m/%Y') AS fecha, DATE_FORMAT(Fecha_envio,'%H:%i') AS hora,Nombre AS autor FROM foro f, usuarios u WHERE f.Id_autor=u.Id_usuario AND Id_hilo=".$id);

        #Consultamos los datos del hilo
        $resultado->fetchInto($row,DB_FETCHMODE_ASSOC);
        $tpl->newBlock("un_hilo");
        $tpl->assign("titulo",$row['titulo']);
        $tpl->assign("autor",$row['autor']);
        $tpl->assign("fecha",$row['fecha']);
        $tpl->assign("hora",$row['hora']);
        $tpl->assign("texto",$row['texto']);

        #Recuperamos los comentarios
        $resultado=$bd->consulta("SELECT ip,Id_rsp, Titulo, Texto, Nombre,Mail,DATE_FORMAT(Fecha,'%d/%m') AS fecha,DATE_FORMAT(Fecha,'%H:%i') AS Hora FROM rsp_foro f LEFT JOIN usuarios u ON f.Id_autor=u.Id_usuario WHERE Id_hilo=".$id." ORDER BY Id_rsp DESC");
        if ($_SESSION['usuario']) {
            $tpl->assign("nombre_usuario",$_SESSION['usuario']);
        } else {
            $tpl->assign("nombre_usuario","Anónimo");
        }
        
        $existen=0;
        while($resultado->fetchInto($row,DB_FETCHMODE_ASSOC)){
            if ($existen==0) {
                $tpl->newBlock("respuestas");
                $existen=1;
            }
            $tpl->newBlock("respuesta");

            //Si no tiene usuario la respuesta es que se escribió como anónimo
            if (!$row['Login']) {
                $tpl->assign("login","Anónimo");
            } else {
                $tpl->assign("login",$row['Login']);
            }

            $tpl->assign("id_respuesta",$row['Id_rsp']);
            $tpl->assign("marcador",$PHP_SELF."#respuesta-".$row['Id_rsp']);
            $tpl->assign("titulo",$row['Titulo']);
            $tpl->assign("texto",$row['Texto']);
            $tpl->assign("hora",$row['Hora']);
            $tpl->assign("fecha",$row['fecha']);
            if (($_SESSION['acceso'] == 0) && !is_null($_SESSION['acceso'])) {
                $tpl->assign("ip"," (".$row['ip'].")");
            }
        }
        if ($existen==1) {
            $tpl->gotoBlock("respuestas");
        }
        $tpl->gotoBlock("_ROOT");
    }

    /**
    * Esta función se encarga de añadir un comentario, para ello utiliza la clase basededatos (aquí se supone que se harían las comprobaciones previas sobre la validez de los datos).
    *
    * @param int $id_hilo El ID del hilo al que se responde
    * @param int $id_usuario El ID del usuario que escribe
    * @param string $titulo El título de la respuesta
    * @param string $texto El texto de la respuesta
    * @param int $hijo TODO: Si es o no una respuesta a otra
    *
    * @access public
    * @return NULL
    */
    function postear_respuesta($id_hilo,$id_usuario,$titulo,$texto,$hijo=NULL) {
        $bd=basededatos::GetInstance();
        $id_hilo=(int)$id_hilo;
        $bd->responder_hilo($id_hilo,$id_usuario,$titulo,$texto,$hijo);
    }

    /**
    * Esta función crea nuevos hilos en el foro
    *
    * @param int $id_usuario El ID del usuario que escribe
    * @param string $titulo El título del hilo
    * @param string $texto El texto del hilo
    *
    * access public
    * @return NULL
    */
    function postear_hilo($id_usuario,$titulo,$texto) {
        $bd=basededatos::GetInstance();
        $bd->crear_hilo($id_usuario,$titulo,$texto);
    }
}

if ($_POST['submit_hilo']) {
    $titulo=strip_tags($_POST['titulo']);
    $texto=strip_tags($_POST['texto'],'<code><span><strike><u><em><strong><div><ol><li><ul><img><a><br><p>');
    if ($texto != $_POST['texto']) { exit; }
    foro::postear_hilo($_SESSION['id_usuario'],$titulo,$texto);
} else if ($_POST['submit_respuesta']) {
    $titlo=strip_tags($_POST['titulo']);
    $texto=strip_tags($_POST['texto2'],'<code><span><strike><u><em><strong><div><ol><li><ul><img><a><br><p>');
    $captcha=(int)$_POST['captcha'];
    if ($captcha != 4) { die("Don't play with the captcha!"); }
    if ($texto != $_POST['texto2']) { exit; }
    foro::postear_respuesta($_GET['id'],$_SESSION['id_usuario'],$titulo,$texto);
}

if (!$_GET['id']) {
    foro::todos();
} else {
    foro::una($_GET['id']);
}
?>
