Feature: Add jQuery UI sliders to Ruby on Rails forms

  @javascript
  Scenario: Using a form with slider_field and slider_field_tag
    Given I visit the "new_film" page
    Then I should see a slider called "rating"
    And I set the slider's value to "3"
    Then I should see "Score: 3 out of 10"
    And I should see a slider called "tickets"
    And I set the slider's value to "6"
    Then I should see "Number of Tickets: 6 out of 10"
    And I fill in "Title" with "Troll 2"
    And I fill in "Director" with "Drake Floyd"
    And I press "Create Film"
    Then I should see "Film was successfully created. 6 tickets were ordered."
    Then I should see "Title: Troll 2"
    And I should see "Director: Drake Floyd"
    And I should see "Rating: 3"

  @javascript
  Scenario: Disabled sliders
    Given I visit the "new_film" page and disabled is set to true
    Then I should see a slider called "rating"
    And it should be disabled
    And I should see a slider called "tickets"
    And it should be disabled
