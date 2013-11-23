Feature: jQuery UI sliders can be used with formtastic forms

  @javascript
  Scenario: Using a form with slider_field and slider_field_tag
    Given I visit the "new_semantic" page
    Then I should see a slider called "rating"
    And I set the slider's value to "3"
    Then I should see "Score: 3 out of 10"
    And I fill in "Title" with "Troll 2"
    And I fill in "Director" with "Drake Floyd"
    And I press "Create Film"
    Then I should see "Title: Troll 2"
    And I should see "Director: Drake Floyd"
    And I should see "Rating: 3"

  @javascript
  Scenario: Disabled sliders
    Given I visit the "new_semantic" page and disabled is set to true
    Then I should see a slider called "rating"
    And it should be disabled
