## DCProgressBar

DCProgressBar is a progress bar which mimic iOS 7 progress view but with more possible status and handy methods.

### Screenshot

![DCProgressBar](http://d.pr/i/7P3R+) 

*Open `DCProgressBarExp.xcodeproj` demo project to play with it. :smiley:*

### Design

Have a space to indicate processing status is a common pattern. While iOS 7 bring us a thinner progress view, it make me think why not make more usage of the 3 pixel space to indicate more status of the current task. So here born the project.


### Installation

Drag **DCProgressBar** folder to your Xcode project.

Ensure **QuartzCore.framework** is added to your project.

### Usage

* Include `"UIViewController+DCProgressBarExtention.h"` in your view controller.
* Now you got `- (void) dc_startLoading`, `- (void) dc_stopLoading` and `- (void) dc_setProgress: (float) progress` for free as shorthand methods without worrying about how to indicate status.

### Notice

* ARC only
* Currently iOS 7 only 
* Demo Project built with Xcode5-DP4

### Under the Hood

Take advantage of Core Animation upon `CAGradientLayer`and **Associative References** provided by Objective-C runtime.

### Plan

* Indicate more status like **success** or **failure**.
* Make it iOS 6 compatible.
* Add Podspec.

### Contributions

As a weekend hakcing project, there are a lot could be done better. 
So feel free to fork or submit an issue. :-)

### Contact

Created by [David Chang](https://twitter.com/zetachang).

### License

It's MIT Licese. See file LICENSE for more info.
