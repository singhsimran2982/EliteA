Feature: Address Auto-Suggestions Toggle on Checkout

  Scenario: TC-001 Display Toggle Switch
    Given the user is on the checkout page
    When the checkout page is loaded
    Then the toggle switch should be visible and clearly labeled

  Scenario: TC-002 Disable Auto-Suggestions
    Given the user is on the checkout page and the toggle is enabled
    When the user disables the toggle
    Then no auto-suggestions are shown

  Scenario: TC-003 Enable Auto-Suggestions
    Given the user is on the checkout page and the toggle is disabled
    When the user enables the toggle
    Then auto-suggestions are shown

  Scenario: TC-004 Toggle Explanation Display
    Given the user is on the checkout page
    When the checkout page is loaded
    Then an explanation text is shown next to the toggle

  Scenario: TC-005 Persist Preference - Logged-in User
    Given the user is logged in and disables the toggle
    When the user logs out and logs in again
    Then the toggle remains disabled and the profile is updated

  Scenario: TC-006 Persist Preference - Guest User
    Given the user is not logged in and disables the toggle
    When the user refreshes the page
    Then the toggle remains disabled
    When the session expires
    Then the toggle resets to enabled

  Scenario: TC-007 Session Timeout Definition
    Given a guest user disables the toggle and the session expires
    When the session timeout occurs
    Then the toggle resets to enabled and the timeout is defined/documented

  Scenario: TC-008 Accessibility - Keyboard Navigation
    Given the user is on the checkout page
    When the user navigates using the keyboard
    Then the toggle can be focused and toggled using the keyboard

  Scenario: TC-009 Accessibility - ARIA Attributes
    Given the user is on the checkout page
    When the toggle is present
    Then the toggle is announced correctly by screen readers

  Scenario: TC-010 Accessibility - Visual & Label
    Given the user is on the checkout page
    When the toggle is present
    Then the toggle is visually clear and labeled

  Scenario: TC-011 Address Validation - Manual Entry
    Given the toggle is disabled and the user enters an address
    When the user submits the address
    Then the address is validated for postal code and city/state

  Scenario: TC-012 Address Validation - Suggestion Entry
    Given the toggle is enabled and the user selects an address suggestion
    When the user submits the address
    Then the address is validated for postal code and city/state

  Scenario: TC-013 Edge Case - Unusual Address Format
    Given the toggle is disabled and the user enters an unusual address
    When the user submits the address
    Then the address is validated for postal code and city/state

  Scenario: TC-014 Edge Case - Rapid Toggling
    Given the user is on the checkout page
    When the user rapidly toggles the switch
    Then there is no performance lag and the final toggle state is correct

  Scenario: TC-015 Logging - Disable Event
    Given the user disables the toggle
    When the toggle is disabled
    Then the event is logged

  Scenario: TC-016 Logging - Enable Event
    Given the user enables the toggle
    When the toggle is enabled
    Then the event is logged

  Scenario: TC-017 API Suppression
    Given the toggle is disabled and the user enters an address
    When the user submits the address
    Then no API calls for suggestions are made

  Scenario: TC-018 All Functionality Paths
    Given the user interacts with the toggle
    When the user enables, disables, or persists the toggle, or tests accessibility, validation, edge cases, performance, or logging