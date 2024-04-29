Feature: Actualizar

  Background:
    * def responseLogin = call read("classpath:bdd/auth/loginAuth.feature@login2")
    * print responseLogin
    * def token = responseLogin.token
    * url urlBase
    * header Authorization = 'Bearer ' + token
    * header Accept = "application/json"

  Scenario: Actualizar producto
    * def body = read('classpath:resources/json/product/updateProduct.json')
    Given path "api/v1/producto/123"
    And request body
    When method put
    Then status 200


  Scenario: Actualizar producto2
    * def body = read('classpath:resources/json/product/updateProduct.json')
    Given path "api/v1/producto/111"
    And request body
    When method put
    Then status 200
