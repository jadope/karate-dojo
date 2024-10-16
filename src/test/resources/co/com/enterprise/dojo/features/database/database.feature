Feature: Acceptance tests to delete, insert data into the DB

  Background:
    * def DbUtils = Java.type('co.com.enterprise.dojo.acceptancetest.utils.DbUtils')
    * def db = DbUtils.getInstance()

  # Escenario permite eliminar y registar data en tabla de la DB GetCardInfo
  Scenario: Insert and delete data into DB
    * def queriesInsertGetCardInfo = read('../queriesSql/insertGetCardInfo.json')
    * def queriesDelete = read('../queriesSql/queriesDelete.json')

    * def concatenateQueriesInsert = queriesInsertGetCardInfo.join(";")
    * def concatenateQueriesDelete = queriesDelete.join(";")

    * db.executeQuery(concatenateQueriesInsert)
    * db.executeQuery(concatenateQueriesDelete)
