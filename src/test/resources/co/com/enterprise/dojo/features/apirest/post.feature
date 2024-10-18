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
    * configure headers = { 'Accept-Encoding': 'gzip, deflate, br', 'Connection':'keep-alive', 'content-Type': 'application/json'}
    Given path '/api/users'
    And request postRequest
    When method POST
    Then status 201
    And match response == postResponse

  Scenario: Parsing a date
    * def toTime =
      """
      function(s) {
    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
    var sdf = new SimpleDateFormat("dd-MM-yyyy");
    return sdf.parse(s).time

    }
    """

    * def myDate = '2023-11-22'
    * def parsedTime = toTime(myDate)
    * print 'Parsed time:', parsedTime
