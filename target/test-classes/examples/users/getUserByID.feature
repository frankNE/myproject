Feature: Como un administrador del sistema Quiero poder gestionar los usuarios a través de la API Para administrar la base de datos de usuarios.

  Background:
    * url 'https://serverest.dev/'

  Scenario: Validar consulta de usuario por ID con status code 200
    * def timestamp = new Date().getTime()
    * def user = { nome: 'buscarPorId', email: '', password: 'tester', administrador: 'true' }
    * set user.email = 'correoid134' + timestamp + '@qa.com'

    Given path 'usuarios'
    And request user
    When method post
    Then status 201
    * def id = response._id
    * print 'created id =', id

    Given path 'usuarios', id
    When method get
    Then status 200
    And match response.nome == user.nome
    And match response.email == user.email