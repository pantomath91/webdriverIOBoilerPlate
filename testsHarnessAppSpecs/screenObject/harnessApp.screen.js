import { DEFAULT_TIMEOUT } from '../constants';

export default class HarnessAppScreen {
    constructor (selector) {
        this.selector = selector;
    }

    /**
     * Wait for the login screen to be visible
     *
     * @param {boolean} isShown
     * @return {boolean}
     */
    waitForIsShown (isShown = true) {
        return $(this.selector).waitForDisplayed({
            timeout: DEFAULT_TIMEOUT,
            reverse: !isShown,
        });
    }
}