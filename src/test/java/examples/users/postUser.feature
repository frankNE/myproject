Feature: Como un administrador del sistema Quiero poder gestionar los usuarios a través de la API Para administrar la base de datos de usuarios.

  Background:
    * url 'https://serverest.dev/'


  Scenario: Validar creacion exitosa de un nuevo usuario con status code 201
    * def user =
"""
    {
      "nome": "pruebaskarate1",
      "email": "correo123@qa.com.pr",
      "password": "tester",
      "administrador": "true"
    }
    """

    Given path 'usuarios'
    And request user
    When method post
    Then status 201

    * def id = response._id
    * print 'created id is: ', id

    Given path 'usuarios', id
    When method get
    Then status 200
    And match response.nome == user.nome
    And match response.email == user.email

    #