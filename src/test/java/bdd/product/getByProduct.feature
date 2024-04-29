Feature: Listar de productos

  Background:
    * def responseLogin = call read("classpath:bdd/auth/loginAuth.feature@login2")
    * print responseLogin
    * def token = responseLogin.token
    * url urlBase
    * header Authorization = 'Bearer ' + token
    * header Accept = "application/json"

  Scenario: Listado de producto 01 Ok
    Given path "api/v1/producto/123"
    And param precio = "36.00"
    When method get
    Then status 200

  Scenario: Listado de producto Ok
    * def id = 23
    Given path "api/v1/producto/" + id
    When method get
    Then status 200
    And match response.id == id
