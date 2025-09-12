Feature: Address Auto-Suggestions Toggle on Checkout

  Scenario: TC-001 Disable Auto-Suggestions
    Given the user is on the checkout page with the address input field visible
    When the user disables address auto-suggestions using the toggle switch
    Then auto-suggestions should be disabled when the toggle switch is turned off

  Scenario: TC-002 Enable Auto-Suggestions
    Given the user is on the checkout page with the address input field visible
    When the user enables address auto-suggestions using the toggle switch
    Then auto-suggestions should be enabled when the toggle switch is turned on

  Scenario: TC-003 Persist Preference for Logged-In Users
    Given the user is logged in and has set the preference
    When the user navigates across sessions and devices
    Then the auto-suggestion preference should remain the same

  Scenario: TC-004 Session-Based Preference for Guest Users
    Given the user is not logged in and has set the preference
    When the user navigates during the session
    Then the preference should persist only for the duration of the session and reset to default after session expiration

  Scenario: TC-005 Address Validation with Auto-Suggestions Disabled
    Given the user has entered an address manually
    When the user submits the address
    Then address validation should be performed successfully

  Scenario: TC-006 Address Validation with Auto-Suggestions Enabled
    Given the user has selected an address from the suggestions
    When the user submits the address
    Then address validation should be performed successfully

  Scenario: TC-007 Accessibility of Toggle Switch
    Given the user is using a keyboard or screen reader
    When the user navigates to the toggle switch
    Then the toggle switch should be fully accessible and adhere to WCAG guidelines

  Scenario: TC-008 Performance of Toggle Switch
    Given the user interacts with the toggle switch
    When the user enables/disables auto-suggestions
    Then no noticeable performance lag should be observed

  Scenario: TC-009 Logging Events for Analytics
    Given the user interacts with the toggle switch
    When the user enables/disables auto-suggestions
    Then events should be logged correctly for analytics and debugging

  Scenario: TC-010 Suppress API Calls When Suggestions Are Disabled
    Given the user has disabled auto-suggestions
    When the user navigates through the checkout process
    Then no API calls should be made for address suggestions

  Scenario: TC-011 Default State of Toggle Switch
    Given the user is on the checkout page
    When the checkout page is loaded
    Then the toggle switch should be in the enabled state by default

  Scenario: TC-012 Edge Case: Invalid Address Entry
    Given the user enters an invalid address manually
    When the user submits the invalid address
    Then appropriate error messages should be displayed

  Scenario: TC-013 Edge Case: Rapid Toggle Switching
    Given the user interacts with the toggle switch rapidly
    When the user toggles the switch on and off rapidly
    Then the system should handle rapid toggling without errors or performance issues

  Scenario: TC-014 Edge Case: Network Latency
    Given the user interacts with the toggle switch during network latency
    When the user enables/disables suggestions
    Then the system should handle latency gracefully without errors

  Scenario: TC-015 Edge Case: Session Expiry for Guest Users
    Given the guest user has set the preference and the session expires
    When the session expires
    Then the preference should reset to the default (enabled)