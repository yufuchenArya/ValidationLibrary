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
        NSDate *validDate = [format dateFromString:date];
        if (validDate != nil)
            return YES;
        else
            return NO;
    }
    @catch (NSException *exception) {
        [[[LogLibrary alloc]init]  writeToLogFile:[@"Exception Caught From: DateValidateLibrary: validateDate Method" stringByAppendingString:exception.reason]];
    }
    @finally {
        NSLog( @"In finally block");
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
        [[[LogLibrary alloc]init]  writeToLogFile:[@"Exception Caught From: DateValidateLibrary: distanceFrom Method" stringByAppendingString:exception.reason]];
    }
    @finally {
        NSLog( @"In finally block");
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
        [[[LogLibrary alloc]init]  writeToLogFile:[@"Exception Caught From: DateValidateLibrary: isFutureDateToToday Method" stringByAppendingString:exception.reason]];
    }
    @finally {
        NSLog( @"In finally block");
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
        [[[LogLibrary alloc]init]  writeToLogFile:[@"Exception Caught From: DateValidateLibrary: isPastDateToToday Method" stringByAppendingString:exception.reason]];
    }
    @finally {
        NSLog( @"In finally block");
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
        [[[LogLibrary alloc]init]  writeToLogFile:[@"Exception Caught From: DateValidateLibrary: isItToday Method" stringByAppendingString:exception.reason]];

    }
    @finally {
        NSLog( @"In finally block");
    }
}

-(BOOL) validateTime:(NSString *) time{
    @try {
        NSArray *temp = [time componentsSeparatedByString:@":"];
        if ([temp count] > 3 || [temp count] < 2) {
            return false;
        }
        
        NSString *h = [temp objectAtIndex:0];
        NSString *m = [temp objectAtIndex:1];
        NSString *s ;
        
        if([temp count] == 3){
            s = [temp objectAtIndex:2];
        }
        
        
        // Minutes and seconds must be of two digits. Hours, instead, might have any digits.
        if (m.length != 2) {
            return NO;
        }
        if (s.length != 2) {
            return NO;
        }
        
        // Check values are numeric.
        NSCharacterSet *num09 = [NSCharacterSet decimalDigitCharacterSet];
        if (![num09 isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:h]]) {
            return NO;
        }
        if (![num09 isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:m]]) {
            return NO;
        }
        if (![num09 isSupersetOfSet:[NSCharacterSet characterSetWithCharactersInString:s]]) {
            return NO;
        }
        
        // Minute and second values must be lesser than 60.
        if ([m integerValue] >= 60) {
            return NO;
        }
        if ([s integerValue] >= 60) {
            return NO;
        }
        
        return YES;
    }
    @catch (NSException *exception) {
        [[[LogLibrary alloc]init]  writeToLogFile:[@"Exception Caught From: DateValidateLibrary: validateTime Method" stringByAppendingString:exception.reason]];
    }
    @finally {
        NSLog( @"In finally block");
    }
}



@end
