Feature: Funcionalidad de Registro de usuario

  Background:
    * url urlBase
    * header Accept = 'application/json'
    #* header 'Content-Length' = 50

  Scenario:  Caso 01 - Ok
    Given path "api/register"
    And request {nombre: 'mila', email:"mili_z@gmail.com", password:"87654321", tipo_usuario_id: 1, "estado": 1}
    When method post
    Then status 200

  Scenario:  Caso 02 - Ok
    Given path "api/register"
    And request {nombre: "fredy",email:"fredy_m@gmail.com", password:"87654321",tipo_usuario_id: 1, "estado": 1}
    When method post
    Then status 200

  Scenario:  Caso 03 - Ok
    Given path "api/register"
    And request {nombre: "joel",email:"joel_m@gmail.com", password:"87654321",tipo_usuario_id": 1, "estado": 1}
    When method post
    Then status 200

  Scenario: Registro fallido
    Given path "api/register"
    And request {nombre: "joel",email:"joel_z@gmail.com", password:"87654321",tipo_usuario_id": 1}
    Then status 500

