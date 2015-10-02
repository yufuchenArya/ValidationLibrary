//
//  DateValidationLibrary.h
//  DateValidationLibrary
//
//  Created by temp on 9/21/15.
//  Copyright (c) 2015 purnima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateValidationLibrary : NSObject

-(BOOL) validateDate:(NSString *) date; // if the date is in MM/dd/YY format and is valid returns YES else returns NO

- (NSDateComponents *) distanceFrom:(NSDate *)startDate to:(NSDate *)endDate;

// returns difference between two dates in number of years, months, days. Need to extract these values as [components year],[components month], [components day]

// better to validate both the date inputs before other wise the values of components will be zeros


-(BOOL) isFutureDateToToday:(NSDate *)date; //returns YES if given date is going to be future to today's date else NO

-(BOOL) isPastDateToToday:(NSDate *)date; //returns YES if given date was past to today's date else NO

-(BOOL) isItToday:(NSDate *)date; //returns YES if given date is equal to today's date else NO

-(BOOL) validateTime:(NSString *) time;

-(NSString *) transferToUTCTime:(NSDate *) timeValue withZone:(BOOL)value;

-(NSString *) displayInLocaleFormat:(NSDate *)timeValue;

@end
