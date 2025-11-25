Feature: Pruebas de API para Signup y Login en Demoblaze

  Background: Configuración inicial
    * url baseUrl
    * def username = randomUser()
    * def password = 'password123'
    * def requestBody = read('classpath:examples/users/data/auth-request.json')
# Escenario 1: Crear un nuevo usuario exitosamente (Signup Happy Path)

  Scenario: Crear un nuevo usuario exitosamente (Signup Happy Path)
    Given path 'signup'
    And request requestBody
    When method post
    Then status 200
    And match response !contains "errorMessage"
    * eval sleep(2000)
# Escenario 2: Fallar al crear un usuario duplicado (Signup Sad Path)

  Scenario: Fallar al crear un usuario duplicado (Signup Sad Path)
    * def existingUser = randomUser()
    * def username = existingUser
    * def setupBody = read('classpath:examples/users/data/auth-request.json')
    * path 'signup'
    * request setupBody
    * method post
    Given path 'signup'
    And request setupBody
    When method post
    Then status 200
    And match response contains { errorMessage: "This user already exist." }
# Escenario 3: Login exitoso con credenciales correctas (Login Happy Path)

  Scenario: Login exitoso con credenciales correctas (Login Happy Path)
    * def loginUser = randomUser()
    * def username = loginUser
    * def dynamicBody = read('classpath:examples/users/data/auth-request.json')
    * path 'signup'
    * request dynamicBody
    * method post
    * status 200
    * eval sleep(2000)
    Given path 'login'
    And request dynamicBody
    When method post
    Then status 200
    And match response contains "Auth_token"
# Escenario 4: Login fallido con contraseña incorrecta (Login Sad Path)

  Scenario: Login fallido con contraseña incorrecta (Login Sad Path)
    Given path 'login'
    And request { username: 'usuario_no_existe', password: 'wrong_password' }
    When method post
    Then status 200
    And match response contains { errorMessage: "User does not exist." }
