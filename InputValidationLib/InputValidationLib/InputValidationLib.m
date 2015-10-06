//
//  InputValidationLib.m
//  InputValidationLib
//
//  Created by temp on 10/6/15.
//  Copyright © 2015 purnima. All rights reserved.
//

#import "InputValidationLib.h"
#import "LogLibrary.h"
#import "ErrorMessageLibrary.h"
#import "CustomTypedefLibrary.h"

@implementation InputValidationLib


-(BOOL)validateTextfield: (NSString *)textfieldName asTextfieldType: (NSString  *) textfieldType withValue: (NSString *)textfieldValue asRequired: (BOOL) requireField error: (NSString **)errorMessage
{
    
    NSLog(@"Came inside the method");
    NSString * error;
    @try
    {
        if(requireField == 1)
        {
            if(! ((textfieldValue.length > 0) && (textfieldValue)))
            {
                NSLog(@"Trying to check the presence");
                * errorMessage = [textfieldName stringByAppendingString: [[[ErrorMessageLibrary alloc]init]errorMessageForPresence] ];
                NSLog(@"%@",* errorMessage);
                
                return FALSE;
            }
            // else return TRUE;
        }
        int minLength,maxLength;
        // NSLog(@"The value of textfield type: %@, length %ld",textfieldType, textfieldType.length);
        NSLog(@"The value of textfield Value: %@",textfieldValue);
        // NSLog(@" string length %ld", @"TextFiedType".length);
        
        if ([textfieldType isEqualToString: @"TextFieldType"])
        {
            NSLog(@"Trying to check the length");
            NSString * textFieldRegex = @"^[a-zA-Z][a-z A-Z 0-9 ,.-_]*+$";
            minLength = TextFieldMinLength;
            maxLength = TextFieldMaxLength;
            NSLog(@"The min length and max length %d, %d ",minLength,maxLength );
            //  NSLog(@"The length of regular expression: %d",textFieldRegex.length);
            if(![self validateByTextfieldType:textfieldName withValue:textfieldValue minLength:minLength maxLength:maxLength forSpecialChar:textFieldRegex error: &error])
            {
                * errorMessage = error;
                NSLog(@"Error message in Top method: %@", error);
                return FALSE;
            }else return TRUE;
            
        }
        else if([textfieldType isEqualToString: @"TextAddressType"])
            
        {
            NSString * textAddressRegex = @"^\\d{1,5}\\s[a-z A-Z]*.[A-Z *2]\\d*";
            minLength = TextAddressMinLength;
            maxLength = TextAddressMaxLength;
            
            if(![self validateByTextfieldType:textfieldName withValue:textfieldValue minLength:minLength maxLength:maxLength forSpecialChar:textAddressRegex error:& error])
            {
                * errorMessage = error;
                NSLog(@"Error message in Top method: %@", error);
                return FALSE;
            }
        }
        else if([textfieldType isEqualToString:@"TextDescType"])
        {
            NSString * textDescRegex = @"^[a-z]*\\s[a-zA-Z0-9.,_-;@#]*+$";
            minLength = TextDescMinLength;
            maxLength = TextDescMaxLength;
            if(![self validateByTextfieldType:textfieldName withValue:textfieldValue minLength:minLength maxLength:maxLength forSpecialChar:textDescRegex error:&error])
            {
                * errorMessage = error;
                NSLog(@"Error message in Top method: %@", error);
                return FALSE;
            }
        }
        else if([textfieldType isEqualToString:@"TextPhoneType"])
        {
            NSString * textPhoneRegex = @"^([0-9]*)$";
            minLength = TextPhoneMinLength;
            maxLength = TextPhoneMaxLength;
            if(! [self validateByTextfieldType:textfieldName withValue:textfieldValue minLength:minLength maxLength:maxLength forSpecialChar:textPhoneRegex error:&error])
            {   * errorMessage = error;
                NSLog(@"Error message in Top method: %@", error);
                return FALSE;
            }
            
        }
        
        else if([textfieldType isEqualToString:@"TextEmailType"])
        {
            NSString * textEmailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
            minLength = TextEmailMinLength;
            maxLength = TextEmailMaxLength;
            if(![self validateByTextfieldType:textfieldName withValue:textfieldValue minLength:minLength maxLength:maxLength forSpecialChar:textEmailRegex error:&error])
            {    * errorMessage = error;
                NSLog(@"Error message in Top method: %@", error);
                return FALSE;
            }
            
            
            
            //   return [self  validateByTextfieldType :textfieldName withValue: textfieldValue minLength: minLength maxLength: maxLength ForSpecialChar: regularExpression error: errorMessage];
            
        }
        
    }
    @catch (NSException *exception)
    {
        [[[LogLibrary alloc]init] writeExceptionToLogFile:exception fromClass:NSStringFromClass([self class]) fromMethod: NSStringFromSelector(_cmd) ];
    }
    @finally
    {
        //<#Code that gets executed whether or not an exception is thrown#>
    }
    
}




