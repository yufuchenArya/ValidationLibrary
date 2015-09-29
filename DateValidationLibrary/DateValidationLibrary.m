//
//  DateValidationLibrary.m
//  DateValidationLibrary
//
//  Created by temp on 9/21/15.
//  Copyright (c) 2015 purnima. All rights reserved.
//

#import "DateValidationLibrary.h"

@implementation DateValidationLibrary

-(BOOL) validateDate:(NSString *) date
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateStyle:NSDateFormatterShortStyle];
    [format setDateFormat:@"MM/dd/yy"];
    NSDate *validateDOB = [format dateFromString:date];
    if (validateDOB != nil)
        return YES;
    else
        return NO;
}


- (NSDateComponents *) distanceFrom:(NSDate *)startDate to:(NSDate *)endDate
{
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *components = [gregorian components:unitFlags
                                                fromDate:startDate
                                                  toDate:endDate options:0];
    
    return components;
}


-(BOOL) isFutureDateToToday:(NSDate *)date
{
    NSDateComponents * difference = [self distanceFrom:date to:[NSDate  date]];
    if ([difference year] < 0 || [difference month] < 0 || [difference day] < 0  )
    {
        return YES;
    }
    else return NO;
}

-(BOOL) isPastDateToToday:(NSDate *)date
{
    NSDateComponents * difference = [self distanceFrom:date to:[NSDate  date]];
    if ([difference year] > 0 || [difference month] > 0 || [difference day] > 0  )
    {
        return YES;
    }
    else return NO;
}

-(BOOL) isItToday:(NSDate *)date
{
    NSDateComponents * difference = [self distanceFrom:date to:[NSDate  date]];
    if ([difference year] == 0 && [difference month] == 0 && [difference day] == 0  )
    {
        return YES;
    }
    else return NO;
}


@end
