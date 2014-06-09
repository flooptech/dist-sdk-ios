

This is the iOS version of the Floop SDK, a COPPA-compliant sharing platform for kids.

## Installation 

### with Cocoapods

In your project root, create (or edit) a Podfile with:

```

pod "Floop-iOS" # or use a specific version by adding eg: , "~> 1.9.1"

```

See http://cocoapods.org/ for more information on installing and using Cocoapods.


### Manual installation:

Please see https://four-iq.appspot.com/docs/sdk-ios/#/integrate-sdk-in-app


## Documentation 

Find the latest documentation at:
http://www.getfloop.com/documentation

## Release Notes

Find the latest documentation at:
http://www.getfloop.com/documentation


### Version 1.9.1 - 2014-06-09
- Beta: Added ability to track custom analytics events. See the trackAppEvent methods in FloopSdkManager. To enable this feature for your account, please contact support.
- Fixed intermittent crash issue with parental gate for arm64 builds.

### Version 1.9.0.1 - 2014-04-29
- Fixed duplicate symbol issue with Reachability users 

### Version 1.9.0 - 2014-04-17
- New Feature: Cross-Promotion. A button that shows a view where you can cross-promote your apps. 
This view is dynamically generated from your account settings, so you can update witout having to do a new App Store release.
For more details see the documentation.

### Version 1.8.2 - 2014-02-24
- Fix localization bug

### Version 1.8.1 - 2014-02-19
- Allow usage of parental gate without appKey (call startWithAppKey:nil)

### Version 1.8 - 2014-02-19
- Add landscape support to all the views. 
- Add some localizations (ES,DE,FR,IT) to the Parental Gate.

### Version 1.7 - 2013-12-05
- renamed startWithAppID to startWithAppKey for clarity.

### Version 1.6 - 2013-11-15
- exposed the parental gate methods

### Version 1.5 - 2013-10-03
- improved networking robustness
- fixed some iOS 7 layout issues (mostly related to status bar changes)

### Version 1.4 - 2013-09-25
- simplified api
- shareImage now invokes authentication if not logged in
- add parent gate in front of authenication, for compliance with COPPA and the App Store's Kids Section

### Version 1.3 - 2013-08-02
- Added debugging flags to help track down issues.

### Version 1.2 - 2013-07-26
- Fixed conflict between parent and developers accounts.
- Added a dark color for email title.

### Version 1.1 - 2013-07-24
- Updated communication protocol.

### Version 1.0 - 2013-07-19
- Parents set up the connection in the App.
- Kids upload their creation to the platform and parents receive an email.
- Developers can customize assets for UI and email.
- Cross promote other apps through our campaign system.

## Disclaimer: Please send us an email before publishing to the app store.


Known issues and FAQ are available here: http://getfloop.zendesk.com
