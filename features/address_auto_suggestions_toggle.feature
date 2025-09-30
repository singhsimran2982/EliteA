Feature: Address Auto-Suggestions Toggle on Checkout

  Scenario: TC-001 Disable Auto-Suggestions
    Given the user is on the checkout page with the "Enable Auto-Suggestions" toggle visible
    When the user disables address auto-suggestions using the toggle switch
    Then auto-suggestions should be disabled

  Scenario: TC-002 Enable Auto-Suggestions
    Given the user is on the checkout page with the "Enable Auto-Suggestions" toggle visible
    When the user enables address auto-suggestions using the toggle switch
    Then auto-suggestions should be enabled

  Scenario: TC-003 Persist Preference for Logged-In Users
    Given the user is logged in and has set their preference
    When the user logs in on another device or session
    Then the auto-suggestion preference should persist across sessions and devices

  Scenario: TC-004 Session-Based Preference for Guest Users
    Given the user is not logged in and has set their preference
    When the session expires
    Then the auto-suggestion preference should reset to the default (enabled)

  Scenario: TC-005 Address Validation with Auto-Suggestions Disabled
    Given the user has entered an address manually with auto-suggestions disabled
    When the user submits the address
    Then the address should be validated for correctness (e.g., postal code, city/state)

  Scenario: TC-006 Address Validation with Auto-Suggestions Enabled
    Given the user has selected an address from the suggestions
    When the user submits the address
    Then the address should be validated for correctness (e.g., postal code, city/state)

  Scenario: TC-007 Accessibility of Toggle Switch
    Given the user is using a keyboard or screen reader to navigate the page
    When the user interacts with the toggle switch
    Then the toggle switch should be fully accessible and adhere to WCAG guidelines

  Scenario: TC-008 Performance of Toggle Switch
    Given the user is interacting with the toggle switch
    When the user enables or disables auto-suggestions
    Then the toggle switch should operate without noticeable performance lag

  Scenario: TC-009 Logging of Events
    Given the user interacts with the toggle switch
    When the user enables or disables auto-suggestions
    Then events related to enabling/disabling the feature should be logged for analytics and debugging purposes

  Scenario: TC-010 Suppression of API Calls
    Given the user has disabled auto-suggestions
    When the user interacts with the address field
    Then no API calls should be made for address suggestions

  Scenario: TC-011 Default State of Toggle Switch
    Given the user is on the checkout page
    When the page is loaded
    Then the toggle switch should be in the enabled state by default

  Scenario: TC-012 Edge Case: Rapid Toggle
    Given the user rapidly toggles the switch multiple times
    When the user interacts with the toggle switch
    Then the system should handle the rapid toggling without errors or performance issues

  Scenario: TC-013 Edge Case: Invalid Address
    Given the user enters an invalid address manually
    When the user submits the address
    Then the system should display an appropriate error message

  Scenario: TC-014 Edge Case: Unusual Address
    Given the user enters an unusual address manually
    When the user submits the address
    Then the system should accept the address if it passes validation

  Scenario: TC-015 Edge Case: API Failure
    Given the API for address suggestions is unavailable
    When the user interacts with the address field
    Then the system should allow manual address entry without errors