Feature: Red Fin
  Red Fin allows user to perform a property search

  Scenario: User can perform a search on Red Fin for Hillsford
    Given I have opened red fin as a anonymous user
    When the user searches for "26111 Hillsford Place"
    Then red fin should have a "26111 Hillsford Place" search result
