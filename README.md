BeaconReceiver
==============
This app is part of an iBeacon demonstration of Swipe.
The other part consists of the Sender app, also available in the Swipe Github account.

Usage
====
For this demonstration to work you'll need two iOS 7 devices that support Bluetooth 4.0: iPhone 4S and later, iPad 3 and later, iPod touch 5th gen and later.

* Download both the Receiver (this repo) and [Sender](https://github.com/swipestudio/BeaconSender) apps

* Use ´uuidgen´ in OS X Terminal to create a unique UUID

* Change the variable _uuidString in each app's view controller (there is just one) to the UUID you've created

* Install each app on its own iOS device

* Start the sender app and toggle the activate switch. Keep the other device (the receiver) at a reasonable distance from the sender device, or you'll see the welcome screen immediatly 

* Have fun with beacons

You can also uncomment the UILabel _meterLabel in the SBRViewController, which will then display the approximate distance to the beacon. The label is not shown by default.

How it works
=========
The sender advertises a CLBeaconRegion with the specified UUID. If the device running the receiver app enters the region matching this UUID (and the app is not in the foreground) it will show a notification to the user, asking them to bring the app to the foreground. When in the foreground, the app constantly checks the distance to the first beacon in the region, and displays an appropriate image if a certain distance is reached (1.5 meters and 3 meters, respectively).

License
=====
Copyright (c) 2013 Swipe GmbH

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.