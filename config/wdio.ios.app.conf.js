const { join } = require('path');
const { config } = require('./wdio.shared.conf');

// ============
// Specs
// ============
config.specs = [
    './tests/specs/app.forms.spec.js',
];

// ============
// Capabilities
// ============
// For all capabilities please check
// http://appium.io/docs/en/writing-running-appium/caps/#general-capabilities
config.capabilities = [
    {
        // The defaults you need to have in your config
        platformName: 'iOS',
        // Read the reset strategies very well, they differ per platform, see
        // http://appium.io/docs/en/writing-running-appium/other/reset-strategies/
        noReset: true,
        fullReset: false,
        maxInstances: 1,
        // For W3C the appium capabilities need to have an extension prefix
        // This is `appium:` for all Appium Capabilities which can be found here
        // http://appium.io/docs/en/writing-running-appium/caps/
        deviceName: 'iPhone 11',
        showIosLog: 'true',
        platformVersion: '13.0',
        // `automationName` will be mandatory, see
        // https://github.com/appium/appium/releases/tag/v1.13.0
        automationName: 'XCUITest',
        // The path to the app
        app: join(process.cwd(), '/testHarnessApps/ios/Netspend_TestApp.app'),
        newCommandTimeout: 240,
    },
];

exports.config = config;
