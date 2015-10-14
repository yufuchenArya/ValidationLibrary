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

-(BOOL) validateDate:(NSDate *) date :(NSString *) dateFormat
{
    @try {
        
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateStyle:NSDateFormatterShortStyle];
        [format setDateFormat:dateFormat];
        NSDate *validDate = [format dateFromString:date];
        if (validDate != nil)
            return YES;
        else
            return NO;
    }
    @catch (NSException *exception) {
        [[[LogLibrary alloc]init] writeToLogFile:exception.reason inFilePath:@"filePath"];
        
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
        [[[LogLibrary alloc]init] writeToLogFile:exception.reason inFilePath:@"filePath"];
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
        [[[LogLibrary alloc]init] writeToLogFile:exception.reason inFilePath:@"filePath"];
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
        [[[LogLibrary alloc]init] writeToLogFile:exception.reason inFilePath:@"filePath"];
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
        [[[LogLibrary alloc]init] writeToLogFile:exception.reason inFilePath:@"filePath"];

    }
    @finally {
        NSLog( @"In finally block");
    }
}

-(BOOL) validateTime:(NSString *) time :(BOOL)isCountingTime :(BOOL)is24HourSystem{
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
        if (!isCountingTime) {
            if (h.length !=2) {
                return NO;
            }
            if ([h integerValue] > 12 && !is24HourSystem) {
                return NO;
            }
            if ([h integerValue] >= 24 && is24HourSystem) {
                return NO;
            }
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
        [[[LogLibrary alloc]init] writeToLogFile:exception.reason inFilePath:@"filePath"];
    }
    @finally {
        NSLog( @"In finally block");
    }
}

-(NSString *) transferToUTCTime:(NSDate *) timeValue withZone:(BOOL)value{
    @try {
        NSString * dateFormat =@"MM-dd-yyyy HH:mm:ss";
        
        if (value) {
            dateFormat =@"MM-dd-yyyy HH:mm:ss zzz";
        }
        
        NSDateFormatter *inputFormat = [[NSDateFormatter alloc] init];
        NSTimeZone *localZone = [NSTimeZone localTimeZone];
        [inputFormat setTimeZone:localZone];
        [inputFormat setDateFormat:dateFormat];
        
        NSString * time = [inputFormat stringFromDate:timeValue];
        NSDate * Localtime = [inputFormat dateFromString:time];
        
        NSDateFormatter * outputFormat = [[NSDateFormatter alloc]init];
        NSTimeZone * UTCtime = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
        [outputFormat setTimeZone:UTCtime];
        [outputFormat setDateFormat:dateFormat];
        
        NSString * UTC_String = [outputFormat stringFromDate:Localtime];
        
        return UTC_String;
        
    }
    @catch (NSException *exception) {
        [[[LogLibrary alloc]init] writeToLogFile:exception.reason inFilePath:@"filePath"];
    }
    @finally {
        NSLog( @"In finally block");
    }
}

-(NSString *) displayInLocaleFormat:(NSDate *)timeValue{
    @try {
        NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
        NSLocale * locale = [NSLocale currentLocale];
        NSString * dateComponents = @"ddMMyyyy hhmmss";
        NSString* format = [NSDateFormatter dateFormatFromTemplate:dateComponents options:0 locale:locale];
        [dateFormatter setLocale:locale];
        [dateFormatter setDateFormat:format];
        
        NSString *newDateString = [dateFormatter stringFromDate:timeValue];
        
        return newDateString;
    }
    @catch (NSException *exception) {
        [[[LogLibrary alloc]init] writeToLogFile:exception.reason inFilePath:@"filePath"];
    }
    @finally {
        NSLog( @"In finally block");
    }
}




@end
