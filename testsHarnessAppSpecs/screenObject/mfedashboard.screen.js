import HarnessAppScreen from './harnessApp.screen';

const SELECTORS = {
    MFEDASHBOARD_SCREEN: '~Login-screen',
    TESTHARNESS_MFE: '~Click Me to Test MFE',
};

class MfeDashboardScreen extends HarnessAppScreen {
    constructor () {
        super(SELECTORS.LOGIN_SCREEN);
    }

    get aboutScreenButton () {
        return $(SELECTORS.ABOUT_SCREEN_CONTINUE_BUTTON);
    }

    get testHarnessApp () {
        return $(SELECTORS.TESTHARNESS_MFE);
    }
}

export default new MfeDashboardScreen();
