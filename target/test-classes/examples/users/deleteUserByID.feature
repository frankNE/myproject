Feature: Como un administrador del sistema Quiero poder gestionar los usuarios a través de la API Para administrar la base de datos de usuarios.

  Background:
    * url 'https://serverest.dev/'

  Scenario: Validar eliminacion exitosa de un usuario con status code 200
    * def timestamp = new Date().getTime()
    * def user = { nome: 'buscarPorId', email: '', password: 'tester', administrador: 'true' }
    * set user.email = 'buscar1' + timestamp + '@qa.com'

    Given path 'usuarios'
    And request user
    When method post
    Then status 201
    * def id = response._id
    * print 'created id to delete =', id

    Given path 'usuarios', id
    When method delete
    Then status 200
    * print 'deleted id =', id

  # Verifica que el usuario fue eliminado
    Given path 'usuarios', id
    When method get
    Then status 400