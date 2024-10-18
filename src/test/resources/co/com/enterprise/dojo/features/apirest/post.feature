Feature: Rick and Morty Api Rest

  Background: Set urlBase
    * url urlReqres
    * def postRequest = read('../schemas/PostRequest.json')
    * def postResponse = read('../schemas/PostResponse.json')

  Scenario: POST Morpheus - Create User
    * def create_user_request =
    """
      {
        "name": "morpheus",
        "job": "leader"
      }
    """
    Given path '/api/users'
    And request create_user_request
    When method POST
    Then status 201

    * def expectedName = create_user_request.name
    * def expectedJob = create_user_request.job

    And match response.name == expectedName
    And match $.job == expectedJob


  Scenario: POST Morpheus v2
    Given path '/api/users'
    And request postRequest
    When method POST
    Then status 201
    And match response == postResponse