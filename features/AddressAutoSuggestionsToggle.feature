Feature: Address Auto-Suggestions Toggle on Checkout

  Scenario: TC-001 Disable Auto-Suggestions (Main Flow)
    Given the user is on the checkout page and auto-suggestions are enabled by default
    When the customer disables address auto-suggestions during checkout
    Then auto-suggestions should be disabled and the user can manually enter address without interruptions

  Scenario: TC-002 Enable Auto-Suggestions
    Given the user is on the checkout page and auto-suggestions are currently disabled
    When the customer re-enables address auto-suggestions
    Then auto-suggestions should be enabled and suggestions should appear as the user types address

  Scenario: TC-003 Persistence for Logged-in Users
    Given the user is logged in and the preference is set to disabled
    When the user logs out, logs in again, or uses a different device
    Then the preference should remain disabled across sessions and devices

  Scenario: TC-004 Persistence for Guest Users
    Given the user is not logged in and the preference is set to disabled
    When the session continues or expires, or a new session starts
    Then the preference should remain disabled during the session and reset to enabled after session expiry or new session

  Scenario: TC-005 Accessibility of Toggle Switch
    Given the user is on the checkout page
    When the user interacts with the toggle switch using keyboard or screen reader
    Then the toggle switch should be focusable and togglable via keyboard, announced by screen readers, and have correct ARIA attributes

  Scenario: TC-006 Address Validation Always Active
    Given the user enters an address with auto-suggestions enabled or disabled
    When the address is submitted
    Then invalid addresses should be flagged and validation should work in both states

  Scenario: TC-007 Performance of Toggle Action
    Given the user is on the checkout page
    When the user toggles auto-suggestions
    Then the toggle action should be instant and no performance lag should be observed

  Scenario: TC-008 Logging of Toggle Events
    Given the user toggles auto-suggestions or enters an address
    When the toggle state changes or address is entered
    Then relevant events should be logged including toggle state and address source (manual or suggestion)

  Scenario: TC-009 API Suppression When Disabled
    Given auto-suggestions are disabled and address input is in progress
    When the user types in the address field
    Then no API calls for suggestions should be made and network traffic should confirm suppression

  Scenario: TC-010 Edge Case: Toggle Rapidly
    Given the user is on the checkout page
    When the user rapidly toggles the auto-suggestion switch multiple times
    Then the system should remain stable, the final toggle state should be correctly applied, and no errors should occur

  Scenario: TC-011 Edge Case: Unusual Address Entry
    Given auto-suggestions are disabled and the user enters an unusual address
    When the address is entered manually
    Then the address should be entered without interruption and validation should still apply

  Scenario: TC-012 Edge Case: Session Expiry for Guest
    Given a guest user disables auto-suggestions and the session expires
    When a new session starts
    Then the preference should reset to enabled

  Scenario: TC-013 UI Default State
    Given the user navigates to the checkout page
    When the checkout page loads
    Then the toggle switch should be set to enabled and auto-suggestions should be active

  Scenario: TC-014 Edge Case: Browser Compatibility
    Given the user accesses the checkout page via different browsers
    When the user interacts with the toggle and suggestions
    Then the feature should work consistently across Chrome, Firefox, Safari, and Edge

  Scenario: TC-015 Edge Case: Mobile Accessibility
    Given the user accesses the checkout page via a mobile device
    When the user interacts with the toggle and suggestions
    Then the toggle should be accessible and functional, and suggestions should behave as expected
