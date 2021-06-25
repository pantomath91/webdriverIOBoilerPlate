class AndroidInfo {
    static deviceName() {
        return 'Galaxy Nexus'; // pass the udid or devicename
    }

    static platFormVersion() {
        return '10.0'; // pass the platform version
    }

    static appName () {
        return 'app-debug.apk'; // pass the apk name
    }
}

module.exports = AndroidInfo;
