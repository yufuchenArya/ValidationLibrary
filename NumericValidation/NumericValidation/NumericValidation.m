//
//  NumericValidation.m
//  NumericValidation
//
//  Created by Brian Chen on 9/28/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import "NumericValidation.h"
#import "LogLibrary.h"

@implementation NumericValidation

-(BOOL) isNumber:(NSString *)value{
    @try {
//        BOOL valid;
//        //  Checking String value is including character or not, Number return TRUE.
//        NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
//        NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:value];
//        valid = [alphaNums isSupersetOfSet:inStringSet];
//        if (!valid) {
//            return false;
//        }
//        else{
//            return true;
//        }
        
        NSString * numberRegex = @"^(?:|-)(?:|0|[1-9]\\d*)(?:\\.\\d*)?$";
        NSPredicate * numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
        return [numberTest evaluateWithObject:value];
    }
    @catch (NSException *exception) {
        [[[LogLibrary alloc]init]  writeToLogFile:[@"Exception Caught From: InputValidateLibrary: ValidateLengthOfTextField Method" stringByAppendingString:exception.reason]];
    }
    @finally {
        
    }
}

-(BOOL) positiveNumber:(NSString *) value{
    @try {
        //  Clearn Charater and Symbol.
        NSString *cleanedString = [[value componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789-"] invertedSet]] componentsJoinedByString:@""];
        //  Change NSString value to type NSNumber.
        double number = [cleanedString doubleValue];
        
        if (number >= 0) {
            return true;
        }
        else{
            return false;
        }
    }
    @catch (NSException *exception) {
        [[[LogLibrary alloc]init]  writeToLogFile:[@"Exception Caught From: InputValidateLibrary: ValidateLengthOfTextField Method" stringByAppendingString:exception.reason]];
    }
    @finally {
        
    }
}

-(BOOL) isRangedNumber:(NSString *) value :(NSString *)minValue :(NSString *)maxValue{
    @try {
        //  Clearn Charater and Symbol.
        NSString *cleanedString = [[value componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789-"] invertedSet]] componentsJoinedByString:@""];
        //  Change NSString value to type NSNumber.
        double number = [cleanedString doubleValue];
        double min = [minValue doubleValue];
        double max = [maxValue doubleValue];
        
        if (number < min || number > max) {
            return false;
        }
        else{
            return true;
        }
    }
    @catch (NSException *exception) {
        [[[LogLibrary alloc]init]  writeToLogFile:[@"Exception Caught From: InputValidateLibrary: ValidateLengthOfTextField Method" stringByAppendingString:exception.reason]];
    }
    @finally {
        
    }
}

-(NSString *) decimalNumber:(NSString *) value :(NSInteger) numberOfDecimal{
    @try {
        //  Clearn Charater and Symbol.
        NSString *cleanedString = [[value componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789-"] invertedSet]] componentsJoinedByString:@""];
        //  Change NSString to NSNumber.
        NSNumberFormatter * formatter = [[NSNumberFormatter alloc]init];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *number = [formatter numberFromString:cleanedString];
        
        //  Change NSNumber to Double.
        double decNumber = [number doubleValue];
        //  Change Double to NSNumber.
        NSNumber* result = [[NSNumber alloc]  initWithDouble:decNumber];
        [formatter setMaximumFractionDigits:numberOfDecimal];
        [formatter setMinimumFractionDigits:0];
        //  Change NSNumber to NSString.
        value = [formatter stringFromNumber:result];
        
        return value;
    }
    @catch (NSException *exception) {
        [[[LogLibrary alloc]init]  writeToLogFile:[@"Exception Caught From: InputValidateLibrary: ValidateLengthOfTextField Method" stringByAppendingString:exception.reason]];
    }
    @finally {
        
    }
}

@end
