//
//  InputValidationLibrary.m
//  InputValidationLibrary
//
//  Created by temp on 9/18/15.
//  Copyright (c) 2015 purnima. All rights reserved.
//

#import "InputValidationLibrary.h"
#import "CustomTypedefLibrary.h"
#import "LogLibrary.h"


@implementation InputValidationLibrary


-(int)validateTextField: (NSString *)textfieldName
                 asType: (NSString *)textfieldType
              withValue: (NSString *) textfieldValue
             asRequired: (BOOL) requireField
                  error: (NSString **) errorMessage
{
@try
{
    
    if(requireField == YES || requireField == TRUE)
    {
        if(! [self validatePresenceOfTextField:textfieldValue])
        {
            * errorMessage = [textfield stringByAppendingString :@" is a required field, Please enter the Value"];
            NSLog(@"%@",* errorMessage);
            
            return 0;
        }
    }
    if(! [self validateLengthOfTextField:textfieldValue])
    {
        NSString  * partOfStr = [textfieldName stringByAppendingString:  @" is either too low or too high"];
        
        * errorMessage = [@"Length of "stringByAppendingString: partOfStr  ];
        NSLog(@"%@",* errorMessage);
    
        return 0;
    }
    if (![self validateName:textfieldValue])
    {
        * errorMessage = [ textfieldNAme stringByAppendingString:@" must start with an alphabet and can not accept any special characters and numbers. "];
        NSLog(@"%@",* errorMessage);
        
        return 0;
    
    }
}
    @catch(NSException *exception)
    {
        [self writeExceptionToLogFile:exception];
    }
    
}


-(int)validatePassword: (NSString *)passwordValue Confirmation: (NSString *)confirmPassword asRequired:(BOOL)requireField error: (NSString **)errorMessage
{
    @try {
        if (requireField == YES || requireField == TRUE)
        {
            if(! [self validatePresenceOfTextField:passwordValue])
            {
                * errorMessage = @"Password is a required field, Please enter the Value";
                NSLog(@"%@",* errorMessage);
                
                return 0;
            }
            
            if(! [self validatePresenceOfTextField:confirmPassword])
            {
                * errorMessage = @" Confirm Password is a required field, Please enter the Value";
                NSLog(@"%@",* errorMessage);
                
                return 0;
            }
        }
        if (! [self validatePassword:passwordValue])
        {
            * errorMessage = @"Password should have atlest one Upper case, one Lower case, one Number,one Sepecial Character and length must be between 6 to 20 ";
                NSLog(@"%@",* errorMessage);
                
            return 0;

        }
        
        if (([self validatePassword:passwordValue]) && ([self validatePassword:confirmPassword]))
            BOOL passwordMatch = [passwordValue isEqualToString:confirmPassword];
        if (! passwordMatch )
        {
            * errorMessage = @"Password and Confirm Password should match, Please reenter.";
            NSLog(@"%@",* errorMessage);
            
            return 0;
        }

       
    }
    @catch (NSException *exception) {
        [self writeExceptionToLogFile:exception];
    }
    @finally {
       // <#Code that gets executed whether or not an exception is thrown#>
    }

}




-(BOOL) validatePhoneNumber: (NSString *)strPhoneNumber
{
    
    @try
    {
        if ([strPhoneNumber length]< TextDescMinLength || [strPhoneNumber length]>TextDescMaxLength)
        {   return FALSE;  }
        
        NSString *phoneRegex = @"^([0-9]*)$";
        
        NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
        
        BOOL isValid =[phoneTest evaluateWithObject:strPhoneNumber];
        
        return isValid;
        // Error Message would be @"InValid Phone Number! Please Enter the Phone number without any spaces 7 digits min and Max of 11 numbers "
        
    }
    @catch (NSException *exception)
    {
        // Print exception information
        NSLog( @"NSRangeException caught" );
        NSLog( @"Reason: %@", exception.reason );
        
    }
    @finally
    {
        // Cleanup, in both success and fail cases
        NSLog( @"In finally block");
        
        
    }
    
}




//-----------------------------------------------Private Methods ------------------------------------------

-(BOOL) validatePresenceOfTextField: (NSString *) textField
{
    @try
    {
        if ((textField.length > 0) && (textField))
        { return TRUE; }
        else
        { return FALSE;  }
    
    }
    @catch (NSException *exception)
    {
        [[[LogLibrary alloc]init]  writeToLogFile:[@"Exception Caught From: InputValidate Library: ValidatePresenceOfTextField Method" stringByAppendingString:exception.reason]];
    }
   
    
}
//----------------------------------------------------------------------------------------------------------

-(BOOL)validateLengthOfTextField: (NSString *) textField asType: (NSString *)textfieldType
{
    
@try
{
    int minLength = TextFieldMinLength;
    int maxLength = TextFieldMaxLength;
    
    if ((textField.length > minLength) && (textField.length < maxLength))
    {  return TRUE;  }
    else
    {  return FALSE ;}
}
@catch (NSException *exception)
{
   [[[LogLibrary alloc]init]  writeToLogFile:[@"Exception Caught From: InputValidateLibrary: ValidateLengthOfTextField Method" stringByAppendingString:exception.reason]];
}

}
//----------------------------------------------------------------------------------------------------------

-(BOOL)validateName:(NSString*)name
{
@try
{
    int minLength = TextFieldMinLength;
    int maxLength = TextFieldMaxLength;

    if (([name length] >= minLength) || ([name length ] <= maxLength))
    {
        NSString *nameRegex    = @"^[a-zA-Z][a-zA-Z0-9.,@_#-$;]+$";
        
        NSPredicate *nameTest  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
        
        return [nameTest evaluateWithObject:name];
    }
    else return false;
    
    // Error Message would be @"InValid FirstName or LastName must start with an alphabet,only takes .,@_#-$; special characters "
}
    @catch (NSException *exception)
    {
        // Print exception information
        NSLog( @"NSRangeException caught" );
        NSLog( @"Reason: %@", exception.reason );
        
    }
    @finally
    {
        // Cleanup, in both success and fail cases
        //NSLog( @"In finally block");
        
    }

    
}


