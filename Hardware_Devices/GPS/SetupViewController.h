//
//  SetupViewController.h
//  Hardware_Devices
//
//  Created by Paul Cefalu on 2/10/14.
//  Copyright (c) 2014 Paul Cefalu. All rights reserved.
//

#import <UIKit/UIKit.h>

// Keys for the dictionary provided to the delegate.
extern NSString * const kSetupInfoKeyAccuracy;
extern NSString * const kSetupInfoKeyDistanceFilter;
extern NSString * const kSetupInfoKeyTimeout;

@class SetupViewController;

#define INT_SETUP_VIEW_CELL_ROW_HEIGHT                                  51

#define INT_SETUP_VIEW_CELL_DEFAULT_DISTANCE_FILTER                    100
#define INT_SETUP_VIEW_CELL_DEFAULT_TIMEOUT_SECONDS                     30
#define INT_SETUP_VIEW_CELL_DEFAULT_ACCURACY_ID                          2

#define DBL_SETUP_VIEW_CELL_DEFAULT_LOCATION_ACCURACY                  kCLLocationAccuracyHundredMeters


//============================================================================
@protocol SetupViewControllerDelegate <NSObject>

@optional

- (void)setupViewController:(SetupViewController *)controller didFinishSetupWithInfo:(NSDictionary *)setupInfo;

@end


//============================================================================
@interface SetupViewController : UIViewController
< UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, UIActionSheetDelegate >
{
  //  id <SetupViewControllerDelegate> delegate;
  id                        poDelegate;
  NSMutableDictionary      *setupInfo;
  NSArray                  *accuracyOptions;
  BOOL                      configureForTracking;
  
  UITableView              *accuracyPicker;
  UISlider                 *slider;
  
  UILabel                  *lblSelectedAccuracy;
  UILabel                  *lblSelectedTimeout;
  
  NSInteger                 intSelectedAccuracyID;
}

@property (nonatomic, strong) id                          poDelegate;
@property (nonatomic, strong) NSMutableDictionary        *setupInfo;
@property (nonatomic, strong) NSArray                    *accuracyOptions;
@property (nonatomic)         NSInteger                   intSelectedAccuracyID;
@property (nonatomic)         BOOL                        configureForTracking;

@property (nonatomic, strong) IBOutlet UITableView       *accuracyPicker;
@property (nonatomic, strong) IBOutlet UISlider          *slider;
@property (nonatomic, strong) IBOutlet UILabel           *lblSelectedAccuracy;
@property (nonatomic, strong) IBOutlet UILabel           *lblSelectedTimeout;

- (IBAction)done:(id)sender;
- (IBAction)sliderChangedValue:(id)sender;

@end
