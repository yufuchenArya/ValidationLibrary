//
//  ViewController.h
//  InternetValidationTest
//
//  Created by temp on 9/22/15.
//  Copyright (c) 2015 purnima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface ViewController : UIViewController


@property Reachability * reachability, *internetReachable, *hostReachable;

-(BOOL)checkNetworkStatus;


@end

