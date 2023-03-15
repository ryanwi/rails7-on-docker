Feature: Welcome
  In order to read the page
  As a viewer
  I want to see the home page of my app

	Scenario: View welcome page
    Given I am on the home page
    Then I should see "Welcome to this site"

  @javascript
  Scenario: Greet
    Given I am on the home page
    When I type "Alberto" as name
    Then I should see "Hello, Alberto!"