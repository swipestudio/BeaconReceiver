//
//  SBRViewController.h
//  SwipeBeaconReceiver
//
//  Created by René Fouquet on 18.09.13.
//  Copyright (c) 2013 Swipe GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface SBRViewController : UIViewController <CLLocationManagerDelegate> {
    BOOL _didEnter;
    UIImageView *_statusView;
    UILabel *_meterLabel;
    NSString *_uuidString;
}

@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) CLBeaconRegion *region;

@end