-(BOOL)validateByTextfieldType:(NSString *)textfieldName withValue:(NSString *)textfieldValue minLength: (int)minLength maxLength: (int)maxLength forSpecialChar:(NSString *) regularExpression error: (NSString **)errorMessage
{
    NSLog(@"The value of textfield VAlue from library file: %@",textfieldValue);
    
    
    @try
    {
        // NSLog(@"regular expression: %@ length: %ld ",regularExpression, regularExpression.length);
        
        if (([textfieldValue length] >= minLength) && ([textfieldValue length ] <= maxLength))
        {
            NSString *nameRegex    = regularExpression;
            
            NSLog(@"Trying to check the length in lib file, min length: %d, and max length %d",minLength,maxLength );
            
            NSPredicate *specialCharTest  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
            
            if (![specialCharTest evaluateWithObject:textfieldValue])
            {
                * errorMessage = [textfieldName stringByAppendingString: @" can not have special char"]; //[[[ErrorMessageLibrary alloc]init]errorMessageForSpecialChar]];
                NSLog(@"Error message: %@", * errorMessage);
                
                
                //return errorMessage;
                return 0;
            }
        }
        else
        {
            NSString  * partOfStr = [textfieldName stringByAppendingString: @" length is too high or low"]; //[[[ErrorMessageLibrary alloc]init]errorMessageForLength]];
            
            * errorMessage = [@"Length of "stringByAppendingString: partOfStr  ];
            //return  errorMessage;
            return 0;
            
        }
    }
    @catch (NSException *exception)
    {
        [[[LogLibrary alloc]init] writeExceptionToLogFile:exception fromClass:NSStringFromClass([self class]) fromMethod: NSStringFromSelector(_cmd) ];
        
        NSLog(@"Exception caught in :%@ ", exception.reason);
        
    }
    @finally
    {
        // Cleanup, in both success and fail cases
        //NSLog( @"In finally block");
        
    }
    
    
}

-(BOOL)validatePassword: (NSString *)passwordValue Confirmation: (NSString *)confirmPassword asRequired:(BOOL)requireField error: (NSString **)errorMessage
{
    NSLog(@"Came inside the method");
    @try {
        if (requireField == 1)
        {
            if(! ((passwordValue.length > 0) && (passwordValue)))
            {
                * errorMessage = [@"Password" stringByAppendingString : @"is Invalid"]; //[[[ErrorMessageLibrary alloc]init]errorMessageForPresence] ];
                NSLog(@"%@",* errorMessage);
                
                return FALSE;
            }
            
            if(! ((confirmPassword.length > 0) && (confirmPassword)))
            {
                * errorMessage = [@" Confirm Password" stringByAppendingString :@"is Invalid"]; //[[[ErrorMessageLibrary alloc]init]errorMessageForPresence] ];
                NSLog(@"%@",* errorMessage);
                
                return FALSE;
            }
        }
        if (! [self validatePassword:passwordValue])
        {
            * errorMessage = @"Error message for password ";//[[[ErrorMessageLibrary alloc]init]errorMessageForPassword] ;
            NSLog(@"%@",* errorMessage);
            
            return FALSE;
            
        }
        
        if (([self validatePassword:passwordValue]) && ([self validatePassword:confirmPassword]))
            return  [passwordValue isEqualToString:confirmPassword];
        NSLog(@"Password Match, %d",[passwordValue isEqualToString:confirmPassword]);
        if (! [passwordValue isEqualToString:confirmPassword] )
        {
            * errorMessage = @"Both Passwords did not match"; //[[[ErrorMessageLibrary alloc]init]errorMessageForPasswordConfirmation];
            NSLog(@"%@",* errorMessage);
            
            return FALSE;
        }
        
        
    }
    @catch (NSException *exception) {
        // [self writeExceptionToLogFile:exception];
        [[[LogLibrary alloc]init] writeExceptionToLogFile:exception fromClass:NSStringFromClass([self class]) fromMethod: NSStringFromSelector(_cmd) ];
    }
    @finally {
        // <#Code that gets executed whether or not an exception is thrown#>
    }
    
}


-(BOOL)validatePassword:(NSString *)password
{
    
    @try
    {
        if (([password length] >= TextPasswordMinLength ) && ([password length ] <= TextPasswordMaxLength))
        {
            NSString *passwordRegex    = @"^.*(?=.{6,})(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#-$%^_&+=]).*$";   //  @"\\b([a-zA-Z0-9]+)\\b";
            
            NSPredicate *passwordTest  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
            
            return [passwordTest evaluateWithObject:password];
        }
        else return false;
        
    }
    @catch (NSException *exception)
    {
        //[self writeExceptionToLogFile:exception];
        [[[LogLibrary alloc]init] writeExceptionToLogFile: exception fromClass:NSStringFromClass([self class]) fromMethod: NSStringFromSelector(_cmd) ];
        
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
    @catch (NSException *exception)
    {
        // [self writeExceptionToLogFile:exception];
        [[[LogLibrary alloc]init] writeExceptionToLogFile:exception fromClass:NSStringFromClass([self class]) fromMethod: NSStringFromSelector(_cmd) ];
        
    }
    @finally
    {
        // Cleanup, in both success and fail cases
        // NSLog( @"In finally block");
        
    }
    
}




@end
