const { config } = require('./wdio.shared.conf');
const path = require('path');
const AndroidInfo = require('./android.info');

// ============
// Specs
// ============
config.specs = [
    // './tests/specs/app.swipe.spec.ts',
    './testsHarnessAppSpecs/specs/app.testHarness.login.spec.ts',
];

// ============
// Capabilities
// ============
// For all capabilities please check
// http://appium.io/docs/en/writing-running-appium/caps/#general-capabilities
config.capabilities = [
    {
        // The defaults you need to have in your config
        platformName: 'Android',
        // Read the reset strategies very well, they differ per platform, see
        // http://appium.io/docs/en/writing-running-appium/other/reset-strategies/
        noReset: true,
        fullReset: false,
        maxInstances: 1,
        // `automationName` will be mandatory, see
        // https://github.com/appium/appium/releases/tag/v1.13.0
        automationName: 'uiautomator2',
        // For W3C the appium capabilities need to have an extension prefix
        // http://appium.io/docs/en/writing-running-appium/caps/
        // This is `appium:` for all Appium Capabilities which can be found here
        deviceName: 'Galaxy Nexus',
        appPackage: 'com.ns.testapp.ui',
        appActivity: 'com.ns.testapp.ui.SplashActivity',
        platformVersion: '10.0',
        orientation: 'PORTRAIT',
        // The path to the app
        app: path.resolve(`./apps/${AndroidInfo.appName()}`),
        newCommandTimeout: 240,
    },
];

exports.config = config;
