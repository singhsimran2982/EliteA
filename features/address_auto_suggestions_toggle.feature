Feature: Address Auto-Suggestions Toggle on Checkout

  Scenario: TC-001 Display Toggle Switch
    Given the user is on the checkout page
    When the checkout page is loaded
    Then the toggle switch should be visible and clearly labeled
