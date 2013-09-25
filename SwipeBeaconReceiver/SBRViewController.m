//
//  SBRViewController.m
//  SwipeBeaconReceiver
//
//  Created by René Fouquet on 18.09.13.
//  Copyright (c) 2013 Swipe GmbH. All rights reserved.
//

#import "SBRViewController.h"

@interface SBRViewController ()

@end

@implementation SBRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // ! Make sure to enter the same UUID here as you have entered in the Beacon sender!
    
    _uuidString = @"AA5FAED3-13C0-4CDB-91B0-F4BFA49C84C6";
    
    _statusView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _statusView.image=[UIImage imageNamed:@"Base"];
    [self.view addSubview:_statusView];
    
    // Uncomment the following part to add a meter label to the view, which shows the current approximate distance to the beacon. Note that you also need to uncomment the _meterLabel update line in the locationManager:didRangeBeacons delegate method below.
    /*
    _meterLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-50, self.view.bounds.size.width, 20)];
    _meterLabel.text=@"Distance";
    _meterLabel.textAlignment=NSTextAlignmentCenter;
    _meterLabel.font=[UIFont systemFontOfSize:20];
    _meterLabel.textColor=[UIColor whiteColor];
    _meterLabel.backgroundColor=[UIColor blackColor];
    [self.view addSubview:_meterLabel];
    */
    
    // Init the location manager
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    
    _region = [[CLBeaconRegion alloc] initWithProximityUUID:[[NSUUID alloc] initWithUUIDString:_uuidString] identifier:@"com.swipe.beaconSender"];

    _region.notifyOnEntry = YES;
    _region.notifyOnExit = YES;
    _region.notifyEntryStateOnDisplay = YES;
    
    [_locationManager startMonitoringForRegion:_region];
    [_locationManager startRangingBeaconsInRegion:_region];
}

-(void)viewWillAppear:(BOOL)animated {
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [_locationManager stopRangingBeaconsInRegion:_region];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region {
    /*
     A user can transition in or out of a region while the application is not running.
     When this happens CoreLocation will launch the application momentarily, call this delegate method
     and we will ask the user to start the App if the user enters a region, or set the base image to the
     default value when he leaves a region.
     */
    
    if(state == CLRegionStateInside) {
        UILocalNotification *notification = [[UILocalNotification alloc] init];
        notification.alertBody = @"Welcome to Swipe. Please start the Swipe App!";
        _didEnter = NO;
        [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    } else if(state == CLRegionStateOutside) {
        _didEnter = NO;
        _statusView.image=[UIImage imageNamed:@"Base"];
    } else if (state == CLRegionStateUnknown) {
        _didEnter = NO;
        _statusView.image=[UIImage imageNamed:@"Base"];
    } else {
        _didEnter = NO;
        _statusView.image=[UIImage imageNamed:@"Base"];
    }
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    // Check if there are any beacons for the given region nearby
    
    if( [beacons count] > 0 ) {
        
        // Get the first beacon. In our demonstration we assume that only one beacon is available. Note that this part has to be changed if there is more than one beacon.
        CLBeacon *nearest = [beacons firstObject];
        
        // Change the meter label to the approximate distance to the beacon. Uncomment this if you've uncommented the meter label code in viewDidLoad
        
        // _meterLabel.text=[NSString stringWithFormat:@"%.2fm",nearest.accuracy];
        
        // If the distance to the beacon is under 1.5 meters and we didn't show the welcome screen before, change the base image to the welcome screen
        if (nearest.accuracy<1.5 && !_didEnter) {
            _didEnter = YES;
            _statusView.image=[UIImage imageNamed:@"Welcome"];
        }
    
        // If the distance to the beacon is more than 3 meters and we did show the welcome screen before, change the base image to the Bye screen
        if (nearest.accuracy>3 && _didEnter) {
            _didEnter = NO;
            _statusView.image=[UIImage imageNamed:@"Bye"];
        }
    }
}

@end
