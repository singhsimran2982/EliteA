import { test, expect } from '@playwright/test';

test('EPAM Client Work page displays correct content', async ({ page }) => {
  // Navigate to EPAM homepage
  await page.goto('https://www.epam.com/');

  // Accept cookies if the consent popup appears
  const cookieButton = page.locator('button#onetrust-accept-btn-handler');
  if (await cookieButton.isVisible()) {
    await cookieButton.click();
  }

  // Click on "Services" in the header menu
  await page.getByRole('navigation').getByRole('link', { name: 'Services' }).click();

  // Click the "Explore Our Client Work" link
  await page.getByRole('link', { name: /Explore Our Client Work/i }).click();

  // Assert that "Client Work" text is visible on the page
  await expect(page.getByText('Client Work', { exact: false })).toBeVisible();
});
