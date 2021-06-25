import HarnessAppScreen from './harnessApp.screen';

const SELECTORS = {
    ABOUT_SCREEN: '~Login-screen',
    ABOUT_SCREEN_CONTINUE_BUTTON: '~Continue',
};

class AboutScreen extends HarnessAppScreen {
    constructor () {
        super(SELECTORS.LOGIN_SCREEN);
    }

    get aboutScreenButton () {
        return $(SELECTORS.ABOUT_SCREEN_CONTINUE_BUTTON);
    }
}

export default new AboutScreen();
