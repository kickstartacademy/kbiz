Feature: Assigning team members to a vacancy for a deal
  In order to ensure everything gets done, team members can assign themselves and other team members to roles for a deal.

  - Assigning to a vacancy shows that person in that role.
  - Changing the assignment updates the role to show the new assignment
  - Can also clear the assignment if needed.
  - Changing the deal type removes all the assignments.

  Scenario: Assign a vacancy to a team member
    Given a deal type with a vacancy
    When I assign a team member to it
    Then the vacancy is filled

  Scenario: Change the assignment
    Given a deal type with a assigned role
    When I change the team member assigned to it
    Then the role is updated

  Scenario: Remove the assignment
    Given a deal type with a assigned role
    When I remove the team member from the role
    Then the role is vacant

  Scenario: Changing deal type removes all the assignments
    Given a deal type with a assigned role
    When I change the deal type for the deal
    Then all the roles are vacant again
