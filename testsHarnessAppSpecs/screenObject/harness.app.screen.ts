
import WebviewScreen from '../../tests/screenobjects/WebviewScreen';
import BaseSelectors from './baseSelectors';

const SELECTORS = {
    HARNESS_SCREEN: '~Env-screen',
    HARNESS_APP_TEXT: '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]'
};

class HarnessApp extends BaseSelectors {
    constructor() {
        super(SELECTORS.HARNESS_APP_TEXT);
    }

    get harnessAppText () {
        return $(SELECTORS.HARNESS_APP_TEXT);
    }
}

export default new HarnessApp();
