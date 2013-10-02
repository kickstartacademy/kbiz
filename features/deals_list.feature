Feature: Listing deals
  In order to get a sense of what's happening at KA, team members should be able to see a list of in-house and public course deals.

  Scenario: Seeing all the deals
    Given there are several deals currently active
    Then I should be able to see them in a list
    And I should see a total revenue report
