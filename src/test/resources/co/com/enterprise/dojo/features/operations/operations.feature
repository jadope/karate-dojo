Feature: Interoperabilidad Java

  Background: Set Java Class
    * def OperationClass = Java.type('co.com.enterprise.dojo.acceptancetest.Operations')
    * def operations = new OperationClass()

  Scenario: Add
    When def result = operations.add(2, 3)
    Then match result == 5

  Scenario: Substract
    When def result = operations.substraction(2, 3)
    Then match result == -1

  Scenario: Multiply
    When def result = operations.multiply(2, 3)
    Then match result == 6

  Scenario: Division
    When def result = operations.division(18, 3)
    Then match result == 6