Feature: Como un administrador del sistema Quiero poder gestionar los usuarios a través de la API Para administrar la base de datos de usuarios.

  Background:
    * url 'https://serverest.dev/'

  Scenario: Validar consulta exitosa de todos los usuarios con status code 200
    Given path 'usuarios'
    When method get
    Then status 200
    * print 'resultado =', response
    * match response.quantidade == '#number'
    * match response.usuarios == '#[]'
    * match each response.usuarios ==
    """
  {
  nome: '#string',
  email: '#string',
  password: '#string',
  administrador: '#string',
  _id: '#string'
  }
    """