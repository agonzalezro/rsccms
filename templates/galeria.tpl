<DIV ID=galeria>
    <H2>{_header}</H2>
    <!-- START BLOCK : listaCarpetas -->
    <UL ID=listaCarpetas>
        <!-- START BLOCK : carpeta -->
        <LI CLASS=carpeta><A TITLE="{descripcion}" HREF="{BASE}?s=galeria&d={fichero}">{descripcion}</A></LI>
        <!-- END BLOCK : carpeta -->
    </UL>
    <!-- END BLOCK : listaCarpetas -->

    <!-- START BLOCK : listaFicheros -->
    <UL ID=listaFicheros>
        <!-- START BLOCK : fichero -->
        <LI CLASS=fichero><A HREF="{BASE}/galeria/{directorio}/{fichero}" REL="lightbox[galeria]"><IMG BORDER=0 SRC="{BASE}/galeria/thumbs/{directorio}/{fichero}" TITLE={fichero}></A></LI>
        <!-- END BLOCK : fichero -->
    </UL>
    <!-- END BLOCK : listaFicheros -->
</DIV>
