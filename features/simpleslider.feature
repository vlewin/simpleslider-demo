Feature: SimpleSlider basic functionality.
  Background:
    Given There is 5 post

  @javascript
  Scenario: Slide to details page and back to index
    When I visit '/'
    Then I should see 'JQuery SimpleSlider Demo'
    And I should be on the 'index' page

    When I click the first 'Show' link
    Then I should be on the 'details' page

    When I click the 'Back' link
    And I should be on the 'index' page

  @javascript
  Scenario: Access the details page directly
    When I visit '/posts/#1'
    # Then I should be on the 'details' page
    Then I should see a breadcrumb
    And I should see 'Title 1'
    And I should see 'Back' link
    And I should not see 'Index page'

  @javascript
  Scenario: Stay on the page after browser reload
    When I visit '/posts/#1'
    Then I should be on the 'details' page

    Then I reload the page
    # And I should be on the 'details' page
    Then I should see a breadcrumb
    And I should see 'Title 1'
    And I should see 'Back' link
    And I should not see 'Index page'

  @javascript
  Scenario: Navigate with browser forward/back buttons
    When I visit '/'
    Then I click the first 'Show' link
    And I should be on the 'details' page

    Then I click the 'Back' link
    And I should be on the 'index' page

    Then I click browser back button
    And I should be on the 'details' page

    Then I click browser forward button
    And I should be on the 'index' page

