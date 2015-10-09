//
//  API_Client.m
//  SpliroTesting
//
//  Created by Brian Chen on 10/6/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import "API_Client.h"

static NSString * const API_BaseURL_String = @"http://182.237.17.106:8080/spliro/sitedev/api/web/v2/index/index?";

@implementation API_Client

+(instancetype)SharedClient{
    
    static API_Client * _shareClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _shareClient = [[API_Client alloc]initWithBaseURL:[NSURL URLWithString:API_BaseURL_String]];
        
    });
    return _shareClient;
}

@end
