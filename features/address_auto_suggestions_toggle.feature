Feature: Address Auto-Suggestions Toggle on Checkout

  Scenario: TC-001 Disable Auto-Suggestions
    Given the user is on the checkout page with the "Enable Auto-Suggestions" toggle visible
    When the user disables address auto-suggestions during checkout
    Then address auto-suggestions are disabled when the toggle is turned off

  Scenario: TC-002 Enable Auto-Suggestions
    Given the user is on the checkout page with the "Enable Auto-Suggestions" toggle visible
    When the user enables address auto-suggestions during checkout
    Then address auto-suggestions are enabled when the toggle is turned on

  Scenario: TC-003 Persist Preference for Logged-In Users
    Given the user is logged in and has set their preference for auto-suggestions
    When the user returns to the checkout page
    Then the preference is saved to the user profile and remains consistent across sessions and devices

  Scenario: TC-004 Reset Preference for Guest Users
    Given the user is a guest and has set their preference for auto-suggestions
    When the session expires
    Then the preference resets to "enabled" after the session expires

  Scenario: TC-005 Address Validation with Auto-Suggestions Disabled
    Given the user has entered an address manually with auto-suggestions disabled
    When the user submits the address
    Then the address is validated for correctness (e.g., postal code, city/state combination)

  Scenario: TC-006 Accessibility of Toggle Switch
    Given the user is navigating the checkout page using a keyboard or screen reader
    When the user interacts with the toggle switch
    Then the toggle switch is fully accessible and adheres to WCAG guidelines

  Scenario: TC-007 Performance of Toggle Action
    Given the user interacts with the toggle switch
    When the user enables/disables auto-suggestions
    Then the action is performed instantly without any noticeable delay

  Scenario: TC-008 Logging Events for Toggle Action
    Given the user interacts with the toggle switch
    When the user enables/disables auto-suggestions
    Then events are logged with details about the action and source of the address

  Scenario: TC-009 Suppress API Calls When Disabled
    Given auto-suggestions are disabled
    When the user enters an address
    Then no API calls are made for address suggestions

  Scenario: TC-010 Edge Case: Rapid Toggle
    Given the user rapidly toggles the "Enable Auto-Suggestions" switch
    When the user toggles the switch multiple times
    Then the system handles the rapid toggling without errors or performance issues

  Scenario: TC-011 Edge Case: Invalid Address
    Given the user enters an invalid address manually
    When the user submits the address
    Then the system displays an appropriate error message for the invalid address

  Scenario: TC-012 Edge Case: Unusual Address
    Given the user enters an unusual but valid address manually
    When the user submits the address
    Then the system accepts the address as valid

  Scenario: TC-013 Default State of Toggle
    Given the user is on the checkout page
    When the checkout page is loaded
    Then the toggle is set to "enabled" by default

  Scenario: TC-014 UI Display of Toggle
    Given the user is on the checkout page
    When the checkout page is loaded
    Then the toggle is clearly labeled and positioned near the address input fields
