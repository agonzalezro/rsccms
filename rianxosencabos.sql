-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-Debian_1ubuntu3.1-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema rianxosencabos
--

CREATE DATABASE IF NOT EXISTS rianxosencabos;
USE rianxosencabos;

--
-- Definition of table `rianxosencabos`.`categorias`
--

DROP TABLE IF EXISTS `rianxosencabos`.`categorias`;
CREATE TABLE  `rianxosencabos`.`categorias` (
  `Id_categoria` int(2) unsigned NOT NULL auto_increment,
  `Nombre` char(32) NOT NULL,
  `Imagen` binary(1) default NULL,
  PRIMARY KEY  (`Id_categoria`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rianxosencabos`.`categorias`
--

/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
LOCK TABLES `categorias` WRITE;
INSERT INTO `rianxosencabos`.`categorias` VALUES  (2,'Asociación',NULL),
 (1,'Wireless',NULL),
 (6,'Rianxo',NULL),
 (7,'Linux',NULL),
 (8,'Windows',NULL),
 (9,'GNU',NULL),
 (10,'Internet',NULL),
 (11,'Diseño',NULL),
 (12,'Televisión',NULL),
 (13,'Deportes',NULL),
 (14,'Informática',NULL),
 (15,'Apple',NULL),
 (16,'Política',NULL),
 (17,'Galiza',NULL),
 (18,'España',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;


--
-- Definition of table `rianxosencabos`.`foro`
--

DROP TABLE IF EXISTS `rianxosencabos`.`foro`;
CREATE TABLE  `rianxosencabos`.`foro` (
  `Id_hilo` int(5) unsigned NOT NULL auto_increment,
  `Id_autor` int(5) unsigned NOT NULL,
  `Titulo_hilo` char(255) default NULL,
  `Texto_hilo` text NOT NULL,
  `Fecha_envio` datetime NOT NULL,
  `ip` char(15) NOT NULL,
  PRIMARY KEY  (`Id_hilo`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rianxosencabos`.`foro`
--

/*!40000 ALTER TABLE `foro` DISABLE KEYS */;
LOCK TABLES `foro` WRITE;
INSERT INTO `rianxosencabos`.`foro` VALUES  (1,1,'hola','Esto es el texto del hilo...','2007-01-05 00:10:08',''),
 (2,1,'Probasss este Ã© unha mensaxe escrita dende a web','En un lugar de la Mancha [2], de cuyo nombre no quiero acordarme [3], no ha mucho tiempo que vivÃ­a un hidalgo de los de lanza en astillero, adarga antigua, rocÃ­n flaco y galgo corredor [4]. Una olla de algo mÃ¡s vaca que carnero, salpicÃ³n las mÃ¡s noches [5], duelos y quebrantos los sÃ¡bados [6], lantejas los viernes [7], algÃºn palomino de aÃ±adidura los domingos [8], consumÃ­an las tres partes de su hacienda [9]. El resto della concluÃ­an sayo de velarte [10], calzas de velludo para las fiestas, con sus pantuflos de lo mesmo [11], y los dÃ­as de entresemana se honraba con su vellorÃ­ de lo mÃ¡s fino [12]. TenÃ­a en su casa una ama que pasaba de los cuarenta y una sobrina que no llegaba a los veinte, y un mozo de campo y plaza que asÃ­ ensillaba el rocÃ­n como tomaba la podadera [13]. Frisaba la edad de nuestro hidalgo con los cincuenta aÃ±os [14]. Era de complexiÃ³n recia, seco de carnes, enjuto de rostro [15], gran madrugador y amigo de la caza. Quieren decir que tenÃ­a el sobrenombre de','2007-09-30 01:48:04',''),
 (3,1,'TÃ­tulo do fÃ­o','Â¡AquÃ­ o que queiras contar!','2007-10-01 03:08:00','');
INSERT INTO `rianxosencabos`.`foro` VALUES  (4,1,'FUNCIONA O DE INSERTAR?','PROBAS','2007-10-22 03:22:03',''),
 (5,1,'TÃ­tulo do fÃ­o','Esto rula','2007-11-04 22:23:16','127.0.0.1');
UNLOCK TABLES;
/*!40000 ALTER TABLE `foro` ENABLE KEYS */;


--
-- Definition of table `rianxosencabos`.`links`
--

DROP TABLE IF EXISTS `rianxosencabos`.`links`;
CREATE TABLE  `rianxosencabos`.`links` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `direccion` varchar(256) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `clicks` int(100) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rianxosencabos`.`links`
--

/*!40000 ALTER TABLE `links` DISABLE KEYS */;
LOCK TABLES `links` WRITE;
INSERT INTO `rianxosencabos`.`links` VALUES  (1,'http://www.google.es','Google',21),
 (2,'http://www.google.es','Alexandre',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `links` ENABLE KEYS */;


--
-- Definition of table `rianxosencabos`.`noticias`
--

DROP TABLE IF EXISTS `rianxosencabos`.`noticias`;
CREATE TABLE  `rianxosencabos`.`noticias` (
  `Id_noticia` int(5) unsigned NOT NULL auto_increment,
  `Id_autor` int(3) unsigned NOT NULL,
  `Titulo_noticia` char(255) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Fecha_subida` datetime NOT NULL,
  `Categoria` int(2) NOT NULL,
  `Texto_noticia` text NOT NULL,
  `Texto_ampliado` text,
  `Portada` tinyint(1) default NULL,
  `ip` char(15) NOT NULL,
  PRIMARY KEY  (`Id_noticia`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rianxosencabos`.`noticias`
--

/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
LOCK TABLES `noticias` WRITE;
INSERT INTO `rianxosencabos`.`noticias` VALUES  (43,1,'TemplatePower','2007-10-29 00:25:00','2007-10-29 00:25:00',0,'<p><img src=\\\"http://templatepower.codocad.com/images/templatepower_logo.gif\\\" border=\\\"0\\\" width=\\\"139\\\" height=\\\"42\\\" /><font face=\\\"Verdana, Arial, Helvetica, sans-serif\\\" size=\\\"2\\\">En primer lugar    es gratuito para uso personal (<a href=\\\"http://templatepower.codocad.com/manual/introduction.php?lang=es#gnu\\\">General Public License</a>)! <br />   <br />   La raz&oacute;n por la que el autor desarroll&oacute; TemplatePower fu&eacute;    porque el uso de FastTemplate no le resultaba suficientemente sencillo. Entonces    consider&oacute; que podia ser hecho de una forma mas facil, por eso llam&oacute;    a su proyecto EasyTemplate, pero ese nombre ya estaba siendo usado, por lo que    cambi&oacute; el nombre a TemplatePower.</font></p> <p><font face=\\\"Verdana, Arial, Helvetica, sans-serif\\\" size=\\\"2\\\">El resultado es    un motor de plantillas que el autor asegura que es mucho mas facil de usar que    FastTemplate (N del T. yo no he usado FastTemplate, pero TemplatePower me parece    muy facil de usar :-)) y adem&aacute;s es mucho m&aacute;s r&aacute;pido que    FastTemplate. Esas son las razones por las que debes usar TemplatePower.<br />   <br />   Si encuentras errores en el software rellena el informe que encontrar&aacute;s    <a href=\\\"http://templatepower.codocad.com/bug.php\\\">aqu&iacute;</a>. <br />   <br />   (N del T. Si encuentras errores en esta traducci&oacute;n puedes enviarmelos    a edu arroba cuervo punto as, (antiSpam)) </font></p>','<font face=\\\"Verdana, Arial, Helvetica, sans-serif\\\" size=\\\"2\\\"> TemplatePower se distribuye bajo los t&eacute;rminos de la <a href=\\\"http://www.gnu.org/copyleft/gpl.html\\\" target=\\\"_blank\\\">Licencia  p&uacute;blica GNU</a>. Si deseas vender una aplicaci&oacute;n o un sitio desarrollado  usando TemplatePower, puedes comprar un \\\'Certificado de distribuci&oacute;n\\\'.  Este certificado te permite vender un n&uacute;mero de aplicaciones (al menos  5) que usen TemplatePower. Su precio es de n&uacute;meroDe Aplicaciones x $3 USD.  <!-- end -->&nbsp; </font>       <br />       ',1,'192.168.0.1'),
 (36,17,'Redirecciona?','2007-10-28 23:33:51','2007-10-28 23:33:51',0,'Texto de la noticia','',0,'');
INSERT INTO `rianxosencabos`.`noticias` VALUES  (37,17,'222222Redireccion?','2007-10-28 23:35:14','2007-10-28 23:35:14',0,'Texto de la noticia','',0,''),
 (38,17,'Redirecciona?','2007-10-28 23:35:51','2007-10-28 23:35:51',0,'Texto de la noticia','',0,''),
 (39,17,'Si que funcionaba antes ;p','2007-10-28 23:36:33','2007-12-11 01:43:25',0,'Texto de la noticia','',1,''),
 (35,17,'De Lameiro','2007-10-28 23:33:23','2007-10-28 23:33:23',0,'Texto de la noticia','',0,''),
 (44,1,'ATI para Compiz','2007-10-29 23:41:24','2007-10-29 23:41:24',0,'<font>Fai uns d&iacute;as AMD lanzou a nova versi&oacute;n da s&uacute;a driver propietario (fglrx 8.42.3), que finalmente -e logo dunha longa espera- ten soporte para <em>AIGLX</em>. Iso basicamente significa que poder&aacute;s correr os efectos ultram&aacute;xicos de <u>Compiz Fusion</u> sen a necesidade de usar XGL entre medio. Ademais, o novo driver soporta a &uacute;ltima versi&oacute;n de X.org (7.3), e incl&uacute;e... </font><p align=\\\"center\\\"> <font><a rel=lightbox href=\\\"http://www.fayerwayer.com/up/2007/10/ati-linux.jpg\\\"><img src=\\\"http://www.fayerwayer.com/up/2007/10/ati-linux.jpg\\\" border=\\\"0\\\" height=\\\"80\\\" /></a></font>	</p>','',1,''),
 (45,1,'Probas de IP','2007-11-01 00:54:37','2007-11-01 00:54:37',0,'A ver si a garda ;)','',1,'127.0.0.1');
INSERT INTO `rianxosencabos`.`noticias` VALUES  (46,1,'TÃ­tulo da nova','2007-11-01 15:00:20','2007-11-01 15:00:21',0,'<div align=\\\"center\\\"><strike><u><em><strong>Texto de la noticia</strong></em></u></strike></div><div><div align=\\\"center\\\"><ol><li>asdasd</li><li>asdasd</li></ol></div><ul><li><div align=\\\"center\\\">asfdsafafds</div></li><li><div align=\\\"center\\\"><a href=\\\"http://alex.rianxosencabos.com\\\">asdasfaf</a> <br /></div></li></ul><div align=\\\"right\\\"><img src=\\\"http://www.universitario.com.br/noticias/logo_24.jpg\\\" border=\\\"0\\\" width=\\\"150\\\" height=\\\"79\\\" /></div></div>','',1,'127.0.0.1'),
 (47,1,'strip_tags','2007-11-01 15:21:51','2007-11-01 15:21:51',0,'<p><span><div align=\\\"center\\\"><strike><u><em><strong>Texto de la noticia</strong></em></u></strike></div><div><div align=\\\"center\\\"><ol><li>asdasd</li><li>asdasd</li></ol></div><ul><li><div align=\\\"center\\\">asfdsafafds</div></li><li><div align=\\\"center\\\"><a href=\\\"http://alex.rianxosencabos.com/\\\">asdasfaf</a> <br /></div></li></ul><div align=\\\"right\\\"><img src=\\\"http://www.universitario.com.br/noticias/logo_24.jpg\\\" border=\\\"0\\\" width=\\\"150\\\" height=\\\"79\\\" /></div></div></span></p>','',1,'127.0.0.1'),
 (48,1,'TÃ­tulo da nova','2007-11-01 16:09:03','2007-11-01 16:09:03',0,'<p>Texto de la noticia</p><p>&nbsp;</p><p>asdadfsafds&nbsp;</p>','',1,'127.0.0.1');
INSERT INTO `rianxosencabos`.`noticias` VALUES  (49,1,'Sigue rulando esto?','2007-11-04 22:37:25','2007-11-04 22:37:25',0,'MOLA','NON MOLA ;)',1,'127.0.0.1'),
 (50,2,'Alex tamÃ©n ten blog','2007-12-10 23:52:41','2007-12-29 19:07:39',0,'FIIJOOO! ;)','',1,'127.0.0.1'),
 (51,1,'htmlspecialchars','2007-12-12 00:40:34','2007-12-12 00:40:34',0,'<p>string htmlspecialchars ( string cadena [, int quote_style [, string juego_caracteres]] )Ciertos caracteres tienen significados especiales en HTML, y deben ser representados por entidades HTML si se desea preservar su significado. Esta funci&oacute;n devuelve una cadena con dichas conversiones realizadas, que por defecto son las m&aacute;s habituales para la programaci&oacute;n web. Si se requiere traducir todas las entidades HTML, se debe emplear la funci&oacute;n htmlentities().</p><p>Esta funci&oacute;n es &uacute;til para evitar que el texo introducido por el usuario contenga c&oacute;digo HTML, como ocurre en aplicaciones de foros o libros de visita. El segundo par&aacute;metro quote_style indica a la funci&oacute;n el modo en el que se tienen que tratar las comillas simples y las comillas dobles. El modo por defecto es ENT_COMPAT, que es el modo retrocompatible que solo traduce las comillas dobles y deja intactas las comillas simples. Si se indica el valor ENT_QUOTES, se traduce tanto las comillas simples como las dobles. Por &uacute;ltimo, si se indica el valor ENT_NOQUOTES, no se traducen ni las comillas simples ni las dobles.</p>','',1,'127.0.0.1'),
 (52,1,'PresentaciÃ³n da nova web de Rianxo Sen Cabos','2007-12-19 00:55:07','2007-12-19 00:55:07',0,'<p>This property accepts a comma-separated list of shadow effects to be applied to the text of the element. The shadow effects are applied in the order specified and may thus overlay each other, but they will never overlay the text itself.<br />Shadow effects do not alter the size of a box, but may extend beyond its boundaries. The stack level [p. 125] of the shadow effects is the same as for the element itself.</p><p>Each shadow effect must specify a shadow offset and may optionally specify alur radius and a shadow color.</p><p>&nbsp;</p><div><img src=\\\"../../%7Exota/rsc/%5C%22css/backup/nueva/images/logo.png%5C%22\\\" border=\\\"0\\\" /></div> <br /><p>&nbsp;A shadow offset is specified with two  values that indicate the distance from the text. The first length value specifies the horizontal distance to the right of the text. A negative horizontal length value places the shadow to the left of the text. The second length value specifies the vertical distance below the text. A negative vertical length value places the shadow above the text.</p>','',1,'127.0.0.1');
INSERT INTO `rianxosencabos`.`noticias` VALUES  (53,3,'Cousas de manolo','2008-01-02 16:12:27','2008-01-02 16:12:27',0,'Probando','',1,'127.0.0.1'),
 (54,3,'pedo','2008-01-02 16:15:08','2008-01-02 16:15:08',0,'Culo','',0,'127.0.0.1');
UNLOCK TABLES;
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;


--
-- Definition of table `rianxosencabos`.`rsp_foro`
--

DROP TABLE IF EXISTS `rianxosencabos`.`rsp_foro`;
CREATE TABLE  `rianxosencabos`.`rsp_foro` (
  `Id_rsp` int(5) unsigned NOT NULL auto_increment,
  `Id_hilo` int(5) unsigned default NULL,
  `Id_autor` int(5) unsigned NOT NULL,
  `Titulo` char(255) NOT NULL,
  `Texto` text NOT NULL,
  `Fecha` datetime NOT NULL,
  `Hijo` tinyint(1) default NULL,
  `ip` char(15) NOT NULL,
  PRIMARY KEY  (`Id_rsp`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rianxosencabos`.`rsp_foro`
--

/*!40000 ALTER TABLE `rsp_foro` DISABLE KEYS */;
LOCK TABLES `rsp_foro` WRITE;
INSERT INTO `rianxosencabos`.`rsp_foro` VALUES  (1,1,1,'Hola juan','Hola pedro','2007-02-14 01:13:27',0,''),
 (2,1,0,'Re: hola','Â¡AquÃ­ o que queiras contar!','2007-08-13 13:03:20',0,''),
 (3,1,0,'Re: hola','Â¡AquÃ­ o que queiras contar!','2007-09-30 01:41:37',0,''),
 (4,1,0,'Re: hola','PRUEBAS DE NUEVO','2007-09-30 01:41:49',0,''),
 (5,2,1,'Re: Probasss este Ã© unha mensaxe escrita dende a web','Â¡AquÃ­ o que queiras contar!\r\n\r\ne esto Ã© a segunda lÃ­nea','2007-09-30 01:52:08',0,''),
 (6,2,1,'Re: Probasss este Ã© unha mensaxe escrita dende a web','Â¡AquÃ­ o que queiras contar!\r<BR />\r<BR />Este si que leva brs ;D','2007-09-30 02:07:10',0,''),
 (7,4,1,'Re: FUNCIONA O DE INSERTAR?','&iexcl;Aqu&iacute; o que queiras contar!','2007-11-01 01:02:36',0,'127.0.0.1'),
 (8,5,1,'','caca','2007-11-04 22:23:43',0,'127.0.0.1'),
 (9,5,1,'','Probando','2007-12-20 21:29:08',0,'127.0.0.1'),
 (10,5,1,'','Por qu&eacute; carallo me tabula esto Por qu&eacute; carallo me tabula esto Por qu&eacute; carallo me tabula esto Por qu&eacute; carallo me tabula esto Por qu&eacute; carallo me tabula esto Por qu&eacute; carallo me tabula esto Por qu&eacute; carallo me tabula esto Por qu&eacute; carallo me tabula esto Por qu&eacute; carallo me tabula esto Por qu&eacute; carallo me tabula esto Por qu&eacute; carallo me tabula esto Por qu&eacute; carallo me tabula esto ','2007-12-20 21:29:32',0,'127.0.0.1');
UNLOCK TABLES;
/*!40000 ALTER TABLE `rsp_foro` ENABLE KEYS */;


--
-- Definition of table `rianxosencabos`.`rsp_noticias`
--

DROP TABLE IF EXISTS `rianxosencabos`.`rsp_noticias`;
CREATE TABLE  `rianxosencabos`.`rsp_noticias` (
  `Id_rsp` int(5) unsigned NOT NULL auto_increment,
  `Id_noticia` int(5) unsigned NOT NULL,
  `Id_autor` int(5) default NULL,
  `Titulo` char(255) NOT NULL,
  `Texto` text NOT NULL,
  `Fecha` datetime NOT NULL,
  `Hijo` tinyint(1) default NULL,
  `ip` char(15) NOT NULL,
  PRIMARY KEY  (`Id_rsp`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rianxosencabos`.`rsp_noticias`
--

/*!40000 ALTER TABLE `rsp_noticias` DISABLE KEYS */;
LOCK TABLES `rsp_noticias` WRITE;
INSERT INTO `rianxosencabos`.`rsp_noticias` VALUES  (22,14,0,'Re: Noticia de pruebas','Â¡AquÃ­ o que queiras contar!','2007-08-13 12:56:05',0,''),
 (23,16,1,'Re: Esta fue escrita por lameiro','ContestaciÃ³n a lameirete','2007-08-19 18:05:25',0,''),
 (24,3,0,'Re: Probando dende a web','Â¡AquÃ­ o que queiras contar!','2007-08-28 02:25:34',0,''),
 (25,17,20,'Re: Esta fue escrita por admin','probando, probando...','2007-08-29 21:25:45',0,''),
 (26,17,0,'Re: Esta fue escrita por admin','Â¡AquÃ­ o que queiras contar!\r\n\r\noutra historia','2007-09-04 00:11:14',0,''),
 (39,43,0,'Re: TemplatePower','&iexcl;Aqu&iacute; o que queiras contar!','2007-10-29 23:20:34',0,''),
 (38,43,0,'Re: TemplatePower','&iexcl;Aqu&iacute; o que queiras contar!','2007-10-29 23:20:26',0,''),
 (31,16,1,'Re: lameiro','Cousas da vida','2007-10-22 03:13:52',0,''),
 (32,16,1,'Re: lameiro','Cousas da vida','2007-10-22 03:20:01',0,''),
 (33,30,0,'Re: Unha noticia para subir a portada ;)','&iexcl;Aqu&iacute; o que queiras contar!','2007-10-28 17:28:02',0,''),
 (40,45,1,'Re: Probas de IP','&iexcl;Aqu&iacute; o que queiras contar!','2007-11-01 00:58:05',0,'127.0.0.1');
INSERT INTO `rianxosencabos`.`rsp_noticias` VALUES  (41,44,1,'Re: ATI para Compiz','<img src=\\\"asdfdsfsd\\\" border=\\\"0\\\" />asfdssdfsdfadfsafdsfaasdfasdfasd<u>asdfsaf</u>&nbsp;<em>asdasd</em>&nbsp;<strong>dsfasdfsdaf</strong>&nbsp;','2007-11-01 16:07:49',0,'127.0.0.1'),
 (42,48,1,'Re: TÃ­tulo da nova','&iexcl;Aqu&iacute; o que queiras contar!&nbsp;asadsfasfds&nbsp;','2007-11-01 16:10:28',0,'127.0.0.1'),
 (43,48,1,'Re: TÃ­tulo da nova','linea1linea2&nbsp;','2007-11-01 16:13:08',0,'127.0.0.1'),
 (44,48,1,'Re: TÃ­tulo da nova','linea1linea2&nbsp;','2007-11-01 16:13:28',0,'127.0.0.1'),
 (45,48,1,'Re: TÃ­tulo da nova','linea1linea2&nbsp;','2007-11-01 16:13:35',0,'127.0.0.1'),
 (46,48,1,'Re: TÃ­tulo da nova','linea1linea2&nbsp;','2007-11-01 16:13:49',0,'127.0.0.1'),
 (47,48,1,'Re: TÃ­tulo da nova','<p>linea1</p><p>linea2&nbsp;</p>','2007-11-01 16:14:21',0,'127.0.0.1'),
 (48,48,1,'Re: TÃ­tulo da nova','<p>linea1</p><p>linea2&nbsp;</p>','2007-11-01 16:16:20',0,'127.0.0.1'),
 (49,48,1,'Re: TÃ­tulo da nova','<p>linea1</p><p>linea2&nbsp;</p>','2007-11-01 16:16:47',0,'127.0.0.1');
INSERT INTO `rianxosencabos`.`rsp_noticias` VALUES  (50,48,1,'Re: TÃ­tulo da nova','<p>linea1</p><p>linea2&nbsp;</p>','2007-11-01 16:17:14',0,'127.0.0.1'),
 (51,48,0,'Re: TÃ­tulo da nova','javascript','2007-11-04 22:19:30',0,'127.0.0.1');
UNLOCK TABLES;
/*!40000 ALTER TABLE `rsp_noticias` ENABLE KEYS */;


--
-- Definition of table `rianxosencabos`.`usuarios`
--

DROP TABLE IF EXISTS `rianxosencabos`.`usuarios`;
CREATE TABLE  `rianxosencabos`.`usuarios` (
  `Id_usuario` int(5) unsigned NOT NULL auto_increment,
  `Login` varchar(16) NOT NULL,
  `Nombre` varchar(128) NOT NULL,
  `Acceso` tinyint(4) NOT NULL,
  `Pass` varchar(64) NOT NULL,
  `Mail` varchar(100) NOT NULL,
  `Registro` datetime NOT NULL,
  `Imagen` binary(1) default NULL,
  `clicks` int(100) unsigned NOT NULL,
  PRIMARY KEY  (`Id_usuario`),
  UNIQUE KEY `Login` (`Login`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rianxosencabos`.`usuarios`
--

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
LOCK TABLES `usuarios` WRITE;
INSERT INTO `rianxosencabos`.`usuarios` VALUES  (3,'manolo','manolo',0,'12cdb9b24211557ef1802bf5a875fd2c','manolo@b.c','2007-01-05 00:10:08','i',3),
 (1,'admin','admin',0,'21232f297a57a5a743894a0e4a801fc3','admin@b.c','2007-01-05 00:00:07','i',0),
 (2,'alex','alex',1,'534b44a19bf18d20b71ecc4eb77c572f','alex@b.c','2007-01-05 00:00:26','i',6),
 (22,'heitor','heitor',2,'90570aad5149d1317109d6819398fcc5','heitor@caca.pdo','2008-01-02 17:33:24',NULL,0),
 (21,'manuel','manuel',2,'96917805fd060e3766a9a1b834639d35','manuel@b.com','2008-01-02 17:31:33',NULL,0),
 (19,'xose','xose',0,'9eb7f9cc0f213e95eefcb27b7f6a4648','xose@b.c','2007-06-20 01:13:00',NULL,0),
 (17,'lameiro','JesÃºs Lameiro Ben',1,'4e3113d4e573a0bc7ad6466622cc7848','jesus.lameiro@gmail.com','2007-02-22 17:15:37',NULL,21);
UNLOCK TABLES;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
