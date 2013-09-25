//
//  SBRAppDelegate.h
//  SwipeBeaconReceiver
//
//  Created by René Fouquet on 18.09.13.
//  Copyright (c) 2013 Swipe GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface SBRAppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate> {
    CLLocationManager *_locationManager;
}

@property (strong, nonatomic) UIWindow *window;

@end
