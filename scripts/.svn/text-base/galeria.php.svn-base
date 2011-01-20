<?php
/**
* @package rianxosencabos
*
* @author Alexandre González <alex@rianxosencabos.com>
* @version 0.1
* @copyright GNU/GPL v2.0 or later
*/

/**
* Un clase simple que unicamente muestra:
* - imágenes del directorio
* - todos los directorios
*
* @author Alexandre González <alex@rianxosencabos.com>
* @version 0.1
* @copyright GNU/GPL v2.0 or later
*
* @package rianxosencabos
*/
class galeria {
    /**
    * Crea miniaturas si no existen
    *
    * @param string $directorio Directorio donde está la imagen
    * @param string $fichero Fichero a crear la miniatura si no existe
    *
    * @access public
    * @return int
    */
    function miniatura($directorio,$fichero) {
        // Variables que indican el archivo de la imagen y el nuevo tamano
        $filename = dirname(__FILE__)."/../galeria/$directorio/$fichero";

        if (!file_exists(dirname(__FILE__)."/../galeria/thumbs/$directorio/$fichero")) {
            list($width, $height) = getimagesize($filename);
            if ($width>$height) {
                $newwidth=150;
                $relacion=$height/$width;
                $newheight=150*$relacion;
            } else {
                $newheight=150;
                $relacion=$width/$height;
                $newwidth=150*$relacion;
            }
            $thumb = imagecreatetruecolor($newwidth, $newheight);
            //Esto es una llamada al sistema para saber el tipo de fichero
            $tipo=`file "$filename"`;;
            if (ereg("JPEG",$tipo)) {
                $source = imagecreatefromjpeg($filename);
            } elseif (ereg("PNG",$tipo)) {
                $source = imagecreatefrompng($filename);
            } elseif (ereg("GIF",$tipo)) {
                $source = imagecreatefromgif($filename);
            } else {
                return 0;
            }
            imagecopyresized($thumb, $source, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
            if (!file_exists(dirname(__FILE__)."/../galeria/thumbs/$directorio/")) {
                mkdir(dirname(__FILE__)."/../galeria/thumbs/$directorio/",0777);
            }
            imagejpeg($thumb,dirname(__FILE__)."/../galeria/thumbs/$directorio/$fichero");
            imagedestroy($source);
            imagedestroy($thumb);
            return 1;
        }
        return 0;
    }

    /**
    * Muestra todos los directorio con imágenes de ./galeria/
    *
    * @access public
    * @return NULL
    */
    function directorios() {
        global $tpl;

        if($handle=opendir(dirname(__FILE__)."/../galeria/")) {
            $tpl->newBlock("listaCarpetas");
            while($file=readdir($handle)){
                if (is_dir(dirname(__FILE__)."/../galeria/".$file) && $file != "." && $file != ".." && $file != "thumbs") {
                    $tpl->newBlock("carpeta");
                    if (file_exists(dirname(__FILE__)."/../galeria/$file/desc.txt")) {
                        $filename=dirname(__FILE__)."/../galeria/$file/desc.txt";
                        $descriptor=fopen($filename,"r");
                        $cadena=fread($descriptor,filesize($filename));
                        fclose($descriptor);
                        $tpl->assign("descripcion",$cadena);
                        $tpl->assign("fichero",$file);
                    } else {
                        $tpl->assign("fichero",$file);
                        $tpl->assign("descripcion",$file);
                    }
                    $tpl->gotoBlock("listaCarpetas");
                }
            }
            $tpl->gotoBlock("_ROOT");
        }

        closedir($handle);
    }
    
    /**
    * Muestra la galería para un solo directorio
    *
    * @param string $directorio El directorio donde están las imágenes
    *
    * @access public
    * @return NULL
    */
    function unosolo($directorio) {
        global $tpl;

        $tpl->newBlock("listaFicheros");
        if($handle=opendir(dirname(__FILE__)."/../galeria/".$directorio)) {
            while($file=readdir($handle)) {
                if (is_file(dirname(__FILE__)."/../galeria/".$directorio."/".$file) && $file != "desc.txt" && $file != "Thumbs.db") {
                    galeria::miniatura($directorio,$file);
                    $tpl->newBlock("fichero");
                    $tpl->assign("directorio",$directorio);
                    $tpl->assign("fichero",$file);
                    $tpl->gotoBlock("listaFicheros");
                }
            }
        }
        $tpl->gotoBlock("_ROOT");
     }
}

if ($_GET['s']=="galeria" && $_GET['d']) {
    if (ereg("(\.|\.\.)",$_GET['d'])) {
        exit;
    } else {
        galeria::unosolo($_GET['d']);
    }
} else {
    galeria::directorios();
}
?>
