PRUEBA TÉCNICA - AUTOMATIZACIÓN DE API DEMOBLAZE

Autor: [Manuel Bobadilla]
Tecnologías: Karate DSL, Java, Gradle, Cucumber Reporting

DESCRIPCIÓN:
Proyecto de automatización de pruebas para los servicios REST de Signup y Login de Demoblaze (https://api.demoblaze.com). 
Incluye reportes visuales, manejo de datos dinámicos y estrategias de espera.

-------------------------------------------------------------------------
1. REQUISITOS PREVIOS Y CONFIGURACIÓN (IMPORTANTE)
-------------------------------------------------------------------------
Para asegurar la ejecución correcta, se debe configurar la ruta del JDK explícitamente:

1. Asegúrese de tener instalado Java JDK 11 o superior.
2. En la raíz del proyecto, ubique (o cree) el archivo 'gradle.properties'.
3. Agregue la siguiente línea indicando la ruta de instalación de su JDK:

   org.gradle.java.home=[RUTA_A_SU_JDK]

   Ejemplo Windows:
   org.gradle.java.home=C:/Program Files/Java/jdk-17

   Ejemplo Mac/Linux:
   org.gradle.java.home=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home

-------------------------------------------------------------------------
2. INSTRUCCIONES DE EJECUCIÓN
-------------------------------------------------------------------------
Abrir una terminal en la carpeta raíz del proyecto y ejecutar:

   > Windows:
     .\gradlew.bat clean test

   > Mac / Linux:
     ./gradlew clean test

NOTA: Se recomienda usar 'clean' para limpiar reportes de ejecuciones anteriores.

-------------------------------------------------------------------------
3. VISUALIZACIÓN DE REPORTES
-------------------------------------------------------------------------
El proyecto implementa "Cucumber Reporting" para generar dashboards visuales detallados.

Una vez finalizada la ejecución (BUILD SUCCESSFUL), abra el siguiente archivo en su navegador web:

   Ruta: build/cucumber-html-reports/overview-features.html

   Contenido del reporte:
   - Gráficos estadísticos (Pie Charts) de éxito/fallo.
   - Detalle paso a paso de los escenarios.
   - Metadatos de la ejecución.