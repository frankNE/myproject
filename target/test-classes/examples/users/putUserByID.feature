Feature: Como un administrador del sistema Quiero poder gestionar los usuarios a través de la API Para administrar la base de datos de usuarios.

  Background:
    * url 'https://serverest.dev/'

  Scenario: Validar actualizacion exitosa de un usuario con status code 200
    * def timestamp = new Date().getTime()
    * def user = { nome: 'buscarPorId', email: '', password: 'tester', administrador: 'true' }
    * set user.email = 'buscar' + timestamp + '@qa.com'
    Given path 'usuarios'
    And request user
    When method post
    Then status 201
    * def id = response._id

    * def updated = { nome: 'actualizadoNombre', email: '', password: 'test', administrador: 'true' }
    * set updated.email = 'actualizado' + timestamp + '@qa.com'

    Given path 'usuarios', id
    And request updated
    When method put
    Then status 200

    Given path 'usuarios', id
    When method get
    Then status 200
    And match response.nome == updated.nome
    And match response.email == updated.email