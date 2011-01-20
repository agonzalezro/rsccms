<?php

/**
* @package rianxosencabos
*
* @author Alexandre González <alex@rianxosencabos.com>
* @version 0.1
* @copyright GNU/GPL v2.0 or later
*/

/**
* Incluimos el fichero con la configuración de acceso a la base de datos
*/
//require_once(dirname(__FILE__)."/../config.php");


/**
* Incluimos pear FIXME
*/
//require_once(dirname(__FILE__)."/../PEAR/PEAR.php");


/**
* Incluimos pear-DB
*/
//require_once(dirname(__FILE__)."/../DB/DB.php");
require_once("DB.php");


/**
* En esta clase incluiré todas las funciones necesarias para trabajar contra la base de datos:
* - inserts
* - deletes
* - consultas
* - ...
* 
* @author Alexandre González <alex@rianxosencabos.com>
* @version 0.1
* @copyright GNU/GPL v2.0 or later
*
* @package rianxosencabos
*/
class basededatos{
	private static $db=NULL;
	private static $instance=false;


	/**
	* Al construir esta clase creamos la conexión persistente a la base de datos con pear-db
	*
	* @access private
	* @return NULL
	*/
	private function __construct() {
		#Creamos conexión
		$dsn = "mysql://".USUARIO.":".PASS."@".SERVIDOR."/".BD;
		$this->db = DB::connect($dsn,true);
        

		#Si hay error ta'logo!
		if (DB::isError($this->db)) {
			die ($this->db->getMessage());
		}
	}

	/**
	* Al destruir el objecto cerramos la conexión
	*
	* @access public
	* @return NULL
	*/
	function __destruct() {
        $this->db->disconnect();
	}


	/**
	* Para crear la clase debemos llamar a esta función para que no la duplique nunca
	*
	* <code>$bd=basededatos::GetInstance();</code>
	*
	* @access public
	* @return object
	*/
	public static function GetInstance() {
		if(empty(self::$instance)) {
			#crea una nueva instancia de la clase
			self::$instance = new basededatos();
		}
		return self::$instance;
	}


	/**
	* Esto devolvería un array con los resultados para procesar con DB::fetchInto
	*
	* <code>
	* $bd=basededatos::GetInstance();
	* $resultado=$bd->consulta("SELECT * FROM tabla");
	* while($resultado->fetchInto($row,DB_FETCH_MODE_ASSOC) {...}
	* </code>
	*
	* @param string $sqlstring La consulta en formato SQL
	*
	* @access public
	* @return array
	*/
	function consulta($sqlstring) {
		$result=$this->db->query($sqlstring);
		
		return $result;
	}


	/**
	* Con esta función insertamos un comentario en una NOTICIA con una consulta preparada
	*
	* @param int $id_noticia El ID de la noticia a la que se responde
	* @param int $usuario El ID del usuario que inserta la noticia
	* @param string $titulo El titulo de la respuesta
	* @param string $texto El texto de la respuesta
	* @param int $hijo TODO: Para saber si el comentario es hijo de otro comentario
	*
	* @access public
	* @return NULL
	*/
	function insertar_comentario($id_noticia,$usuario,$titulo,$texto,$hijo=NULL) {
		#Id_rsp,Id_noticia,Id_autor,Titulo,Texto,Fecha,Hijo
		$datos=array("$id_noticia","$usuario","$titulo","$texto",date("Y-m-d H:i:s"),"$hijo",$_SERVER['REMOTE_ADDR']);
		$st=$this->db->prepare("INSERT INTO rsp_noticias (Id_noticia,Id_autor,Titulo,Texto,Fecha,Hijo,ip)  VALUES (?,?,?,?,?,?,?)");
		$this->db->execute($st,$datos);
	}

    /**
    * Esta función solo se encarga de devolver el ID del usuario
    *
    * @param string $usuario El Login del usuario
    *
    * @access public
    * @return int
    */
    function getId($usuario) {
        $int=$this->db->getOne("SELECT Id_usuario FROM usuarios WHERE Login LIKE ?",$usuario);
        return $int;
    }

    /**
    * Esta función solo se encarga de devolver la contraseña del usuario
    *
    * @param int $id El Id del usuario
    *
    * @access public
    * @return string
    */
    function getPass($id) {
        $pass=$this->db->getOne("SELECT Pass FROM usuarios WHERE Id_usuario=?",$id);
        return $pass;
    }

    /**
    * Función encargada de cambiar la contraseña del usuario
    *
    * @parm string $pass La nueva contraseña, se supone que las comprobaciones se hicieron previamente a la llamada a esta función.
    *
    * @access public
    * @return NULL
    */
    function cambiaPass($pass) {
        $pass=md5($pass);
        $id=$_SESSION['id_usuario'];
        $datos=array("$pass","$id");
        $st=$this->db->prepare("UPDATE usuarios SET Pass=? WHERE Id_usuario=?");
        $this->db->execute($st,$datos);
        header("Location: ".BASE);
    }

