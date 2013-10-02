Feature: Deals

  In order to track deals centrally, any team member should be able to create a new deal.

  - Needs to support Name + Tracking Identifier: they must be valid
  - Don't worry about dates for now
  - Don't worry about customer contacts yet

  Scenario: Team member adds a deal
    When I create a deal with a name and tracking identifier
    Then the deal is created

  Scenario: Team member misses out name
    When I create a deal without a name
    Then I get an error
    And the deal isn't created

  Scenario: Team member misses out tracking identifier
    When I create a deal without a tracking identifier
    Then I get an error
    And the deal isn't created
