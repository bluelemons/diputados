Feature: Create
  In order to allow users to access to manages areas
  A backend admin user
  Should be able to create new areas

  Background:
    Given I am logged in backend as admin

    @wip
    Scenario: New Area     
      When I create an new area
      Then I should see the created area
