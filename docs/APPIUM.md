# Installing Appium on a local machine

> There are several documents and instructions on the internet to install Appium on your local machine.
This is just one of the many 😕

To setup the local test environment the following needs to be installed:

- [appium-doctor](https://github.com/appium/appium-doctor) with `npm install appium-doctor -g`
- [Appium](https://github.com/appium/appium) with `npm install appium -g`
- [appium-desktop](https://github.com/appium/appium-desktop). This one needs to be downloaded from [here](https://github.com/appium/appium-desktop/releases) and pick the latest stable releases

## Setup a local machine

### Appium Doctor
appium-doctor is used to diagnose and fix common Node, iOS and Android configuration issues before starting Appium. You only run it once to check your local machine. See an example output below.

```bash
appium-doctor

info AppiumDoctor Appium Doctor v.1.4.3
info AppiumDoctor ### Diagnostic starting ###
info AppiumDoctor  ✔ The Node.js binary was found at: /Users/wswebcreation/.nvm/versions/node/v8.9.1/bin/node
info AppiumDoctor  ✔ Node version is 8.9.1
info AppiumDoctor  ✔ Xcode is installed at: /Applications/Xcode.app/Contents/Developer
info AppiumDoctor  ✔ Xcode Command Line Tools are installed.
info AppiumDoctor  ✔ DevToolsSecurity is enabled.
info AppiumDoctor  ✔ The Authorization DB is set up properly.
info AppiumDoctor  ✔ Carthage was found at: /usr/local/bin/carthage
info AppiumDoctor  ✔ HOME is set to: /Users/wswebcreation
info AppiumDoctor  ✔ ANDROID_HOME is set to: /Users/wswebcreation/Library/Android/sdk
info AppiumDoctor  ✔ JAVA_HOME is set to: /Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home
info AppiumDoctor  ✔ adb exists at: /Users/wswebcreation/Library/Android/sdk/platform-tools/adb
info AppiumDoctor  ✔ android exists at: /Users/wswebcreation/Library/Android/sdk/tools/android
info AppiumDoctor  ✔ emulator exists at: /Users/wswebcreation/Library/Android/sdk/tools/emulator
info AppiumDoctor  ✔ Bin directory of $JAVA_HOME is set
info AppiumDoctor ### Diagnostic completed, no fix needed. ###
info AppiumDoctor
info AppiumDoctor Everything looks good, bye!
info AppiumDoctor
```

When appium-doctor can, it will fix the problems for you, otherwise fix them manually. If you have some ENV issues make sure you have set them like this

```bash
export ANDROID_HOME=/Users/wswebcreation/Library/Android/sdk
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools/adb:$ANDROID_HOME/build-tools:$JAVA_HOME/bin
# This one is used for the `start.android.emulator` script
export emulator=/Users/wswebcreation/Library/Android/sdk/emulator
```

### Appium
If the npm install was successful you should be able to run this command `appium -v` and see a version like below.

```bash
➜  appium -v
1.9.0
➜
```

> Always make sure to check the Appium site if there is a new version. New Appium version are released mostly when Android/iOS release new versions.
Bugfixes can also be released. Just check the [changelog](https://github.com/appium/appium/blob/master/CHANGELOG.md) for a clear overview

## Appium desktop
Appium Desktop is an open source app which gives us the ability of the Appium automation server in a UI. It is a combination of a few Appium-related tools:

- A graphical interface for the Appium Server. You can set options, start/stop the server, see logs, etc...
- An Inspector that you can use to look at your app's elements, get basic information about them, and perform basic interactions with them. This is useful as a way to learn about Appium or as a way to learn about your app so you can write tests for it.

This tool is mainly used to view the UI-hierarchy and locate elements to be sure that all elements can be found.

See the [readme](https://github.com/appium/appium-desktop) about how to use the Appium Desktop.

When Appium Destkop is started make sure the _Automatic Server_-tab is enabled. Use the following settings for Android (also check [here](../config/wdio.android.app.conf.js))

```js
{
  "app": "/Users/sachinlohani/git/appium-boilerplate/apps/testapp.apk",
  "platformName": "Android",
  "deviceName": "config/wdio.android.app.conf.js",
  "platformVersion": "7.1.1",
  "noReset": true,
  "automationName": "UiAutomator2"
}
```

And the following settings for iOS (also check [here](../config/wdio.ios.app.conf.js))


```js
{
  "app": "/Users/sachinlohani/git/appium-boilerplate/apps/TestApp.zip",
  "platformName": "iOS",
  "deviceName": "iPhone 6",
  "platformVersion": "11.1",
  "noReset": true
}
```
