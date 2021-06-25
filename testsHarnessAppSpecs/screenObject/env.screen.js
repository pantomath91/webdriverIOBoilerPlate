import HarnessAppScreen from './harnessApp.screen';

const SELECTORS = {
    ENV_SCREEN: '~Login-screen',
    ENV_DROPDOWN_SELECTION: '~Environment',
    ENV_SUBMIT_BUTTON: 'SUBMIT'
};

class EnvScreen extends HarnessAppScreen {
    constructor () {
        super(SELECTORS.ENV_SCREEN);
    }

    get envSelection () {
        return $(SELECTORS.ABOUT_SCREEN_CONTINUE_BUTTON);
    }

    get envSubmitButton () {
        return $(SELECTORS.ENV_SUBMIT_BUTTON);
    }
}

export default new EnvScreen();
