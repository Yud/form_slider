Feature: Add jQuery UI Slider to Rails Forms

  @javascript
  Scenario: Filling out a form_for with slider
    Given I visit the "new_film" page
    Then I should see a slider called "film_rating"
    And I set the slider value to "3"
    And I fill in "Title" with "Troll 2"
    And I fill in "Director" with "Drake Floyd"
    And I press "Create Film"
    Then I should see "Title: Troll 2"
    And I should see "Director: Drake Floyd"
    And I should see "Rating: 3"
