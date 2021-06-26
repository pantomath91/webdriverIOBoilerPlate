import BaseSelectors from './baseSelectors';

const SELECTORS = {
    MFEDASHBOARD_SCREEN: '~MfeDashboard-screen',
    TESTHARNESS_MFE: '~Click Me to Test MFE',
};

class MfeDashboardScreen extends BaseSelectors {
    constructor () {
        super(SELECTORS.MFEDASHBOARD_SCREEN);
    }

    get testHarnessApp () {
        return $(SELECTORS.TESTHARNESS_MFE);
    }
}

export default new MfeDashboardScreen();
