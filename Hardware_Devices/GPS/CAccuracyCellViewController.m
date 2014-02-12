//
//  CAccuracyCellViewController.M
//  Hardware_Devices
//
//  Created by Paul Cefalu on 2/10/14.
//  Copyright (c) 2014 Paul Cefalu. All rights reserved.
//

#import "CAccuracyCellViewController.H"


@implementation CAccuracyCellViewController

@synthesize m_pstrFullPathToScriptFolder;
@synthesize m_pstrFullPathToScriptFile;
@synthesize m_plblDisplayName;


//=========================================================================
- (void)setSelected:(BOOL)selected animated:(BOOL)animated 
{	// Configure the view for the selected state
	//--------------------------------------------
  
  [super setSelected:selected animated:animated];
  
	//--------------------------------------------
} // End of setSelected Method.


//=========================================================================
- (void)viewDidUnload 
{	// Release any retained subviews of the main view. (e.g. self.myOutlet = nil;)
	//--------------------------------------------
  
  self.m_plblDisplayName  = nil;
  
	//--------------------------------------------
} // End of viewDidUnload Method.


//=========================================================================
- (void)dealloc 
{	// Release any retained subviews of the main view. (e.g. self.myOutlet = nil;)
	//--------------------------------------------
  

	
	//--------------------------------------------
}	// End of dealloc Method.


@end
