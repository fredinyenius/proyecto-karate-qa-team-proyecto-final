Feature: Funcionalidad de Login

  Background:
    * url urlBase

  @login
  Scenario:  Caso 01 - Ok
    Given path "api/login"
    And request { email: "carlosz@gmail.com", password: "12345678"}
    When method post
    Then status 200
    And match response.access_token != null
    * def token = $.access_token

  @login2
  Scenario:  Caso 02 - Ok
    When header 'Content-Type' = 'Application/json'
    * configure connectTimeout = 120000
    * configure readTimeout = 120000
    Given path "api/login"
    And request { email:"fredy_m@gmail.com", password:"87654321"}
    When method post
    Then status 200
    And match $.access_token != null
    * def token = $.access_token

    @login3
    Scenario:  Caso 03 - Ok
      When header 'Content-Type' = 'Application/json'
      * configure connectTimeout = 120000
      * configure readTimeout = 120000
      Given path "api/login"
      And request { email:"fredy_m@gmail.com", password:"87654321"}
      When method post
      Then status 200
      And match $.access_token != null
      * def token = $.access_token
