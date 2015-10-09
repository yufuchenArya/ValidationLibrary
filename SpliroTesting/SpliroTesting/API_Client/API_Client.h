//
//  API_Client.h
//  SpliroTesting
//
//  Created by Brian Chen on 10/6/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface API_Client : AFHTTPSessionManager

+(instancetype)SharedClient;

@end
