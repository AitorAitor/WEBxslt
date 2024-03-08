<?xml version="1.0" encoding="UTF-8"?>
<!-- 
Módulo: LMSGI
UD: 04
Fecha: 08/03/2024
Autor: Aitor Gaillard 
Tarea: TE 02
Enunciado: El objetivo de esta tarea es utilizar el lenguaje XPath y el estandar XSLT para transformar un sitio web de manera que obtenga los datos visualizados de un documento XML.
Enlace autoevaluación: https://youtu.be/JUpgu_WBnSA 
 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
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
            
            <main class="principal">
                <!-- Aplicamos una plantilla para la tienda -->
                <xsl:apply-templates select="tienda"/>
		    </main>

            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>
</xsl:template>
<!-- mostrará la imagen, el precio y los comentarios de todos los artículos. Además, indicará el número de comentarios que hay -->
<xsl:template match="tienda">
    <xsl:for-each select="articulo">
        <article>
            <section>
                <img class="articulo" src="../img/{@foto}"/>			
            </section>
            <section>
                <h2><xsl:value-of select="precio"/></h2>
                <h3>Comentarios: <xsl:value-of select="count(comentarios)"/></h3>
                <ul>
                    <xsl:for-each select="comentarios">
                    <li><xsl:value-of select="@fecha"/>: <xsl:value-of select="."/></li>
                    </xsl:for-each>
                </ul>
            </section>
        </article>    
    </xsl:for-each>
</xsl:template>
</xsl:stylesheet>