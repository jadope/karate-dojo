Feature: Rick and Morty Api Rest

  Background: Set urlBase
    * url urlBase
    * def earthLocation = read('../schemas/EarthLocation.json')
    * def locationSchema = read('../schemas/LocationSchema.json')
    * def AbadangoSchema = read('../schemas/Abadango.json')

  @API
  Scenario: GET Characters
    Given path '/api/character'
    When method GET
    Then status 200
    * match each $.results[*].id == '#number'

  Scenario: GET Location
    Given path '/api/location'
    When method GET
    Then status 200
    * match $.info == {count: "#number", pages: "#number", next: "https://rickandmortyapi.com/api/location?page=2", prev: "#null"}
    * match each $.results[*] == locationSchema

  Scenario: GET Earth Location
    Given path '/api/location/1'
    When method GET
    Then status 200
    * match response == earthLocation

  @API
  Scenario Outline: GET Earth Location
    Given path '/api/location/' + <id>
    When method GET
    Then status 200
    * match response == <responses>
    Examples:
      | id | responses      |
      | 1  | earthLocation  |
      | 2  | AbadangoSchema |