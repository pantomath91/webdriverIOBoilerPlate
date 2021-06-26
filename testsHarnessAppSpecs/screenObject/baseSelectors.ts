export default class BaseSelectors {
    private selector: string;

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
            timeout: 45000,
            reverse: !isShown,
        });
    }
}
