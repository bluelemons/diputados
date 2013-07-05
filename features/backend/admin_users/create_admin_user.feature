Feature: Create
  In order to allow users to access to protected sections of the site
  A backend admin user
  Should be able to create new users

    Scenario: New User
      Given I am logged in backend as admin
      When I go to the new admin user page
      And I submit the admin user form
      Then I should see the user created
