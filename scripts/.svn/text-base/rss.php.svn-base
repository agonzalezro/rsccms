<?php

header("Content-Type: text/xml;");
echo("<?xml version='1.0' encoding='utf-8'?>");

require_once( dirname( __FILE__ ) . "/../config.php" );

function noticia( $titulo, $id, $fecha, $login, $texto ) {
    echo "<item>\n";
    echo "\t<title><![CDATA[" . $titulo . "]]></title>\n";
    echo "\t<link><![CDATA[" . BASE . $id . "]]></link>\n";
    echo "\t<comments></comments>\n\t<lat></lat>\n\t<cpostal></cpostal>\n\t<lon></lon>\n";
    echo "\t<pubDate>" . date('D, d M Y H:i:s O', strtotime($fecha)) . "</pubDate>\n";
    echo "\t<dc:creator>" . $login . "</dc:creator>\n";
    echo "\t<category></category>\n";
    echo "\t<guid><![CDATA[" . BASE . $id . "]]></guid>\n";
    echo "\t<description><![CDATA[" . $texto . "]]></description>\n";
    echo "</item>\n\n";  
}
?>

<rss version="2.0" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/" >

<?php

    require_once( dirname( __FILE__ ) . "/libreria.php" );
    
    $bd = basededatos::GetInstance();

    if (!$_GET['u']) {
?>
        <channel> 
        <title><?=SHORT_WEBNAME?></title> 
        <link><?=BASE?></link>
        <description><?=WEBNAME?></description> 
        <generator><?=BASE?></generator>
        <language><?=LANGUAGE?></language> 
        <ttl>15</ttl>
<?php 
        $resultado = $bd->consulta( "SELECT * FROM noticias n, usuarios u WHERE n.Id_autor = u.Id_usuario AND Portada = 1 ORDER BY Fecha_subida DESC" );
    
        while ( $resultado->fetchInto( $row, DB_FETCHMODE_ASSOC ) ) {
            noticia( $row['Titulo_noticia'], $row['Id_noticia'], $row['Fecha_subida'], $row['Login'], $row['Texto_noticia'] );
       }
    } else {
?>
        <channel> 
        <title><? echo SHORT_WEBNAME . " // " . $_GET['u']; ?></title> 
        <link><?=BASE?></link>
        <description><? echo WEBNAME . " // " . $_GET['u']; ?></description> 
        <generator><?=BASE?></generator>
        <language><?=LANGUAGE?></language> 
        <ttl>15</ttl>
<?php
        $user = strip_tags( $_GET['u'] );
        $resultado = $bd->consulta( "SELECT * FROM noticias n, usuarios u WHERE n.Id_autor = u.Id_usuario AND u.Login = '" . $user . "' ORDER BY Fecha_subida DESC" );
    
        while ( $resultado->fetchInto( $row, DB_FETCHMODE_ASSOC ) ) {
            noticia( $row['Titulo_noticia'], $row['Id_noticia'], $row['Fecha_subida'], $row['Login'], $row['Texto_noticia'] );
       }
    }

?>

</channel>

</rss>
