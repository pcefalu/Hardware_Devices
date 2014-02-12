//
//  CPopFromSegue.m
//  week3_PaulCefalu
//
//  Created by Paul Cefalu on 12/22/13.
//  Copyright (c) 2013 Paul Cefalu. All rights reserved.
//

#import "CPopFromSegue.h"

@implementation CPopFromSegue


//==================================================================================
- (void)TemplateMethod
{	// Start of Code
  //------------------------------------------------------
  
  
  
  //------------------------------------------------------
}	// End of TemplateMethod Method


//==================================================================================
- (void)perform
{	// Start of Code
  //------------------------------------------------------
  
  UIViewController *sourceViewController = [self sourceViewController];
  [sourceViewController.navigationController popViewControllerAnimated:YES];
  
  //------------------------------------------------------
}	// End of perform Method



@end
