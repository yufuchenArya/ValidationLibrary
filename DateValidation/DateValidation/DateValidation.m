//
//  DateValidation.m
//  DateValidation
//
//  Created by Brian Chen on 9/28/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import "DateValidation.h"

@implementation DateValidation

- (NSString *)changeToStandardTime:(NSTimeInterval)timeInterval{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *time = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:timeInterval]];
    return time;
}

@end
