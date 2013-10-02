Feature: Deal types
  In order to simplify the process of creating deals, team members should be able to create a deal type and attach a list of roles and stakes to it.

  - Create basic deal type with a simple name
  - Attach a list of roles and either assign a stake of revenue to each role or leave it as a "wages role" with no stake.

  Scenario: Create a deal type
    When I create a deal type with a name
    Then the deal type is created

  Scenario: Add a role to the deal type with a stake
    Given I have a deal type
    When I add a role with a 5% stake
    Then the stake should be listed
    And the stake list is incomplete with 95% left to assign
    When I add a another role with a 95% stake
    Then the stake should be listed
    And the stake list is complete as the stakes now total 100%

  Scenario: Add a wages role to the deal type
    Given I have a deal type
    When I add a wages role
    Then the stake list is incomplete with 100% left to assign
