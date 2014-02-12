//
//  CPushToSegue.m
//  week3_PaulCefalu
//
//  Created by Paul Cefalu on 12/22/13.
//  Copyright (c) 2013 Paul Cefalu. All rights reserved.
//

#import "CPushToSegue.h"

@implementation CPushToSegue


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
  
  UIViewController *source  = [self sourceViewController];
  UIViewController *dest    = (UIViewController *)[self destinationViewController];
  
  [source.navigationController pushViewController:dest animated:YES];
  
  //------------------------------------------------------
}	// End of perform Method


@end
