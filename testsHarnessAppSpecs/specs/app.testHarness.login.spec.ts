import AboutScreen from '../screenObject/about.screen';
import EnvScreen from '../screenObject/env.screen';
import HarnessApp from '../screenObject/harness.app.screen';
import MfeDashboardScreen from '../screenObject/mfedashboard.screen';
import WebviewScreen from '../screenObject/WebviewScreen';

/**
 * TESTHARNESS_APP!
 * This spec includes all the test required to test the test harness app
 */
describe('WebdriverIO and Appium, interactions with testHarnessApp,', () => {
    beforeEach(() => {
        driver.pause(2000);
        AboutScreen.waitForIsShown();
        AboutScreen.aboutScreenButton.click();
        EnvScreen.waitForIsShown();
        // Set the given envrionment
        // EnvScreen.envSelection('PIT:C');
        // Focus OUT
        EnvScreen.envSubmitButton.click();
        MfeDashboardScreen.waitForIsShown();
        MfeDashboardScreen.testHarnessApp.click();
        // This is where a lot of magic is happening
        // - it waits for the webview context to be loaded
        // - it will then switch to the webview and check if the website is
        //   fully loaded
        // - it will then return back to the native context
        // WebviewScreen.waitForWebsiteLoaded();
        console.log('Current Context exist in test apps are: ' + WebviewScreen.getCurrentContexts());
        driver.pause(3000);
        // driver.switchContext(CONTEXT_REF.WEBVIEW);
        // WebviewScreen.switchToContext(CONTEXT_REF.WEBVIEW);
    });

    it('should be able to open the testHarnessApp', () => {
        HarnessApp.waitForIsShown();
        console.log('Lohani ' + HarnessApp.harnessAppText.getText());
        // Hi I Am fake MicroAPP
        expect(HarnessApp.harnessAppText.getText()).toEqual('Hi I Am fake MicroAPP');
    });
});
