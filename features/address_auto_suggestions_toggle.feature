Feature: Address Auto-Suggestions Toggle on Checkout

  Scenario: TC-001 Disable Auto-Suggestions
    Given the user is on the checkout page with the toggle switch visible
    When the user disables the address auto-suggestions using the toggle switch
    Then auto-suggestions should be disabled, and the user can manually enter the address without interruptions

  Scenario: TC-002 Enable Auto-Suggestions
    Given the user is on the checkout page with the toggle switch visible
    When the user enables the address auto-suggestions using the toggle switch
    Then auto-suggestions should be enabled, and suggestions should appear as the user types in the address field

  Scenario: TC-003 Persist Preference for Logged-In Users
    Given the user is logged in and has set a preference for auto-suggestions
    When the user logs in again
    Then the auto-suggestion preference should persist across sessions and devices

  Scenario: TC-004 Session-Based Preference for Guest Users
    Given the user is not logged in and has set a preference for auto-suggestions
    When the session expires
    Then the preference should reset to default on session expiration

  Scenario: TC-005 Address Validation with Auto-Suggestions Enabled
    Given auto-suggestions are enabled and the user enters an address
    When the user submits the address
    Then the system should validate the address for valid postal codes, city/state combinations, etc.

  Scenario: TC-006 Address Validation with Auto-Suggestions Disabled
    Given auto-suggestions are disabled and the user enters an address
    When the user submits the address
    Then the system should validate the address for valid postal codes, city/state combinations, etc.

  Scenario: TC-007 Accessibility of Toggle Switch
    Given the user is on the checkout page
    When the user navigates using keyboard or screen reader
    Then the toggle switch should be fully accessible and adhere to WCAG guidelines

  Scenario: TC-008 Performance of Toggle Switch
    Given the user is on the checkout page
    When the user enables or disables the auto-suggestions using the toggle switch
    Then the toggle switch should operate without noticeable performance lag

  Scenario: TC-009 Logging Events for Analytics
    Given the user interacts with the toggle switch
    When the user enables or disables the auto-suggestions
    Then events should be logged for analytics and debugging purposes

  Scenario: TC-010 Suppress API Calls
    Given auto-suggestions are disabled
    When the user enters an address
    Then no API calls should be made for address suggestions

  Scenario: TC-011 Edge Case: Toggle Switch Default State
    Given the user is on the checkout page for the first time
    When the page loads
    Then the toggle switch should be in the "enabled" state by default

  Scenario: TC-012 Edge Case: Invalid Address
    Given the user enters an invalid address
    When the user submits the address
    Then the system should flag the invalid address and prompt the user to correct it

  Scenario: TC-013 Edge Case: Rapid Toggle Switching
    Given the user rapidly toggles the switch multiple times
    When the user interacts with the toggle switch
    Then the system should handle rapid toggling without errors or inconsistent states

  Scenario: TC-014 Edge Case: Session Expiry for Guest Users
    Given the guest user's session expires
    When the user interacts with the toggle switch
    Then the preference should reset to the "enabled" state

  Scenario: TC-015 Edge Case: Network Latency
    Given the user interacts with the toggle switch under high network latency conditions
    When the user enables or disables the auto-suggestions
    Then the toggle switch should operate correctly without delays or errors