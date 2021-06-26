import BaseSelectors from './baseSelectors';

const SELECTORS = {
    ABOUT_SCREEN: '~About-screen',
    ABOUT_SCREEN_CONTINUE_BUTTON: '~Continue',
};

class AboutScreen extends BaseSelectors {
    constructor () {
        super(SELECTORS.ABOUT_SCREEN);
    }

    get aboutScreenButton () {
        return $(SELECTORS.ABOUT_SCREEN_CONTINUE_BUTTON);
    }
}

export default new AboutScreen();
