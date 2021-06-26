import BaseSelectors from './baseSelectors';

const SELECTORS = {
    ENV_SCREEN: '~Env-screen',
    ENV_DROPDOWN_SELECTION: '~Environment',
    ENV_SUBMIT_BUTTON: '~SUBMIT'
};

class EnvScreen extends BaseSelectors {
    constructor() {
        super(SELECTORS.ENV_SCREEN);
    }

    async envSelection (env: string) {
        const selectionEnv = $(SELECTORS.ENV_DROPDOWN_SELECTION);
        console.log('SACHIN' + (await selectionEnv).selectByAttribute('value', env));
    }

    get envSubmitButton() {
        return $(SELECTORS.ENV_SUBMIT_BUTTON);
    }
}

export default new EnvScreen();
