Feature: Reporting earnings on a deal
  In order to see how much they're going to get, team members should be able to see a report of earnings for a particular deal.

  Scenario: Get earning report for a deal
    Given a deal worth £5000
    And "chrismdp" has a role worth 5% and one worth 10%
    Then his earning report for that deal should show his earnings as £750