    /**
    * Con esta función insertamos una respuesta en un hilo del foro con una consulta preparada
    *
    * @param int $id_hilo El ID del hilo del foro al que se responde
    * @param int $usuario El ID del usuario que inserta la respuesta
    * @param string $titulo El título de la respuesta
    * @param string $texto El texto de la respuesta
    * @param int $hijo TODO: Con esto sabemos si es hijo de otra respuesta o no
    *
    * @access public
    * @return NULL
    */
    function responder_hilo($id_hilo,$usuario,$titulo,$texto,$hijo=NULL) {
        $texto=str_replace("\n","<BR>",$texto);
        $datos=array("$id_hilo","$usuario","$titulo","$texto",date("Y-m-d H:i:s"),"$hijo",$_SERVER['REMOTE_ADDR']);
        $st=$this->db->prepare("INSERT INTO rsp_foro (Id_hilo,Id_autor,Titulo,Texto,Fecha,Hijo,ip) VALUES (?,?,?,?,?,?,?)");
        $this->db->execute($st,$datos);
    }

    /**
    * Con esta función creamos un nuevo hilo en el foro
    *
    * @param int $id_usuario El ID del usuario que postea
    * @param string $titulo El título del hilo
    * @param string $texto El texto del hilo
    *
    * @access public
    * @return NULL
    */
    function crear_hilo($id_usuario,$titulo,$texto) {
        $texto=str_replace("\n","<BR>",$texto);
        $datos=array("$id_usuario","$titulo","$texto",date("Y-m-d H:i:s"),$_SERVER['REMOTE_ADDR']);
        $st=$this->db->prepare("INSERT INTO foro (Id_autor,Titulo_hilo,Texto_hilo,Fecha_envio,ip) VALUES (?,?,?,?,?)");
        $this->db->execute($st,$datos);
    }


	/**
	* Con esta función crearemos una nueva noticia
	*
	* @param string $titulo El título de la noticia
	* @param string $texto El texto de introducción de la noticia
	* @param string $texto_ampliado El texto ampliado de la noticia
	* @param int $categoria El ID de la categoría
	* @param int $usuario El ID del usuario
	* @param int $portada Si vale 1 está en portada, si no, no
	*
	* @access public
	* @return NULL
	*/
    function insertar_noticia($titulo,$texto,$texto_ampliado,$categoria,$usuario,$portada=0) {
		$datos=array("$usuario","$titulo",date("Y-m-d H:i:s"),date("Y-m-d H:i:s"),"$categoria","$texto","$texto_ampliado","$portada",$_SERVER['REMOTE_ADDR']);
		$st = $this->db->prepare("INSERT INTO noticias (Id_autor,Titulo_noticia,Fecha,Fecha_subida,Categoria,Texto_noticia,Texto_ampliado,Portada,ip) VALUES (?,?,?,?,?,?,?,?,?)");
		$this->db->execute($st,$datos);
	}

    /**
    * Con esta función editamos una noticia
    *
    * @param string $titulo El título de la noticia
    * @param string $texto El texto de la noticia
    * @param string $texto_ampliado El texto ampliado de la noticia
    * @param int $categoria El ID de la categoría
    * @param int $id El ID de la noticia
    *
    * @access public
    * @return NULL
    */
    function editarNoticia($titulo,$texto,$texto_ampliado,$categoria,$id) {
        $datos=array("$titulo","$texto","$texto_ampliado","$categoria","$id");
        $st=$this->db->prepare("UPDATE noticias SET Titulo_noticia=?,Texto_noticia=?,Texto_ampliado=?,Categoria=? WHERE Id_noticia=?");
        $this->db->execute($st,$datos);
    }


    /**
    * Con esta función cambiamos los valores de un link
    *
    * @param string $nombre El nombre del link
    * @param string $href La dirección de destino
    * @param int $clicks La cantidad de clicks acumulados
    * @param int $id El ID del link
    *
    * @access public
    * @return NULL
    */
    function cambiaLink($nombre,$href,$clicks,$id) {
        $datos=array(utf8_decode($nombre),"$href","$clicks","$id");
        $st=$this->db->prepare("UPDATE links SET nombre=?, direccion=?, clicks=? WHERE id=?");
        $this->db->execute($st,$datos);
    }

    /**
    * Borrar una noticia pasada por ID
    *
    * @param int $id El ID de la noticia
    *
    * @access public
    * @return NULL
    */
    function borrar_noticia($id) {
        if ($_SESSION['acceso']==0 && !is_null($_SESSION['acceso'])) {
            $datos=array($id);
            $st=$this->db->prepare("DELETE FROM noticias WHERE Id_noticia=?");
            $this->db->execute($st,$datos);
            $st=$this->db->prepare("DELETE FROM rsp_noticias WHERE Id_noticia=?");
            $this->db->execute($st,$datos);
        } else if (!is_null($_SESSION['acceso'])){
            $datos=array($id,$_SESSION['id_usuario']);
            $st=$this->db->prepare("DELETE FROM noticias WHERE Id_noticia=? AND Id_autor=?");
            //Un poco chapucilla, pero si funciona, no lo toques ;p
            $this->db->execute($st,$datos);
            $num=$this->db->getOne('select count(id_noticia) from noticias WHERE id_noticia='.$id);
            if ($num==0) {
                $datos=array($id);
                $st=$this->db->prepare("DELETE FROM rsp_noticias WHERE Id_noticia=?");
                $this->db->execute($st,$datos);
            }
        }
    }
	
