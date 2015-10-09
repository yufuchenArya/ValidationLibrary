//
//  NetworkValidationLibrary.h
//  NetworkValidationLibrary
//
//  Created by temp on 10/1/15.
//  Copyright © 2015 purnima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkValidationLibrary : NSObject

//@property Reachability * reachability, *internetReachable, *hostReachable;

-(BOOL)checkNetworkStatus:   (NSString**)message;



@end
