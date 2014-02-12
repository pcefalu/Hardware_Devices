//
//  CAccuracyCellViewController.h
//  Hardware_Devices
//
//  Created by Paul Cefalu on 2/10/14.
//  Copyright (c) 2014 Paul Cefalu. All rights reserved.
//

#import <UIKit/UIKit.h>


#ifndef CSETUP_CELL_VIEW_CONTROLLER_OBJECT
#define CSETUP_CELL_VIEW_CONTROLLER_OBJECT   1


@interface CAccuracyCellViewController : UITableViewCell
{	// Declare Data Members
	//-------------------------------------------
	NSString              *m_pstrFullPathToScriptFolder;    
	NSString              *m_pstrFullPathToScriptFile;    
	
	IBOutlet UILabel      *m_plblDisplayName;
	
	//-------------------------------------------
}	// End of CAccuracyCellViewController Class.


// Declare Property Methods
//-----------------------------------------------
@property (strong, nonatomic) NSString     *m_pstrFullPathToScriptFolder;
@property (strong, nonatomic) NSString     *m_pstrFullPathToScriptFile;

@property (strong, nonatomic) UILabel      *m_plblDisplayName;

#endif  // CSETUP_CELL_VIEW_CONTROLLER_OBJECT

@end
