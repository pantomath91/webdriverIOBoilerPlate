import AboutScreen from '../screenObject/about.screen';
import EnvScreen from '../screenObject/env.screen';
import MfeDashboardScreen from '../screenObject/mfedashboard.screen';

/**
 * TESTHARNESS_APP!
 * This spec includes all the test required to test the test harness app
 */
describe('WebdriverIO and Appium, interactions with testHarnessApp,', () => {
    beforeEach(() => {
        console.log("Inside test case");
        AboutScreen.waitForIsShown(true);
        AboutScreen.aboutScreenButton.click();
        EnvScreen.waitForIsShown(true);
        EnvScreen.envSelection.click();
        EnvScreen.envSubmitButton.click();
    });

    it('should be able to open the testHarnessApp', () => {
        MfeDashboardScreen.waitForIsShown(true);
        MfeDashboardScreen.testHarnessApp.click();
        expect('Sachin').toEqual('Sachin');
    });
});
