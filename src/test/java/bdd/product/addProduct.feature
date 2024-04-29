Feature: Ejemplos practicos Karate


    Background:
        * def responseLogin = call read("classpath:bdd/auth/loginAuth.feature@login2")
        * print responseLogin
        * def token = responseLogin.token
        * url urlBase
        * header Authorization = 'Bearer ' + token
        * header Accept = "application/json"

    Scenario: CASO 1 - Agregar un producto
        * def body =
        """
        {
            "codigo": "TA3",
            "nombre": "ARRANCADOR",
            "medida": "UND ",
            "marca": "Generico",
            "categoria": "Repuestos",
            "precio": "60.00",
            "stock": "60",
            "estado": "3",
            "descripcion": "ARANCADOR PL200NS"
        }
        """
        Given path "api/v1/producto"
        And request body
        When method post
        Then status 200

    Scenario: CASO 2 - Agregar un producto
        * def body =
        """
        {
            "codigo": "TA31",
            "nombre": "ARRANCADOR",
            "medida": "UND ",
            "marca": "Generico",
            "categoria": "Repuestos",
            "precio": "60.00",
            "stock": "60",
            "estado": "3",
            "descripcion": "ARANCADOR PL200NS"
        }
        """
        Given path "api/v1/producto"
        And request body
        When method post
        Then status 200
        And match response ==
        """
        {
            "codigo": '#string',
            "nombre": '#string',
            "medida": '#string',
            "marca_id":#number,
            "categoria_id":#number,
            "precio": '#string',
            "stock": '#string',
            "estado": '#string',
            "descripcion": '#string',
            "updated_at":'#string',
            "created_at":'#string',
            "id": #number
        }
         """
    Scenario Outline: CASO 3 - Agregar un productoS
        Given path "api/v1/producto"
        And request {'codigo': <codigo>,'nombre': <nombre>,'medida':<medida>,'marca':<marca>,'categoria':<categoria>,'precio': <precio>,'stock':<stock>,'estado':<estado>,'descripcion':<descripcion>}
        When method post
        * print response
        Then status 200
        And match response ==
        """
        {
            "codigo": '#string',
            "nombre": '#string',
            "medida": '#string',
            "marca_id":#number,
            "categoria_id":#number,
            "precio":#number,
            "stock":#number,
            "estado":#number,
            "descripcion": '#string',
            "updated_at":'#string',
            "created_at":'#string',
            "id": #number
        }
         """
        Examples:
            | read('product.csv') |



    Scenario: CASO 4 - Agregar otro producto
        * def body = read('classpath:resources/json/product/product.json')
        Given path "api/v1/producto"
        And request body
        When method post
        Then status 200
        And match response == read('classpath:resources/json/product/estructura-product.json')

