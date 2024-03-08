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
            
            <main>
                <h1>PARTIDOS</h1>
                <table>
                    <tr>
                        <th>PARTIDO</th>
                        <th>FECHA</th>
                        <th>RESULTADO</th>
                    </tr>
                    <!-- Se aplica una plantilla para que indique los datos de cada partido, al hacerlo con <tr>...</tr> funciona correctamente. -->
                    <xsl:apply-templates select="partido"/>
                </table>			
		    </main>

            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>
        </body>
    </html>
</xsl:template>
<!-- Mostrará todos los partidos que se juegan en Lima, ordenados por fecha desde el más reciente. Visualizará los equipos, la fecha y el resultado Además, si gana el visitante lo mostrará en azul. -->
<xsl:template match="partido">
    <tr>
        <td><xsl:value-of select="equipos/local"/> - <xsl:value-of select="equipos/visitante"/></td>
        <td><xsl:value-of select="fecha"/></td>
        <xsl:choose>
            <xsl:when test="equipos/local/@puntuacion &lt; equipos/visitante/@puntuacion">
                <td class="azul"><xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/></td>
            </xsl:when>

            <xsl:otherwise>
                <td><xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/></td>
            </xsl:otherwise>
        </xsl:choose>
    </tr>
</xsl:template>
</xsl:stylesheet>