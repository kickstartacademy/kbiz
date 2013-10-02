Feature: Deals

  In order to track deals centrally, any team member should be able to create a new deal.

  - Needs to support Name, Identifier: they must be present
  - Revenue is present but optional: defaults to 'unspecified'
  - Deals are of a particular mandatory type, which copies in the Roles as Vacant Assignments
  - Don't worry about dates for now
  - Don't worry about customer contacts yet

  Scenario: Team member adds a deal
    When I create a deal with a name, tracking identifier, a revenue amount and a type
    Then the deal is created
    And the roles from the deal type are copied in as vacant assignments

  Scenario: Team member misses out name
    When I create a deal without a name
    Then I get an error
    And the deal isn't created

  Scenario: Team member misses out tracking identifier
    When I create a deal without a tracking identifier
    Then I get an error
    And the deal isn't created

  Scenario: Team member doesn't specify revenue
    When I create a deal without revenue specified
    Then the deal is created
    And the revenue shows as unspecified
