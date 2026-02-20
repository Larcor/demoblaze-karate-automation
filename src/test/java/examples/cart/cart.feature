Feature: Pruebas de API para Agregar y Eliminar del Carrito en Demoblaze

  Background: Configuración inicial
    * url baseUrl
    * configure readTimeout = 15000
    * def username = randomUser()
    * def password = 'password123'
    * def cookie = 'user=' + username
    * def prodId = 1
    * def flag = true
# Escenario 1: Agregar un producto al carrito exitosamente (Add to Cart Happy Path)

  Scenario: Agregar un producto al carrito exitosamente (Add to Cart Happy Path)
    * def cartId = java.util.UUID.randomUUID().toString()
    * def addBody = read('classpath:examples/cart/data/addtocart-request.json')
    Given path 'addtocart'
    And request addBody
    When method post
    Then status 200
# Escenario 2: Eliminar el carrito exitosamente (Delete Cart Happy Path)

  Scenario: Eliminar el carrito exitosamente (Delete Cart Happy Path)
    * def cartId = java.util.UUID.randomUUID().toString()
    * def addBody = read('classpath:examples/cart/data/addtocart-request.json')
    * path 'addtocart'
    * request addBody
    * method post
    * status 200
    * eval sleep(2000)
    * def deleteBody = read('classpath:examples/cart/data/deletecart-request.json')
    Given path 'deletecart'
    And request deleteBody
    When method post
    Then status 200
# Escenario 3: Flujo completo - Registrar usuario, agregar al carrito y eliminar (E2E)

  Scenario: Flujo completo - Registrar usuario, agregar al carrito y eliminar (E2E)
    # Paso 1: Registrar un nuevo usuario
    * def authBody = read('classpath:examples/users/data/auth-request.json')
    * path 'signup'
    * request authBody
    * method post
    * status 200
    * eval sleep(2000)
    # Paso 2: Agregar un producto al carrito
    * def cartId = java.util.UUID.randomUUID().toString()
    * def addBody = read('classpath:examples/cart/data/addtocart-request.json')
    Given path 'addtocart'
    And request addBody
    When method post
    Then status 200
    * eval sleep(2000)
    # Paso 3: Eliminar el carrito
    * def deleteBody = read('classpath:examples/cart/data/deletecart-request.json')
    Given path 'deletecart'
    And request deleteBody
    When method post
    Then status 200
