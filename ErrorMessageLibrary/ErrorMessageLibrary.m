//
//  ErrorMessageLibrary.m
//  ErrorMessageLibrary
//
//  Created by temp on 9/20/15.
//  Copyright (c) 2015 purnima. All rights reserved.
//

#import "ErrorMessageLibrary.h"

@implementation ErrorMessageLibrary

-(NSString *)errorForValidatePresenceOfTextField:(id) textfield
{

    return @"This is a required Field, Please enter Value for it";
}

- (NSString *)errorForLength
{
    return  @"Either it is too long or too short, Please correct the length" ;
}


- (NSString *)errorForPhoneNumber
{
    return @"InValid Phone Number! Please Enter the Phone number without any spaces 7 digits min and Max of 11 numbers ";
}


- (NSString *)errorForPassword
{
    return @"InValid Password, must have one Upper case one Lower case, one Number,one Sepecial Character and length must be atlest 6";
}

- (NSString *)errorForFirstAndLastName
{
   return @"InValid FirstName or LastName must start with an alphabet,only takes .,@_#-$; special characters ";

}

- (NSString *)errorForEmailAddress
{
    return @"InValid Email Address";
}

- (NSString *)errorForPasswordConfirmation
{
    return @"Password did not match, Please try again";
}





@end
