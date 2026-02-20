PRUEBA TÉCNICA - AUTOMATIZACIÓN DE API DEMOBLAZE

Autor: [Manuel Bobadilla]
Tecnologías: Karate DSL, Java, Gradle, Cucumber Reporting

DESCRIPCIÓN:
Proyecto de automatización de pruebas para los servicios REST de Demoblaze (https://api.demoblaze.com).
Incluye reportes visuales, manejo de datos dinámicos y estrategias de espera.

Módulos de prueba:
  - Users (Signup / Login): Registro de usuarios, login exitoso y validación de errores.
  - Cart (Add to Cart / Delete Cart): Agregar productos al carrito y eliminar el carrito.

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
2. ESTRUCTURA DEL PROYECTO
-------------------------------------------------------------------------
src/test/java/
  karate-config.js                    -> Configuración global (baseUrl, helpers)
  examples/
    users/
      users.feature                   -> Escenarios de Signup y Login
      UsersRunner.java                -> Runner JUnit 5 para Users
      data/
        auth-request.json             -> Template de request para auth
    cart/
      cart.feature                    -> Escenarios de Add to Cart y Delete Cart
      CartRunner.java                 -> Runner JUnit 5 para Cart
      data/
        addtocart-request.json        -> Template de request para agregar al carrito
        deletecart-request.json       -> Template de request para eliminar carrito

-------------------------------------------------------------------------
3. ESCENARIOS DE PRUEBA
-------------------------------------------------------------------------
USERS (users.feature):
  1. Crear un nuevo usuario exitosamente (Signup Happy Path)
  2. Fallar al crear un usuario duplicado (Signup Sad Path)
  3. Login exitoso con credenciales correctas (Login Happy Path)
  4. Login fallido con contraseña incorrecta (Login Sad Path)

CART (cart.feature):
  1. Agregar un producto al carrito exitosamente (Add to Cart Happy Path)
  2. Eliminar el carrito exitosamente (Delete Cart Happy Path)
  3. Flujo completo - Registrar usuario, agregar al carrito y eliminar (E2E)

-------------------------------------------------------------------------
4. INSTRUCCIONES DE EJECUCIÓN
-------------------------------------------------------------------------
Abrir una terminal en la carpeta raíz del proyecto y ejecutar:

   > Ejecutar TODOS los tests:
     Windows:  .\gradlew.bat clean test
     Mac/Linux: ./gradlew clean test

   > Ejecutar solo el módulo USERS:
     Windows:  .\gradlew.bat test --tests examples.users.UsersRunner
     Mac/Linux: ./gradlew test --tests examples.users.UsersRunner

   > Ejecutar solo el módulo CART:
     Windows:  .\gradlew.bat test --tests examples.cart.CartRunner
     Mac/Linux: ./gradlew test --tests examples.cart.CartRunner

NOTA: Se recomienda usar 'clean' para limpiar reportes de ejecuciones anteriores.

-------------------------------------------------------------------------
5. VISUALIZACIÓN DE REPORTES
-------------------------------------------------------------------------
El proyecto implementa "Cucumber Reporting" para generar dashboards visuales detallados.

Una vez finalizada la ejecución (BUILD SUCCESSFUL), abra el siguiente archivo en su navegador web:

   Ruta: build/cucumber-html-reports/overview-features.html

   Contenido del reporte:
   - Gráficos estadísticos (Pie Charts) de éxito/fallo.
   - Detalle paso a paso de los escenarios.
   - Metadatos de la ejecución.