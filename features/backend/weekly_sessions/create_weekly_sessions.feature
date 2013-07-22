Feature: Create
  In order to allow users to access to manages weekly sessions
  A backend admin user
  Should be able to create new weekly sessions

  Background:
    Given I am logged in backend as admin
    And exits a session type

    Scenario: New weekly sessions
      When I create an new weekly session
      Then I should see the created weekly session
