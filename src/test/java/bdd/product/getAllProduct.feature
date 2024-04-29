Feature: Listado de productos

  Background:
    * def responseLogin = call read("classpath:bdd/auth/loginAuth.feature@login2")
    * print responseLogin
    * def token = responseLogin.token
    * url urlBase
    * header Authorization = 'Bearer ' + token
    * header Accept = "application/json"

  Scenario: Listado de producto Ok
    Given path "api/v1/producto"
    When method get
    Then status 200