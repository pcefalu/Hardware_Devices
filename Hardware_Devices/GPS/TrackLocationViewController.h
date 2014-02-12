//
//  TrackLocationViewController.h
//  Hardware_Devices
//
//  Created by Paul Cefalu on 2/10/14.
//  Copyright (c) 2014 Paul Cefalu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "SetupViewController.h"

@class LocationDetailViewController;


//============================================================================
@interface TrackLocationViewController : UIViewController < SetupViewControllerDelegate, CLLocationManagerDelegate,
UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, UIActionSheetDelegate >
{
    SetupViewController *setupViewController;
    UIButton *startButton;
    UILabel *descriptionLabel;
    CLLocationManager *locationManager;
    NSMutableArray *locationMeasurements;
    UITableView *tableView;
    NSDateFormatter *dateFormatter;
    NSString *stateString;
    LocationDetailViewController *locationDetailViewController;
}

@property (nonatomic, retain, readonly) SetupViewController *setupViewController;
@property (nonatomic, strong) IBOutlet UIButton *startButton;
@property (nonatomic, strong) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSMutableArray *locationMeasurements;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, retain, readonly) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) NSString *stateString;
@property (nonatomic, retain, readonly) LocationDetailViewController *locationDetailViewController;

- (IBAction)start:(id)sender;

- (void)setupViewController:(SetupViewController *)controller didFinishSetupWithInfo:(NSDictionary *)setupInfo;

- (void)stopUpdatingLocation:(NSString *)state;

@end