    /**
    * Subir a la portada una noticia. Para ello modificamos su atributo portada a 1 y le cambiamos su fecha_subida a la fecha_actual para que aparezca bien ordenada en la portada.
    *
    * @param int $id El ID de la noticia a subir a portada
    *
    * @access public
    * @return NULL
    */
    function portadaNoticia($id) {
        $datos=array(date("Y-m-d H:i:s"),$id);
        $st=$this->db->prepare("UPDATE noticias SET Fecha_subida=?,Portada=1 WHERE Id_noticia=? AND Id_autor<>1");
        $this->db->execute($st,$datos);
    }

    /*
    * Baja una noticia de portada. Para ello ponemos la fecha a 0 y el atributo portada también a 0.
    *
    * @param int $id EL ID de la noticia a bajar
    *
    * @access public
    * @return NULL
    */
    function desportadaNoticia($id) {
        $datos=array("0000-00-00 00:00:00",$id);
        $st=$this->db->prepare("UPDATE noticias SET Fecha_subida=?,Portada=0 WHERE Id_noticia=? AND Id_autor<>1");
        $this->db->execute($st,$datos);
    }

	
    /**
    * Crear usuarios con una consulta preparada, devuelve:
    * - -1 si el usuario existe
	* - -2 si el email es incorrecto
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
    function crear_usuario($login,$pass,$nombre,$mail) {
		if (self::validar($mail) == 0) {
			return -2;
		}

        $resultado=self::consulta("SELECT Login FROM usuarios WHERE Login LIKE '".$login."' LIMIT 0,1");
		$resultado->fetchInto($resultado,DB_FETCHMODE_ASSOC);

        if ($resultado != NULL) {
            return -1;
        } else {
			#Por defecto se crea el usuario con nivel de acceso 2 (usuario web)
			$datos=array("$login","$nombre",2,"$pass","$mail",date("Y-m-d H:i:s"),NULL);
			/*
			 *
			 * FIXME: Hay que poder añadir imagen
			 *
			 */
			$st=$this->db->prepare("INSERT INTO usuarios (Login,Nombre,Acceso,Pass,Mail,Registro,Imagen) VALUES (?,?,?,?,?,?,?)");
			$this->db->execute($st,$datos);
        }
	}

    /**
    * Nuevo link
    *
    * @param string $nombre Título para el link
    * @param string $href Dirección de destino
    *
    * @access public
    * @return NULL
    */
    function newLink($nombre,$href) {
        $datos=array("$href","$nombre");
        $st=$this->db->prepare("INSERT INTO links (direccion,nombre,clicks) VALUES (?,?,1)");
        $this->db->execute($st,$datos);
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
        $datos=array("$id");
        $st=$this->db->prepare("DELETE FROM usuarios WHERE Id_usuario=?");
        $this->db->execute($st,$datos);
    }

    /**
    * Borrar un link
    *
    * @param int $id El ID del link a borrar
    *
    * @access public
    * @return NULL
    */
    function borrarLink($id) {
        $datos=array("$id");
        $st=$this->db->prepare("DELETE FROM links WHERE id=?");
        $this->db->execute($st,$datos);
    }

    /**
    * Cambia el nivel del usuario
    *
    * @param int $id El ID del usuario a cambiar
    * @param int $nivel El nuevo nivel para el usuario
    *
    * @access public
    * @return NULL
    */
    function cambiaLevel($id,$nivel) {
        $datos=array("$nivel","$id");
        $st=$this->db->prepare("UPDATE usuarios SET Acceso=? WHERE Id_usuario=? LIMIT 1");
        $this->db->execute($st,$datos);
    }

    /**
    * Incrementa clicks del link o blog con id = al que se le pasa al array de entrada
    *
    * @param array $datos Un array para pasar a la consulta preparada. Incluy el identificador del link y los clicks incrementados.
	* @param string $tabla La tabla a incrementar
    *
    * @access public
    * @return NULL
    */

    function incrementar_clicks($datos,$tabla) {
	switch($tabla) {
		case 'usuarios':
            $st=$this->db->prepare("UPDATE usuarios SET clicks=? WHERE Id_usuario=? LIMIT 1");
		break;
		case 'links':
			$st=$this->db->prepare("UPDATE links SET clicks=? WHERE ID=? LIMIT 1");
		break;
		break;
		
		default:
			exit;
	}
            $this->db->execute($st,$datos);
    }


	/**
	* Validar una dirección de correo electrónico
	*
	* @param string $email Dirección de correo a validar
	*
	* @access private
	* @return bool
	*/
	private function validar($mail) {
		if ( ereg("^[^@ ]+@[^@ ]+.[^@ .]+$",$mail) ) {
			#correcta
			return 1;
		} else {
			#incorrrecta
			return 0;
		}

	}
}

?>
