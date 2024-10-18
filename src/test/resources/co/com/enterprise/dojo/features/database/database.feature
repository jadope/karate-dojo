@Ignore
Feature: Acceptance tests to delete, insert data into the DB

  Background:
    * def DbUtils = Java.type('co.com.enterprise.dojo.acceptancetest.utils.DbUtils')
    * def db = DbUtils.getInstance()

  # Escenario permite eliminar y registar data en tabla de la DB GetCardInfo

  @Ignore
  Scenario: Insert and delete data into DB
    * def queriesSelect = read('queriesSql/selectTopes.json')

    * def QuerySelect = queriesSelect.join(";")

    * db.readRow(QuerySelect)