-(BOOL)validateEmailAddress:(NSString *)email
{
@try
    {
    NSString *emailRegex    = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
    
    // Error Message could be @"InValid Email Address
    }
        @catch (NSException *exception)
        {
            // Print exception information
            NSLog( @"NSRangeException caught" );
            NSLog( @"Reason: %@", exception.reason );
            
        }
        @finally
        {
            // Cleanup, in both success and fail cases
            NSLog( @"In finally block");
            
            
        }
      
}

-(BOOL)validatePassword:(NSString *)password
{
    
@try
{
    if (([password length] >= TextPasswordMinLength ) || ([password length ] <= TextPasswordMaxLength))
    {
        NSString *passwordRegex    = @"^.*(?=.{6,})(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#-$%^_&+=]).*$";   //  @"\\b([a-zA-Z0-9]+)\\b";
        
        NSPredicate *passwordTest  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
        
        return [passwordTest evaluateWithObject:password];
    }
    else return false;
    
}
    @catch (NSException *exception)
    {
        // Print exception information
        NSLog( @"NSRangeException caught" );
        NSLog( @"Reason: %@", exception.reason );
        
    }
    @finally
    {
        // Cleanup, in both success and fail cases
        NSLog( @"In finally from Password validation block");
        
        
    }

}




-(NSString *)phoneNumberFormating: (NSString *)strPhoneNumber
{
    
@try
{
    if ([self validatePhoneNumber:strPhoneNumber])
    {
        
        switch ([strPhoneNumber length])
        {
            case 7:
                strPhoneNumber = [strPhoneNumber stringByReplacingOccurrencesOfString:@"(\\d{3})(\\d+)"
                                                                           withString:@"$1-$2"
                                                                              options:NSRegularExpressionSearch
                                                                                range:NSMakeRange(0, [strPhoneNumber length])];
                
                break;
            case 10:
                strPhoneNumber =  [strPhoneNumber stringByReplacingOccurrencesOfString:@"(\\d{3})(\\d{3})(\\d{4})"
                                                                            withString:@"($1)$2-$3"
                                                                               options:NSRegularExpressionSearch
                                                                                 range:NSMakeRange(0, [strPhoneNumber length])];
                
                break;
            case 11:
                
                
                strPhoneNumber =  [strPhoneNumber stringByReplacingOccurrencesOfString:@"(\\d{1})(\\d{3})(\\d{3})(\\d{4})"
                                                                            withString:@"+$1($2)$3-$4"
                                                                               options:NSRegularExpressionSearch
                                                                                 range:NSMakeRange(0, [strPhoneNumber length])];
                break;
                
            case 15:
                
                strPhoneNumber =  [strPhoneNumber stringByReplacingOccurrencesOfString:@"(\\d{3})(\\d{2})(\\d{3})(\\d{3})(\\d{4})"
                                                                            withString:@"$1 $2 $3-$4-$5"
                                                                               options:NSRegularExpressionSearch
                                                                                 range:NSMakeRange(0, [strPhoneNumber length])];
                break;
                
            default:
                strPhoneNumber =   [[strPhoneNumber componentsSeparatedByCharactersInSet:
                                     [[NSCharacterSet decimalDigitCharacterSet] invertedSet]]
                                    componentsJoinedByString:@""];
                
        }
        
        return strPhoneNumber;
    }
    else return @"Invalid Phone Number";
}
    @catch (NSException *exception)
    {
        // Print exception information
        NSLog( @"NSRangeException caught" );
        NSLog( @"Reason: %@", exception.reason );
        
    }
    @finally
    {
        // Cleanup, in both success and fail cases
        NSLog( @"In finally block");
        
        
    }
    
}


-(BOOL) validateDate:(NSString *) date
{
    
@try
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
    @catch (NSException *exception)
    {
        // Print exception information
        NSLog( @"NSRangeException caught" );
        NSLog( @"Reason: %@", exception.reason );
        
    }
    @finally
    {
        // Cleanup, in both success and fail cases
        NSLog( @"In finally block");
        
        
    }
    
}

-(void)writeExceptionToLogFile:( NSException *)exception
{
    NSString * exceptionSubString = @"\n ************************************************************************";
    
    NSString * exceptionSubString1 = [@" \n NSException Caught From Class: " stringByAppendingString: NSStringFromClass([self class])];
    
    NSString * exceptionSubString2 = [@" \n Method: " stringByAppendingString: NSStringFromSelector(_cmd)];
    
    NSString * exceptionSubString3 = [@" \n Exception: " stringByAppendingString: exception.reason];
    
    NSString * exceptionSubString4 = [@" \n FileName:  " stringByAppendingString: [[NSString stringWithUTF8String:__FILE__] lastPathComponent]];
    
    NSString * exceptionSubString5 = @"\n ************************************************************************";
    
    NSString * exceptionString1 = [ exceptionSubString stringByAppendingString:exceptionSubString1];
    NSString * exceptionString2 = [ exceptionSubString2 stringByAppendingString:exceptionSubString3];
    NSString * exceptionString3 = [ exceptionSubString4 stringByAppendingString:exceptionSubString5];
    
    [[[LogLibrary alloc]init]  writeToLogFile:[[exceptionString1 stringByAppendingString: exceptionString2] stringByAppendingString:exceptionString3]];
    

}




@end
