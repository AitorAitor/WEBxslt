<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<!-- 
Módulo: LMSGI
UD: 04
Fecha: 08/03/2024
Autor: Aitor Gaillard 
Tarea: TE 02
Enunciado: El objetivo de esta tarea es utilizar el lenguaje XPath y el estandar XSLT para transformar un sitio web de manera que obtenga los datos visualizados de un documento XML.
Enlace autoevaluación: https://youtu.be/JUpgu_WBnSA
 -->
<xsl:output method="html" doctype-system="about:legacy-compat" encoding="utf-8"/>

<xsl:template match="/club_voleibol">
    <html lang="es">
        <head>
            <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
            <meta charset="utf-8"/>
            <meta name="description" content="Página principal" />
            <title>titulo de la web</title>
        </head>

        <body>
            <header>
                <img src= "../img/logotipo.png" alt= "Reservas" />
                <a href="tienda.xml">Tienda</a>
                <a href="equipos.xml">Equipos</a>
                <a href="partidos.xml">Partidos</a>
            </header>
            
            <!-- En este caso no hacemos uso de la plantilla, trabajamos con todos los datos en el mismo sitio. Si cambia el nombre del entrenador cambiarán los datos que muestra.
            Se visualizará el nombre del entrenador, el nombre del equipo y los jugadores y jugadoras titulares con su número de camiseta.
            Al pulsar sobre el nombre del entrenador se abrirá un la página con su biografía. La URL también se obtendrá del XML
            Se deberá guardar el nombre del entrenador en una variable. De esta manera, si se modifica su nombre el resto de datos también se modificarán de forma automática en la página. -->
            <main>
                <xsl:variable name="nombreEntrenador" select="equipo/entrenador[nombre='Julio Velasco']/nombre" />
                <h1><a href="{equipo/entrenador[nombre =$nombreEntrenador]/url}"><xsl:value-of select="$nombreEntrenador"/></a></h1>
                <article class="equipos">
                    <h4><xsl:value-of select="equipo/entrenador[nombre =$nombreEntrenador]/../nombre"/></h4>
                    <xsl:for-each select="equipo/entrenador[nombre =$nombreEntrenador]/../jugadores/jugador[@titular='si']">
                        <p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>   
                    </xsl:for-each>
                </article>
            </main>

            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>
</xsl:template>
</xsl:stylesheet>