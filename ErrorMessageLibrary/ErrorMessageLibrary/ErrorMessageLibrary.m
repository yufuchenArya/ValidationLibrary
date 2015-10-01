//
//  ErrorMessageLibrary.m
//  ErrorMessageLibrary
//
//  Created by temp on 9/20/15.
//  Copyright (c) 2015 purnima. All rights reserved.
//

#import "ErrorMessageLibrary.h"

@implementation ErrorMessageLibrary

-(NSString *)errorMessageForPresence
{

    return @" is a required Field, Please enter the value for it";
}

- (NSString *)errorMessageForLength
{
    return  @" either it is too long or too short, Please correct the length" ;
}


- (NSString *)errorMessageForPhoneNumber
{
    return @" InValid Phone Number! Please Enter the Phone number without any spaces 7 digits min and Max of 15 numbers ";
}


- (NSString *)errorMessageForPassword
{
    return @"InValid Password, must have one Upper case one Lower case, one Number,one Sepecial Character and length must be atlest 6";
}

- (NSString *)errorMessageForSpecialChar
{
   return @" must start with an alphabet,only takes .,@_#-$; special characters ";

}

- (NSString *)errorMessageForEmailAddress
{
    return @"InValid Email Address";
}

- (NSString *)errorMessageForPasswordConfirmation
{
    return @"Password did not match, Please try again";
}





@end
