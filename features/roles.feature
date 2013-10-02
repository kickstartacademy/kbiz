Feature: Roles
  In order to flesh out who does what on a deal, team members can create roles with a title and basic job description of what's required.

  - Markdown for the job description
  - Title and job description must be present

  Scenario: Create a role
    When I create a role with a title and job description
    Then the role is created
  
  Scenario: Creating a role without the title
    When I create a role without a title
    Then I get an error
    And the role isn't created

  Scenario: Creating a role without the job description
    When I create a role without a job description
    Then I get an error
    And the role isn't created
