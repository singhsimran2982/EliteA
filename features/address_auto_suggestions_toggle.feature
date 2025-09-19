Feature: Address Auto-Suggestions Toggle on Checkout

  Scenario: TC-001 Disable Auto-Suggestions
    Given auto-suggestions are enabled by default
    When the user disables address auto-suggestions during checkout
    Then auto-suggestions are disabled, and the user can manually enter the address without interruptions

  Scenario: TC-002 Enable Auto-Suggestions
    Given auto-suggestions are disabled
    When the user enables address auto-suggestions during checkout
    Then auto-suggestions are enabled, and suggestions appear as the user types in the address field

  Scenario: TC-003 Persist Preference for Logged-in Users
    Given the user is logged in and has set a preference for auto-suggestions
    When the user performs checkout
    Then the preference (enabled/disabled) is saved and persists across sessions and devices

  Scenario: TC-004 Session-based Preference for Guest Users
    Given the user is not logged in and has set a preference for auto-suggestions
    When the user performs checkout
    Then the preference (enabled/disabled) persists for the session but resets to default after session ends

  Scenario: TC-005 Address Validation with Auto-Suggestions
    Given auto-suggestions are enabled
    When the user enters an address during checkout
    Then address validation occurs, ensuring valid postal codes and city/state combinations

  Scenario: TC-006 Address Validation without Auto-Suggestions
    Given auto-suggestions are disabled
    When the user enters an address during checkout
    Then address validation occurs, ensuring valid postal codes and city/state combinations

  Scenario: TC-007 Accessibility of Toggle Switch
    Given no preconditions
    When the user interacts with the toggle switch
    Then the toggle switch is fully accessible, adheres to WCAG guidelines, and has appropriate ARIA attributes

  Scenario: TC-008 Performance of Toggle Switch
    Given no preconditions
    When the user enables/disables suggestions
    Then no noticeable performance lag occurs when toggling the auto-suggestions feature

  Scenario: TC-009 Logging Events
    Given no preconditions
    When the user enables/disables suggestions
    Then events related to enabling/disabling suggestions are logged correctly

  Scenario: TC-010 API Suppression
    Given auto-suggestions are disabled
    When the user performs checkout
    Then no API calls are made to fetch suggestions when the feature is disabled

  Scenario: TC-011 Edge Case: Rapid Toggle
    Given no preconditions
    When the user rapidly switches the toggle on/off
    Then the system handles rapid toggling without errors or performance degradation

  Scenario: TC-012 Edge Case: Invalid Address
    Given auto-suggestions are disabled
    When the user enters an invalid address manually
    Then the system displays appropriate error messages for invalid addresses

  Scenario: TC-013 Edge Case: Unusual Address
    Given auto-suggestions are disabled
    When the user enters an unusual address manually (e.g., non-standard formats)
    Then the system allows manual entry of unusual addresses without interruptions

  Scenario: TC-014 Edge Case: Browser Compatibility
    Given no preconditions
    When the user performs checkout on different browsers
    Then the feature works as expected on all supported browsers

  Scenario: TC-015 Edge Case: Mobile Responsiveness
    Given no preconditions
    When the user performs checkout on mobile devices
    Then the feature is fully functional and responsive on mobile devices