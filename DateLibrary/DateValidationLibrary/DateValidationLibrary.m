//
//  DateValidationLibrary.m
//  DateValidationLibrary
//
//  Created by temp on 9/21/15.
//  Copyright (c) 2015 purnima. All rights reserved.
//

#import "DateValidationLibrary.h"
#import "LogLibrary.h"

@implementation DateValidationLibrary

-(BOOL) validateDate:(NSString *) date
{
    @try {
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateStyle:NSDateFormatterShortStyle];
        [format setDateFormat:@"MM/dd/yy"];
        NSDate *validateDOB = [format dateFromString:date];
        if (validateDOB != nil)
            return YES;
        else
            return NO;
    }
    @catch (NSException *exception) {
        [[[LogLibrary alloc]init]  writeToLogFile:[@"Exception Caught From: DateValidateLibrary: ValidateLengthOfTextField Method" stringByAppendingString:exception.reason]];
    }
    @finally {
        
    }
}


- (NSDateComponents *) distanceFrom:(NSDate *)startDate to:(NSDate *)endDate
{
    @try {
        NSCalendar *gregorian = [[NSCalendar alloc]
                                 initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        
        NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
        
        NSDateComponents *components = [gregorian components:unitFlags
                                                    fromDate:startDate
                                                      toDate:endDate options:0];
        
        return components;
    }
    @catch (NSException *exception) {
        [[[LogLibrary alloc]init]  writeToLogFile:[@"Exception Caught From: InputValidateLibrary: ValidateLengthOfTextField Method" stringByAppendingString:exception.reason]];
    }
    @finally {
        
    }
}


-(BOOL) isFutureDateToToday:(NSDate *)date
{
    @try {
        NSDateComponents * difference = [self distanceFrom:date to:[NSDate  date]];
        if ([difference year] < 0 || [difference month] < 0 || [difference day] < 0  )
        {
            return YES;
        }
        else return NO;
    }
    @catch (NSException *exception) {
        [[[LogLibrary alloc]init]  writeToLogFile:[@"Exception Caught From: InputValidateLibrary: ValidateLengthOfTextField Method" stringByAppendingString:exception.reason]];
    }
    @finally {
        
    }
}

-(BOOL) isPastDateToToday:(NSDate *)date
{
    @try {
        NSDateComponents * difference = [self distanceFrom:date to:[NSDate  date]];
        if ([difference year] > 0 || [difference month] > 0 || [difference day] > 0  )
        {
            return YES;
        }
        else return NO;
    }
    @catch (NSException *exception) {
        [[[LogLibrary alloc]init]  writeToLogFile:[@"Exception Caught From: InputValidateLibrary: ValidateLengthOfTextField Method" stringByAppendingString:exception.reason]];

    }
    @finally {
        
    }
}

-(BOOL) isItToday:(NSDate *)date
{
    @try {
        NSDateComponents * difference = [self distanceFrom:date to:[NSDate  date]];
        if ([difference year] == 0 && [difference month] == 0 && [difference day] == 0  )
        {
            return YES;
        }
        else return NO;
    }
    @catch (NSException *exception) {
        [[[LogLibrary alloc]init]  writeToLogFile:[@"Exception Caught From: InputValidateLibrary: ValidateLengthOfTextField Method" stringByAppendingString:exception.reason]];

    }
    @finally {
        
    }
}


@end
