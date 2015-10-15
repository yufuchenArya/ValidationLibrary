//
//  AFNetworkingLibrary.h
//  AFNetworkingLibrary
//
//  Created by Brian Chen on 10/8/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"
#import "AFURLSessionManager.h"

@interface AFNetworkingLibrary : NSObject

-(NSData *)GET:(NSString*)HOST_URL;
-(NSData *)POST :(NSString*)HOST_URL :(NSDictionary*)params;
-(NSData *)POSTMultiPart :(NSString*)HOST_URL :(NSDictionary*)params :(NSString*)fileLocation;

@end
