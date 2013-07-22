Feature: Create
  In order to allow users to access to manages notas
  A backend admin user
  Should be able to create new notas

  Background:
    Given I am logged in backend as admin
    And a weekly session exists
    And an area exists

    Scenario: New notas
      When I create an new nota
      Then I should see the created nota
